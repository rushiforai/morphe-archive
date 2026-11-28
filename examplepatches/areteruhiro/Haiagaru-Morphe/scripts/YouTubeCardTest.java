package app.morphe.extension.chmate;
public class YouTubeCardTest {
 public static void main(String[] args){
  String id="jNQXAC9IVRw";int n=0;
  for(String url:new String[]{"https://youtu.be/"+id,"https://www.youtube.com/watch?v="+id+"&t=2","https://m.youtube.com/shorts/"+id,"https://www.youtube.com/embed/"+id,"https://www.youtube.com/live/"+id}){
   if(!id.equals(YouTubeCard.id(url)))throw new AssertionError(url);n++;
  }
  for(String url:new String[]{"https://notyoutube.com/watch?v="+id,"https://youtube.com.example.org/watch?v="+id,"https://youtu.be/short","https://youtube.com/watch?v=../../bad"}){
   if(YouTubeCard.id(url)!=null)throw new AssertionError(url);n++;
  }
  System.out.println("PASS "+n+" YouTube URL cases");
 }
}
