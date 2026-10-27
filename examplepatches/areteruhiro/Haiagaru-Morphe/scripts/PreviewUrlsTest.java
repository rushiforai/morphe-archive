package app.morphe.extension.chmate;
import java.util.*;
public final class PreviewUrlsTest {
 static int checks;
 static void check(boolean ok,String text){if(!ok)throw new AssertionError(text);checks++;}
 public static void main(String[] args){
  String news="news.yahoo.co.jp/articles/07aad05fddc054aaa796a565184505e101616415";
  for(String prefix:new String[]{"https://","ttps://","tps://","ttp://","tp://","//",""}){
   check(PreviewUrls.normalize(prefix+news).equals("https://"+news),"normalize "+prefix);
   check(PreviewUrls.extract("記事 "+prefix+news+"。",8).equals(List.of("https://"+news)),"extract "+prefix);
  }
  String timetable="timetable.jr-odekake.net/train-timetable/421?date=20261026";
  check(PreviewUrls.extract(timetable,8).equals(List.of("https://"+timetable)),"requested timetable");
  check(PreviewUrls.normalize("http://example.org/a").equals("http://example.org/a"),"explicit HTTP preserved");
  for(String bad:new String[]{"file:///a.gif","javascript:alert(1)","https://user:pw@example.org/a.gif","not a URL","https://",null})
   check(PreviewUrls.normalize(bad)==null,"reject invalid "+bad);
  for(String body:new String[]{"mail@example.org","ftp://example.org/a.gif","javascript:example.org/a.gif","xhttps://example.org/a.gif"})
   check(PreviewUrls.extract(body,8).isEmpty(),"no embedded email/scheme: "+body);
  check(PreviewUrls.extract("tps://example.org/a?x=1&amp;y=2 https://example.org/a?x=1&y=2",8).equals(List.of("https://example.org/a?x=1&y=2")),"deduplicate normalized URLs");
  for(String prefix:new String[]{"https://","tps://","ttps://",""})
   check(Arrays.equals(GifAutoFetchPolicy.extract(prefix+"i.imgur.com/1njSh1v.gif"),new String[]{"https://i.imgur.com/1njSh1v.gif"}),"GIF abbreviated "+prefix);
  check(!GifAutoFetchPolicy.supported("https://example.org/a.gifv"),"GIFV is not GIF");
  check(PreviewUrls.extract("example.org/a example.com/b",1).size()==1,"bounded extraction");
  System.out.println("PASS "+checks+" URL/GIF abbreviation cases");
 }
}
