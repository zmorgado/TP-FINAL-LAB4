<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import ="Dominio.Curso" %>
        <%@page import ="Dominio.Usuario" %>
    <%@page import ="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>

<link rel="stylesheet" href="Styles/Styles.css" />
<link rel="stylesheet" href="Styles/mini-lib.css" />

<body>

<main class="main-container">

   <nav class="navbar navbar-expand-lg navbar-dark full-width flex-center-container"> 
  
  <div class="container-fluid max-width-container">
  
    <a class="navbar-brand flex-center-container" href="#">
    	<img src="Assets/logo.png" />
    </a>
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      
        <li class="nav-item">
           <a class="nav-link active" aria-current="page" href="servletHome">Home</a>
        </li>
      </ul>
      
        <%

   Usuario usuario = (Usuario)session.getAttribute("usuario");

%>
      
      <form class="flex-evenly-container align-items-center" method ="Post" action="servletCerrarSession">
        <h5 class="user-name"><%=usuario.getUser_Name() %></h5>
        <input class="btn accent" type="submit" value="Cerrar sesi�n"/>
      </form>
      
    </div>
  </div>
      
    </div>
  </div>
  
</nav>
<!-- Fin navbar -->

<%
  if(request.getAttribute("action")!=null){
	  
	  
	  %>
	  
	  
		  <div class="modal fade show mt-5" id="modal" style="display:block;" tabindex="1" aria-labelledby="exampleModalLabel" aria-hidden="false">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" style="color:green" id="exampleModalLabel">Success!</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body" style="color:black">
	         <%=request.getAttribute("action") %>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="btnCerrar" class="btn btn-warning" data-bs-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	 
	  <% 
	  
	  request.removeAttribute("action");
  }

%>







<%
ArrayList<Curso> listaCursos = new ArrayList<Curso>();
listaCursos = (ArrayList<Curso>)request.getAttribute("listaCursos"); 

%>




<div class="container">
   <div class="row justify-content-center mb-3">
            <div class="col-md-4 mt-3"  style="text-align:center; border-radius: 20px;">
                <h1>CURSOS</h1>
            </div>
        </div>
        
        
       <div class="row">
       
       
       <%
       
       for(Curso curso : listaCursos)
    	   
       {
    	   %>
    	    <div class="col-md-6 mt-4">
	         <div class="card" style="background: #1a2639">
				  <div class="card-body">
				    <h5 class="card-title h2" style="color:orange" ><%=curso.getNombre() %></h5>
				    <p class="card-text">Materia: <%=curso.getMateria().getNombreMateria() %></p>
				    <p class="card-text">Semestre: <%=curso.getSemestre() %></p>
				    <p class="card-text">A�o: <%=curso.getAnio() %></p>
				    <p class="card-text">Docente: <%=curso.getDocente().getNombre() %>  <%=curso.getDocente().getApellido() %></p>
				    <a href="ServletListarCalificaciones?id=<%=curso.getIdCurso()%>" class="btn btn-primary">Ver calificaciones</a>
				  </div>
	             </div>
            </div> 
            
            <br/>
        <br/>
         <br/>
    	   
    	   <%
    	   
    	   
       }
       
      
       %>
      
         
       </div>
              
</div>

<br/>
<br/>
<br/>
<br/>
 <div class="row">
           <a href="servletAgregarCurso" class="btn btn-success">Agregar</a>
         </div>


<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <script>

$('#btnCerrar').click(function(){ 
   $('#modal').hide();
});

</script>
</html>
