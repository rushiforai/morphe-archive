package local.wazemaps.alerts;
import java.util.*;
import android.content.Context;
import com.waze.*;
import com.waze.config.*;
public class ValidateAlertDistance {
 static void require(boolean value,String message){if(!value)throw new AssertionError(message);}
 static void values(long normal,long freeway,long fallback){require(ConfigManager.values.get(863)==normal && ConfigManager.values.get(864)==freeway && ConfigManager.values.get(867)==fallback,"Unexpected native values: "+ConfigManager.values);require(ConfigManager.values.get(999)==37L,"Unrelated value changed");}
 static void change(int metres,boolean enabled)throws Exception{NativeManager.nativeThread=true;try{AlertDistance.apply(k.z.context,metres,enabled,true);}finally{NativeManager.nativeThread=false;}}
 public static void main(String[] args)throws Exception{
  require(AlertDistance.override(new c(999))==null,"Unrelated getter changed");
  require(AlertDistance.override(ConfigValues.CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE_NORMAL)==1200L,"Default getter value");
  NativeManager.nativeThread=true;AlertDistance.applySaved();NativeManager.nativeThread=false;values(1200,1200,1200);
  for(int distance:new int[]{50,100,1200,3000,10000}){change(distance,true);values(distance,distance,distance);require(AlertDistance.override(ConfigValues.CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE_FREEWAY)==distance,"Saved getter value");}
  change(1200,true);
  for(int invalid:new int[]{-1,0,49,10001,Integer.MAX_VALUE}){int before=ConfigManager.writes;try{change(invalid,true);throw new AssertionError("Invalid distance accepted");}catch(IllegalArgumentException expected){}require(ConfigManager.writes==before,"Invalid input mutated native config");}
  NativeManager.started=false;try{change(500,true);throw new AssertionError("Applied before native startup");}catch(IllegalStateException expected){}NativeManager.started=true;
  ConfigManager.values.put(863,200L);ConfigManager.values.put(864,500L);ConfigManager.values.put(867,200L);
  AlertDistance.scheduleApply();values(200,500,200);NativeManager.drain();values(1200,1200,1200);
  ConfigManager.failId=864;ConfigManager.rejectValue=700;
  try{change(700,true);throw new AssertionError("Failed native setter accepted");}catch(Exception expected){}values(1200,1200,1200);ConfigManager.failId=-1;
  ConfigManager.ignoreId=867;
  try{change(700,true);throw new AssertionError("Read-back mismatch accepted");}catch(IllegalStateException expected){}values(1200,1200,1200);ConfigManager.ignoreId=-1;
  k.z.context.failNextCommit=true;
  try{change(700,true);throw new AssertionError("Preference failure accepted");}catch(IllegalStateException expected){}values(1200,1200,1200);require(AlertDistance.override(ConfigValues.CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE)==1200L,"Saved choice changed on failure");
  change(1200,false);values(200,500,200);require(AlertDistance.override(ConfigValues.CONFIG_VALUE_ANDROID_AUTO_HEADS_UP_DISTANCE)==null,"Original getter was not restored");
  ConfigManager.values.put(863,250L);AlertDistance.scheduleApply();NativeManager.drain();values(250,500,200);
  change(900,true);values(900,900,900);
  System.out.println("PASS: alert distance defaults, shorter/longer values, bounds, native thread, server refresh, three-key read-back, failed-write/read-back/save rollback, unrelated values and original-distance restore (JVM native API fixtures)");
 }
}
