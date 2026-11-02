package app.morphe.extension.chmate;
import java.util.*;
public final class SharedNgRegexTest{
 static int checks;static void check(boolean ok){if(!ok)throw new AssertionError("regex case "+checks);checks++;}
 static SharedNgRules.Rule rule(String kind,String value){return new SharedNgRules.Rule("a".repeat(64),"*",kind,value,"",2,false,1,1,true);}
 static SharedNgIndex index(SharedNgRules.Rule r){return new SharedNgIndex(List.of(r),1,Set.of(),Set.of(),255);}
 public static void main(String[] args){
  check(index(rule("keyword","日本語.*対象")).matches("5ch/all","","","日本語の検索対象"));
  check(!index(rule("keyword","日本語.*対象")).matches("5ch/all","","","日本語の別内容"));
  check(index(rule("keyword","(?s)開始.*終了")).matches("edge/all","","","開始\n終了"));
  check(index(rule("id","^Ab[0-9]+$")).matches("pink/all","Ab123","",""));
  check(!index(rule("id","^Ab[0-9]+$")).matches("pink/all","other","",""));
  check(index(rule("name","名前[12]号")).matches("5ch/all","","名前2号",""));
  check(index(rule("trip","◆[a-z]+")).matches("edge/all","","名前 ◆trip",""));
  check(index(rule("wacchoi","Ab[0-9]{2}-Cd[0-9]{2}")).matches("edge/all","","(ﾜｯﾁｮｲ Ab12-Cd34)",""));
  check(index(rule("prefix","^Ab[0-9]{2}$")).matches("edge/all","","(ﾜｯﾁｮｲ Ab12-Cd34)",""));
  check(index(rule("suffix","^Cd[0-9]{2}$")).matches("edge/all","","(ﾜｯﾁｮｲ Ab12-Cd34)",""));
  var r=rule("keyword","日本語.*対象");check(r.matches("https://egg.5ch.io/android/","","","","日本語の対象",1));
  check(!new SharedNgIndex(List.of(r),3,Set.of(),Set.of(),255).matches("5ch/all","","","日本語の対象"));
  check(!new SharedNgIndex(List.of(r),1,Set.of(r.id),Set.of(),255).matches("5ch/all","","","日本語の対象"));
  check(!new SharedNgIndex(List.of(r),1,Set.of(),Set.of(),0).matches("5ch/all","","","日本語の対象"));
  long start=System.nanoTime();check(!rule("keyword","(a+)+$").expressionMatches("a".repeat(10000)+"!"));
  check(System.nanoTime()-start<1_500_000_000L);
  try{rule("keyword","invalid[");throw new AssertionError("invalid accepted");}catch(java.util.regex.PatternSyntaxException expected){checks++;}
  System.out.println("PASS "+checks+" regex matching/identity/settings/bounded-evaluation checks");
 }
}
