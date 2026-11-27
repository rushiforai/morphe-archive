package local.privacy;
import android.content.SharedPreferences;
import java.lang.reflect.*;
import java.util.*;
public final class SettingsCacheCheck {
 static final Map<String,Boolean> values=new HashMap<>(); static int reads;
 static SharedPreferences prefs; static SharedPreferences.OnSharedPreferenceChangeListener listener;
 static void check(boolean value){if(!value)throw new AssertionError();}
 public static void main(String[]args)throws Exception{
  check(!SettingsState.get("block_web_ad_requests"));
  prefs=(SharedPreferences)Proxy.newProxyInstance(SettingsCacheCheck.class.getClassLoader(),new Class[]{SharedPreferences.class},(p,m,a)->{
   if(m.getName().equals("getBoolean")){reads++;return values.getOrDefault((String)a[0],(Boolean)a[1]);}
   if(m.getName().equals("edit")){
    Map<String,Boolean> edits=new HashMap<>();
    return Proxy.newProxyInstance(SettingsCacheCheck.class.getClassLoader(),new Class[]{SharedPreferences.Editor.class},(e,em,ea)->{
     if(em.getName().equals("putBoolean")){edits.put((String)ea[0],(Boolean)ea[1]);return e;}
     if(em.getName().equals("apply")){values.putAll(edits);for(String key:edits.keySet())listener.onSharedPreferenceChanged(prefs,key);return null;}
     throw new AssertionError(em.getName());
    });
   }
   throw new AssertionError(m.getName());
  });
  Field f=SettingsState.class.getDeclaredField("preferences");f.setAccessible(true);f.set(null,prefs);
  Field l=SettingsState.class.getDeclaredField("LISTENER");l.setAccessible(true);listener=(SharedPreferences.OnSharedPreferenceChangeListener)l.get(null);
  listener.onSharedPreferenceChanged(prefs,null);
  check(SettingsState.get("block_web_ad_requests")&&SettingsState.get("block_naver_web_tracking")&&SettingsState.get("collapse_long_ip_info"));
  check(!SettingsState.get("show_author_id")&&SettingsState.homeMask()==0);
  int before=reads;
  for(int i=0;i<20000;i++){SettingsState.get("show_author_id");SettingsState.get("show_ip_info");SettingsState.homeMask();}
  check(reads==before);
  SettingsState.set("hide_home_search",true);SettingsState.set("hide_home_ranking",true);
  check(SettingsState.homeMask()==9);
  SettingsState.set("show_author_id",true);check(SettingsState.get("show_author_id"));
  SettingsState.set("show_author_id",false);check(!SettingsState.get("show_author_id"));
  values.put("show_ip_info",true);listener.onSharedPreferenceChanged(prefs,"show_ip_info");check(SettingsState.get("show_ip_info"));
  values.clear();listener.onSharedPreferenceChanged(prefs,null);check(SettingsState.homeMask()==0&&!SettingsState.get("show_ip_info")&&SettingsState.get("block_web_ad_requests"));
  check(!SettingsState.get("future_option"));
  System.out.println("PASS defaults, immediate toggles, external changes/clear; 60,000 hot reads without SharedPreferences access");
 }
}
