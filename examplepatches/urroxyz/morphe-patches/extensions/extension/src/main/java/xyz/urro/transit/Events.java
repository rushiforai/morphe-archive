package xyz.urro.transit;
import android.content.Context;
import android.os.SystemClock;
import android.util.Log;
final class Events {
 static void add(Context c,String event){
  String line=SystemClock.elapsedRealtime()+"ms uid="+android.os.Process.myUid()+" "+event;
  Log.i("TransitMotion",line);
  GoModelDiagnostics.trace("relay_event",event);
  String old=c.getSharedPreferences("xyz.urro.transit.motion.diagnostics",0).getString("events","");
  String all=old+line+"\n";
  if(all.length()>10000)all=all.substring(all.length()-10000);
  c.getSharedPreferences("xyz.urro.transit.motion.diagnostics",0).edit().putString("events",all).apply();
 }
 static String get(Context c){return c.getSharedPreferences("xyz.urro.transit.motion.diagnostics",0).getString("events","No commands yet.");}
}
