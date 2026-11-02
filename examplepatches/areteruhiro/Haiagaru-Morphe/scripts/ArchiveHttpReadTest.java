package app.morphe.extension.chmate;
import com.sun.net.httpserver.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import java.io.*;
public final class ArchiveHttpReadTest{
 public static void main(String[] a)throws Exception{
  HttpServer server=HttpServer.create(new InetSocketAddress("127.0.0.1",0),0);server.createContext("/",e->{try{String p=e.getRequestURI().getPath();
   if(p.equals("/ok")){byte[] body="native DAT<>test".getBytes(StandardCharsets.UTF_8);e.sendResponseHeaders(200,body.length);e.getResponseBody().write(body);}
   else if(p.equals("/missing"))e.sendResponseHeaders(308,-1);
   else{e.getResponseHeaders().set("Location",p.equals("/loop")?"/loop":"/ok");e.sendResponseHeaders(p.equals("/loop")?308:Integer.parseInt(p.substring(1)),-1);}
  }finally{e.close();}});server.start();int checks=0;String base="http://127.0.0.1:"+server.getAddress().getPort();
  try{
   for(int status:new int[]{301,302,303,307,308}){if(!new String(ArchiveHttpRead.read(base+"/"+status,100),StandardCharsets.UTF_8).equals("native DAT<>test"))throw new AssertionError(status);checks++;}
   for(String path:new String[]{"/loop","/missing"}){try{ArchiveHttpRead.read(base+path,100);throw new AssertionError(path);}catch(ProtocolException expected){checks++;}}
   try{ArchiveHttpRead.read(base+"/ok",2);throw new AssertionError("size limit");}catch(IOException expected){checks++;}
   System.out.println("PASS "+checks+" archive GET redirect/loop/size checks");
  }finally{server.stop(0);}
 }
}