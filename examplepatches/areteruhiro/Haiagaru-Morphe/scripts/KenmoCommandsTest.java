package app.morphe.extension.chmate;
import java.util.*;
public final class KenmoCommandsTest {
 public static void main(String[] args){
  for(String url:List.of("https://kenmo.org/poverty/","https://kenmo.org/test/read.cgi/operate/1698273140/122","https://www.kenmo.org/poverty/"))if(!ThreadCommandRules.profile(url).equals("kenmo"))throw new AssertionError("profile");
  if(ThreadCommandRules.profile("https://kenmo.org.example.invalid/poverty/").equals("kenmo"))throw new AssertionError("host boundary");
  String[] values=ThreadCommandRules.values("kenmo"),labels=ThreadCommandRules.labels("kenmo");
  if(values.length!=19||labels.length!=values.length)throw new AssertionError("menu");
  if(!Arrays.asList(values).equals(List.of("!id","!noid","!slip","!noslip","!ip","!noip","!chid","!ipid","!longid","!longslip","!nushi","!nonushi","!piyo","!nopiyo","!yuruyuri","!reauth:60","!max:1000","!notitlechange","")))throw new AssertionError("commands");
  for(int i=0;i<values.length;i++)if(!ThreadCommandRules.available("kenmo",i,true)||ThreadCommandRules.available("kenmo",i,false)||ThreadCommandRules.nameCommand("kenmo",i))throw new AssertionError("posting target");
  if(!ThreadCommandRules.insert("本文","!reauth:120").equals("!reauth:120\n本文"))throw new AssertionError("parameter edit");
  System.out.println("PASS Kenmo host/menu/18 commands/creation-only/body-insertion checks");
 }
}
