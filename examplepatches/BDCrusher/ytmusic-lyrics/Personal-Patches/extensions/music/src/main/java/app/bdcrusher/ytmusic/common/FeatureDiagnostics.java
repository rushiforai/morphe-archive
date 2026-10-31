/* Copyright 2026 BDCrusher. GPL-3.0. */
package app.bdcrusher.ytmusic.common;
import android.content.Context;
import android.os.SystemClock;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.BaseSettings;
/** Structured events in Morphe's existing logger. The normal debug switch is the only owner. */
public final class FeatureDiagnostics {
 private static final long started=SystemClock.elapsedRealtime();
 private static volatile String entry="Unknown";private static volatile boolean panelOpen;private static volatile Context app;
 private static final java.util.LinkedHashMap<String,Long> recent=new java.util.LinkedHashMap<>();private static boolean announced;
 private FeatureDiagnostics(){}
 public static void configure(Context c){app=c.getApplicationContext();}
 public static boolean detailed(){return BaseSettings.DEBUG.get();}
 public static Context context(){return app;}
 public static void entry(String value){String next="Native".equals(value)?"Native":"Fallback".equals(value)?"Fallback":"Unknown";if(!next.equals(entry)){entry=next;event("Panel",entry+" Lyrics entry");}}
 public static String entry(){return entry;}public static void panel(boolean shown){panelOpen=shown;}public static boolean panelOpen(){return panelOpen;}
 public static void event(String category,String message){record(category,message);}
 public static synchronized void record(String category,String message){
  if(!detailed()){announced=false;recent.clear();return;}if(message==null||category==null)return;
  if(!announced){announced=true;Logger.printDebug(()->DebugLogPolicy.context());}
  String safe=DebugLogPolicy.bound(category+": "+message);if(safe.length()>700)safe=safe.substring(0,700);
  long now=SystemClock.elapsedRealtime();Long previous=recent.put(safe,now);while(recent.size()>128)recent.remove(recent.keySet().iterator().next());if(previous!=null&&now-previous<1500)return;
  final String line="YT-Music +"+(now-started)+"ms "+safe;Logger.printDebug(()->line);
 }
 public static String snapshot(){return Logger.getFilteredLogs();}
}
