package app.morphe.extension.chmate;
import java.nio.file.*;import java.util.*;import java.io.*;

/** Real mobile news layout plus isolated counters/ad/header/foreign-board regressions. */
public final class SiteBoardListLayoutsTest {
 static int checks;static void ok(boolean value,String label){if(!value)throw new AssertionError(label);checks++;}
 static String card(String board,String id,String title,String time){return "<li><a href='/thr_res/acode=1/ctgid=137/bid="+board+"/tid="+id+"/tp=1/'><div class=imgbody><div class=title>"+title+"</div><div class=time>"+time+"</div></div></a></li>";}
 static String counts(String replies){return "1分前<span class=thrimg_chart_space><i></i></span><span>999999</span><span class=thrimg_comment_space><i></i></span><span>"+replies+"</span>";}
 public static void main(String[] args)throws Exception{
  var board=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=1/ctgid=137/bid=1150/");
  var actual=SiteBoardProtocol.topics(board,Files.readString(Path.of(args[0])));ok(actual.size()==10,"all ten real mobile news rows");var first=actual.stream().filter(t->t.id.equals("13608029")).findFirst().orElseThrow();ok(first.count==44,"real 43 replies plus OP rather than view count");ok(!first.title.contains("分前")&&!first.title.contains("1735"),"title excludes time and views");
  String sample="<div class=headerNews>"+card("1150","99","header",counts("9"))+"</div><div class=thr_list><ul>"+card("1150","1","<b>sample</b>",counts("0"))+card("1150","2","comma",counts("1,234"))+card("9999","3","other board",counts("8"))+card("1150","4","no reply counter","<span>99999</span>")+card("1150","5","invalid",counts("1,2"))+card("1150","6","too large",counts("999,999,999"))+card("1150","1","duplicate",counts("8"))+"</ul></div>";
  var rows=SiteBoardProtocol.topics(board,sample);ok(rows.size()==2,"skip header/foreign-board/missing or invalid counter and deduplicate");ok(rows.get(0).title.equals("sample")&&rows.get(0).count==1,"zero replies retains OP and plain title");ok(rows.get(1).count==1235,"grouped reply counter excludes views");
  try{SiteBoardProtocol.topics(board,"<div class=headerNews>"+card("1150","9","advertisement",counts("8"))+"</div>");throw new AssertionError("header is not a board list");}catch(IOException expected){checks++;}
  var legacy=SiteBoardProtocol.address("https://bakusai.com/thr_tl/acode=1/ctgid=137/bid=5071/");var old=SiteBoardProtocol.topics(legacy,Files.readString(Path.of(args[1])));ok(old.stream().anyMatch(t->t.id.equals("13601530")&&t.count>=17),"legacy table remains supported");
  System.out.println("PASS "+checks+" mobile/legacy board-list layout and counter checks; real mobile rows="+actual.size());
 }
}
