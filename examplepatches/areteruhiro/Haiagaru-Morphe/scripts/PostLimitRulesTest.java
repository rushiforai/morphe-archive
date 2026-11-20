package app.morphe.extension.chmate;
import java.nio.charset.StandardCharsets;import java.util.*;
public final class PostLimitRulesTest {
 static int checks;static void ok(boolean value,String why){if(!value)throw new AssertionError(why);checks++;}
 static PostLimitRules.Result inspect(String text,int max,int lines,PostLimitRules.Measure measure)throws Exception{return PostLimitRules.inspect(text,new PostLimitRules.Limit(max,"文字",measure),lines);}
 public static void main(String[] args)throws Exception{
  for(String text:new String[]{"","a","日本語","a😀b","e\u0301"}){var r=inspect(text,100,100,PostLimitRules.UTF16);ok(r.excessStart==-1&&r.used==text.length(),"under limit, native UTF-16 "+text);}
  ok(inspect("abcd",3,0,PostLimitRules.UTF16).excessStart==3,"ASCII first excess character");
  var emoji=inspect("a😀b",2,0,PostLimitRules.UTF16);ok(emoji.characters==4&&emoji.used==4&&emoji.excessStart==1,"emoji counts its two UTF-16 code units; highlight keeps surrogate pair intact");
  ok(inspect("👨‍👩‍👧‍👦",100,0,PostLimitRules.UTF16).characters=="👨‍👩‍👧‍👦".length(),"joined emoji count follows UTF-16 code units");
  ok(inspect("a😀b",2,0,PostLimitRules.CODE_POINTS).excessStart==3,"code-point limit does not split emoji");
  PostLimitRules.Measure utf8=text->text.toString().getBytes(StandardCharsets.UTF_8).length;
  ok(inspect("a日本",4,0,utf8).excessStart==2,"UTF-8 byte boundary after first Japanese character");
  ok(inspect("a😀",4,0,utf8).excessStart==1,"UTF-8 whole supplementary character");
  PostLimitRules.Measure escaped=text->text.toString().replace("&","&amp;").getBytes(StandardCharsets.UTF_8).length;
  ok(inspect("&aa",6,0,escaped).excessStart==2,"uses supplied posting serialization, not raw encoding");
  ok(inspect("",0,0,null).lines==0,"empty input has zero lines");
  ok(inspect("a\nb",0,0,null).lines==2,"LF logical lines");
  ok(inspect("a\r\nb\rc",0,0,null).lines==3,"CRLF is one line break");
  ok(inspect("a\nb\nc",0,2,null).excessStart==3,"line excess begins at offending separator");
  ok(inspect("a\n",0,1,null).excessStart==1,"trailing empty excess line remains detectable");
  ok(inspect("abcdef\ng",3,1,PostLimitRules.UTF16).excessStart==3,"earlier character limit wins");
  ok(inspect("a\nbbbbbbb",7,1,PostLimitRules.UTF16).excessStart==1,"earlier line limit wins");
  ok(inspect("😀".repeat(50),0,0,null).excessStart==-1,"unknown caps never invent an error");
  Map<String,String> settings=PostLimitRules.settings("BBS_SUBJECT_COUNT=96\r\nBBS_MESSAGE_COUNT=4096\nBBS_LINE_NUMBER=16.9\nBBS_TITLE=ignored\nnot a setting\n");
  ok(settings.size()==3,"only relevant public setting keys parsed");ok(PostLimitRules.lines(settings,"egg.5ch.io")==32,"5ch line setting floored then doubled");
  ok(PostLimitRules.lines(settings,"jbbs.shitaraba.net")==0,"Shitaraba collapsed display is not a submission cap");
  settings.put("BBS_MAX_LINES","7");ok(PostLimitRules.lines(settings,"egg.5ch.io")==7,"explicit line cap takes precedence");
  for(String invalid:new String[]{null,"","x","-1","0","NaN","Infinity","1000001"})ok(PostLimitRules.positive(invalid)==0,"invalid bound ignored: "+invalid);
  ok(PostLimitRules.settings("x".repeat(131073)).isEmpty(),"bounded settings parser");
  var limit=new PostLimitRules.Limit(3,"バイト",utf8);var r=PostLimitRules.inspect("日本",limit,0);ok(PostLimitRules.summary("本文",r,limit).contains("超過3バイト"),"byte count and remaining units honest");
  ok(PostLimitRules.summary("本文",inspect("a",0,0,null),new PostLimitRules.Limit(0,"文字",null)).contains("上限未取得"),"unknown state explicit");
  ok(PostLimitRules.lineSummary(inspect("a\nb\nc",0,0,null),2).contains("超過1行"),"remaining lines shown");
  int[] calls={0};PostLimitRules.Measure measured=text->{calls[0]++;return text.length();};String longText="a".repeat(20000);ok(inspect(longText,17000,0,measured).excessStart==17000&&calls[0]<=20,"overflow lookup uses logarithmic measurements");
  PostLimitRules.Limit perLine=new PostLimitRules.Limit(3,"文字",PostLimitRules.UTF16);
  var lr=PostLimitRules.inspectLines("abcd\nx\r\ny1234",perLine);ok(lr.longest.used==5&&lr.excess.size()==2,"longest logical line and independent overflow spans");ok(Arrays.equals(lr.excess.get(0),new int[]{3,4})&&Arrays.equals(lr.excess.get(1),new int[]{11,13}),"CRLF line offsets preserve later non-excess text");
  var em=PostLimitRules.inspectLines("a😀b\nok",new PostLimitRules.Limit(2,"文字",PostLimitRules.UTF16));ok(Arrays.equals(em.excess.get(0),new int[]{1,4}),"per-line emoji is never split");
  ok(PostLimitRules.lineMaximum(PostLimitRules.settings("BBS_MAX_LINE_CHARS=80"))==80,"explicit character cap");
  var bytes=PostLimitRules.settings("BBS_MAX_LINE_BYTES=160");ok(PostLimitRules.lineMaximum(bytes)==160&&!PostLimitRules.lineCharacters(bytes),"explicit byte cap");
  Map<String,String> unconfigured=PostLimitRules.settings("BBS_MESSAGE_COUNT=4096");ok(PostLimitRules.lineMaximum(unconfigured,"https://nova.5ch.io/livegalileo/")==1024&&!PostLimitRules.lineCharacters(unconfigured,"https://nova.5ch.io/livegalileo/"),"livegalileo per-line 1024-byte cap");
  var liveLineLimit=new PostLimitRules.Limit(1024,"バイト",utf8);ok(PostLimitRules.inspectLines("a".repeat(1024),liveLineLimit).excess.isEmpty(),"livegalileo line at 1024 bytes is accepted");
  ok(Arrays.equals(PostLimitRules.inspectLines("a".repeat(1025),liveLineLimit).excess.get(0),new int[]{1024,1025}),"first byte over the livegalileo line cap is highlighted");
  ok(PostLimitRules.lineMaximum(unconfigured,"https://nova.5ch.net/livegalileo/")==1024,"livegalileo cap follows the .net alias");
  ok(PostLimitRules.lineMaximum(unconfigured,"https://nova.5ch.io/news4vip/")==0,"per-line rule is scoped only to livegalileo");
  ok(PostLimitRules.lineMaximum(PostLimitRules.settings("BBS_MAX_LINE_LENGTH=80"))==0,"unknown units do not invent a limit");
  ok(PostLimitRules.lineMaximum(PostLimitRules.settings("BBS_MAX_LINE_LENGTH=80\nBBS_MAX_LINE_UNIT=chars"))==80,"explicit length and units");
  ok(PostLimitRules.inspectLines("long line",new PostLimitRules.Limit(0,"文字",PostLimitRules.UTF16)).excess.isEmpty(),"unknown line cap has no warning");
  System.out.println("PASS "+checks+" posting-limit unit, Unicode and line checks");
 }
}
