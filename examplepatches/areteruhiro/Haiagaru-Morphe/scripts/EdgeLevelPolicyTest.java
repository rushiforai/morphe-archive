package app.morphe.extension.chmate;
import java.nio.file.*;import java.nio.charset.*;import java.util.*;
public final class EdgeLevelPolicyTest{
 static int n;static void check(boolean ok,String why){if(!ok)throw new AssertionError(why);n++;}
 public static void main(String[] args)throws Exception{
  String url=EdgeLevelPolicy.SOURCE;
  String dat=Files.readString(Path.of(args[0]),Charset.forName("MS932"));
  Map<String,EdgeLevelPolicy.Fact> facts=EdgeLevelPolicy.dat(url,dat);
  check(facts.size()==1,"same ID merged");EdgeLevelPolicy.Fact f=facts.values().iterator().next();
  check(f.level==3&&f.response==2&&f.id.equals("uaP115Eek"),"real source latest level");
  check(f.day.equals("2026-10-31")&&f.board.equals("edge/liveedge"),"day/board exact");
  check(EdgeLevelPolicy.dat(url,dat.replace("</b>","&lt;/b&gt;")).isEmpty(),"escaped name cannot forge badge");
  check(EdgeLevelPolicy.badge("body (L2 foo)")==-1,"body badge invalid");
  check(EdgeLevelPolicy.badge("</b>(L5 abcd-1234)<b>")==5,"server badge");
  check(EdgeLevelPolicy.badge("</b>(L5 abcd-1234)<b> trailing")==-1,"trailing name invalid");
  check(EdgeLevelPolicy.thread("http://bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/2").equals(url),"canonical HTTPS");
  for(String bad:new String[]{"https://bbs.eddibb.cc.evil.invalid/test/read.cgi/liveedge/1793457978/","https://user@bbs.eddibb.cc/test/read.cgi/liveedge/1793457978/","https://bbs.eddibb.cc:443/test/read.cgi/liveedge/1793457978/","file:///test/read.cgi/liveedge/1793457978/"})check(EdgeLevelPolicy.thread(bad)==null,"bad source");
  check(EdgeLevelPolicy.day("2026-02-30")==null,"invalid date");
  check(EdgeLevelPolicy.day(null)==null,"null date");
  check(EdgeLevelPolicy.identity(url,4,"uaP115Eek","2026/11/01(日) 00:00:00.000").key().equals("edge/liveedge|2026-11-01|uaP115Eek"),"next day distinct");
  check(EdgeLevelPolicy.identity(url,4,"ID:uaP115Eek","2026/10/31(土) 23:46:25.611").id.equals("uaP115Eek"),"ID prefix");
  check(EdgeLevelPolicy.id("CAP_USER")==null,"cap excluded");
  System.out.println("Edge level policy: "+n+" checks passed");
 }
}
