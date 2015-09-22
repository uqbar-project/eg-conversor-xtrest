package org.uqbar.conversor

import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post

/**
 * 
 * @author jfernandes
 */
@Controller
class ConversorController {
	
	@Get("/conversor")
	def index() {
		val data = #{
			"millas" -> "0",
			"kilometros" -> "<< introducir millas >>"
		}
		render('conversor.html', data)
	}
	
	@Post("/convertir")
	def convertir(String millas) {
		render('conversor.html', #{
			"millas" -> millas,
			"kilometros" -> Integer.valueOf(millas) * 1.609344
		})
	}
	
	def static void main(String[] args) {
		XTRest.start(ConversorController, 9000)
	}
	
}