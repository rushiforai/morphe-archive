package app.morphe.extension.chmate;
import java.util.*;
public final class RulesTest {
 static int count;static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);count++;}
 public static void main(String[] args){
  check(GlobalTitleSearchRules.matches("ＨＡＩＡＧＡＲＵ 更新","haiagaru 更新"),"NFKC case and AND");
  check(!GlobalTitleSearchRules.matches("Haiagaru 更新","haiagaru -更新"),"excluded token");
  check(GlobalTitleSearchRules.matches("test board title","\"board title\""),"quoted phrase");
  check(!GlobalTitleSearchRules.matches("test board title","\"title board\""),"phrase order");
  check(!GlobalTitleSearchRules.matches("anything",""),"empty query");
  check(GlobalTitleSearchRules.threadUrl("https://bbs.eddibb.cc/liveedge/","1792624518").equals("https://bbs.eddibb.cc/test/read.cgi/liveedge/1792624518/"),"Edge thread link");
  check(GlobalTitleSearchRules.threadUrl("https://aoi.bbspink.com/pinkplus/","1792624518").contains("/test/read.cgi/pinkplus/1792624518/"),"PINK thread link");
  check(GlobalTitleSearchRules.threadUrl("https://jbbs.shitaraba.net/game/123/","1792624518").equals("https://jbbs.shitaraba.net/bbs/read.cgi/game/123/1792624518/"),"Shitaraba thread link");
  check(GlobalTitleSearchRules.threadUrl("https://kanto.machi.to/kanto/","1792624518").contains("/bbs/read.cgi/kanto/"),"Machi thread link");
  Set<String> urls=new HashSet<>();GlobalTitleSearchRules.existing("ff2ch\t\nHaiagaru\t20\thttps://bbs.eddibb.cc/test/read.cgi/liveedge/1792624518/\n",urls);
  StringBuilder out=new StringBuilder();
  GlobalTitleSearchRules.append(out,"1792624518.dat<>Haiagaru duplicate (20)\n1792624519.dat<>HAIAGARU 新着 (103)\n1792624520.dat<>無関係 (500)\ninvalid\n1792624521.dat<>Haiagaru\ttab (2)\n","https://bbs.eddibb.cc/liveedge/","Haiagaru",urls,t->t);
  check(out.toString().contains("\t103\t"),"three-digit reply count retained");
  check(!out.toString().contains("duplicate"),"native result deduplicated");
  check(!out.toString().contains("無関係"),"nonmatch excluded");
  check(out.toString().contains("Haiagaru tab\t2\t"),"TSV tabs sanitized");
  check(out.toString().split("\n").length==2,"correct two external rows");
  StringBuilder shita=new StringBuilder();GlobalTitleSearchRules.append(shita,"1792624522.cgi,Haiagaru (3)\n","https://jbbs.shitaraba.net/game/123/","haiagaru",new HashSet<>(),t->t);
  check(shita.toString().contains("/bbs/read.cgi/game/123/1792624522/"),"Shitaraba subject format");
  check(GlobalTitleSearchRules.pink("https://aoi.bbspink.com/a/"),"PINK accepted");check(!GlobalTitleSearchRules.pink("https://bbspink.com.evil.invalid/a/"),"lookalike PINK rejected");
  check(GlobalTitleSearchRules.key("http://egg.5ch.net/test/read.cgi/a/1792624518/").equals(GlobalTitleSearchRules.key("https://egg.5ch.io/test/read.cgi/a/1792624518")),"5ch URL dedup");
  for(int n=0;n<1000;n++)check(GlobalTitleSearchRules.matches("HAIAGARU "+n,"haiagaru "+n),"literal numeric token "+n);
  System.out.println("PASS "+count+" global-title subject/matching/link/dedup checks");
 }
}
