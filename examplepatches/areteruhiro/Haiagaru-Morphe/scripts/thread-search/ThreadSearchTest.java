package app.morphe.extension.chmate;
import java.util.regex.*;
public class ThreadSearchTest{
 static int count;static boolean search(Object r,String q){return ThreadSearchText.reset(Pattern.compile(q).matcher(""),r).find();}static void check(boolean ok,String message){if(!ok)throw new AssertionError(message);count++;}
 public static void main(String[] args)throws Exception{
 for(String name:new String[]{"o.processAdDisplayErrorPostbackForUserError","o.BouncyCastleSocketAdapterCompanion","o.KeJ11"}){
  Object r=Class.forName(name).getConstructor().newInstance();String[] fields=name.endsWith("KeJ11")?new String[]{"h","n","p","g"}:name.contains("Bouncy")?new String[]{"d","m","t","j"}:new String[]{"c","n","q","h"};
  String[] values={"本文の検索 語句","名前 ﾜｯﾁｮｲ abcd-EF12","2026/10/28(水) ID:A.Af1CYTq","A.Af1CYTq"};for(int i=0;i<4;i++)r.getClass().getField(fields[i]).set(r,values[i]);
  for(int mask=0;mask<8;mask++){
   ThreadSearchOptions.mask=mask;check(!search(r,"2026/10/28")&&!search(r,"水"),"header date and weekday excluded "+mask);check(search(r,"本文"),"body always");check(search(r,"名前")==((mask&4)!=0),"name toggle "+mask);check(search(r,"abcd-EF12")==((mask&2)!=0),"wacchoi toggle "+mask);check(search(r,"ID:A.Af1CYTq")==((mask&1)!=0),"ID toggle "+mask);
   check(search(r,"本文 AND abcd-EF12")==((mask&2)!=0),"AND respects wacchoi "+mask);check(search(r,"名前 A.Af1CYTq")==((mask&5)==5),"AND across selected fields "+mask);check(search(r,"本文.*検索"),"regex retained");
  }
  ThreadSearchOptions.mask=0;r.getClass().getField(fields[0]).set(r,"本文にID:A.Af1CYTqとabcd-EF12と名前を引用");check(search(r,"A.Af1CYTq")&&search(r,"abcd-EF12")&&search(r,"名前"),"body quotes still match");r.getClass().getField(fields[0]).set(r,values[0]);
  ThreadSearchOptions.mask=7;Matcher reused=Pattern.compile("名前 AND 本文").matcher("");reused=ThreadSearchText.reset(reused,r);check(reused.find(),"AND first row");r.getClass().getField(fields[0]).set(r,"違う内容");reused=ThreadSearchText.reset(reused,r);check(!reused.find(),"no matcher row leak");r.getClass().getField(fields[0]).set(r,values[0]);
  for(int i=0;i<4;i++)check(values[i].equals(r.getClass().getField(fields[i]).get(r)),"source unchanged");
  r.getClass().getField(fields[2]).set(r,"2026/10/28 ﾜｯﾁｮｲ abcd-EF12");ThreadSearchOptions.mask=1;check(search(r,"ID:A.Af1CYTq"),"native ID fallback");check(!search(r,"abcd-EF12"),"header wacchoi excluded");ThreadSearchOptions.mask=2;check(search(r,"abcd-EF12")&&!search(r,"ID:A.Af1CYTq"),"header wacchoi only");
 }
 System.out.println("Thread search: "+count+" checks passed");
 }}