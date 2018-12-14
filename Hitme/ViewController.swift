//
//  ViewController.swift
//  Hitme
//
//  Created by yugandar a on 10/12/18.
//  Copyright © 2018 yugandar a. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentvalue:Int = 0;
    var targetvalue: Int = 0;
    
    var score = 0
    var round = 1
    
    
    
    @IBOutlet weak var slider:UISlider!
    @IBOutlet weak var targetlablel:UILabel!
    @IBOutlet weak var scorelabel:UILabel!
    @IBOutlet weak var roundlabel:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundvalue = slider.value.rounded()
        currentvalue = Int(slider.value)
        startRound()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func showAlert(){
        
        let diiference = abs(targetvalue-currentvalue)
        var points = 100 - diiference
        
        score += points
        
        let title :String
        
        if diiference == 0{
            title = "Perfect!"
            points += 100
        }else if diiference < 5{
            
            title = "You almost done!"
            
            points += 50
            
        }else if diiference < 10{
            title = "Pretty Good!"
            points += 10
        }else{
            title = "Not Even"
        }
        

        let alert = UIAlertController.init(title: title, message: "Current Value is :\(currentvalue)"+"\n Target value is :\(targetvalue)", preferredStyle: .alert)
        
        let action = UIAlertAction.init(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        round += 1
        startRound()
        present(alert,animated: true,completion: nil)
        
    }
    
    @IBAction func moveSlider(_slider:UISlider){
        
        let roundvalue = _slider.value.rounded()
        
        currentvalue = Int(_slider.value)
    
    }
    
    func startRound() {

        targetvalue = Int.random(in: 1...100)
        currentvalue = 50
        slider.value = Float(currentvalue)
        showLabel()

    }
    
    @IBAction func showLabel(){
        
        targetlablel.text = String(targetvalue)
        scorelabel.text = String(score)
        roundlabel.text = String(round)
        
        
    }
    
    

}

