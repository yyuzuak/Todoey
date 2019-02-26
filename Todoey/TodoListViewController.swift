//
//  ViewController.swift
//  Todoey
//
//  Created by mitat yasin yüzüak on 20.02.2019.
//  Copyright © 2019 mitat yasin yüzüak. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["item1","item2","item3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: Tableview Datasource View Modal -->

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
        
    }
    //Array Initialization to Tableview
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //decleration of cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        //assign array items to tableview cells
        cell.textLabel?.text = itemArray[indexPath.row]
        
        //function need returning item which is cell
        return cell
    }
    
    //MARK: Tableview Delegate Methods -->
    
    //add delegate method that detects which row selected - enable row selection
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //*** print(itemArray[indexPath.row])
       
        // add checkmark accesory to row
        //check whether selected row has a checkmark or not
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        }
        
        //Animation of indexpath
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //MARK: Add new items to Todoey List -->
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new item to Todoey list", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen when user clicks add item button
            
            self.itemArray.append(textField.text!)
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

