#!/usr/bin/env python3
"""Run the actual adapter against a deterministic main-looper clock; no Android device needed."""
from pathlib import Path
import subprocess,tempfile,sys
root=Path(__file__).resolve().parents[2]
source=root/'extensions/extension/src/main/java/xyz/urro/transit'
files={
'android/os/Looper.java':'''package android.os; public class Looper {static final Looper MAIN=new Looper();public static Looper getMainLooper(){return MAIN;}public static Looper myLooper(){return MAIN;}}''',
'android/os/SystemClock.java':'''package android.os; public class SystemClock {public static long now;public static long elapsedRealtime(){return now;}public static long uptimeMillis(){return now;}}''',
'android/os/Handler.java':'''package android.os; import java.util.*;public class Handler {public Handler(Looper l){}static final Map<Runnable,Long> tasks=new LinkedHashMap<>();public void removeCallbacks(Runnable r){tasks.remove(r);}public void post(Runnable r){r.run();}public void postDelayed(Runnable r,long n){tasks.put(r,SystemClock.now+n);}public void postAtTime(Runnable r,long n){tasks.put(r,n);}public static void advance(long now){SystemClock.now=now;for(;;){Runnable found=null;for(Map.Entry<Runnable,Long> e:tasks.entrySet())if(e.getValue()<=now){found=e.getKey();break;}if(found==null)return;tasks.remove(found);found.run();}}}''',
'android/content/Context.java':'''package android.content;public class Context {public Context getApplicationContext(){return this;}public Pref getSharedPreferences(String n,int m){return new Pref();}public static class Pref {public boolean getBoolean(String k,boolean d){return xyz.urro.transit.TransitHooks.enabled;}}}''',
'xyz/urro/transit/GoSimulation.java':'''package xyz.urro.transit;class GoSimulation {static boolean delivering;static class State{boolean active;long generation;}static State state=new State();static long clock(){return android.os.SystemClock.now;}static void control(String owner,boolean active){}}''',
'xyz/urro/transit/TransitHooks.java':'''package xyz.urro.transit;public class TransitHooks {public static boolean enabled=true;static boolean motionFeature(){return true;}}''',
'xyz/urro/transit/GoModelDiagnostics.java':'''package xyz.urro.transit;public class GoModelDiagnostics {public static int sessions;static void trace(String s,String v){if(v.equals("session_started"))sessions++;}}''',
'xyz/urro/transit/GoStateExtractor.java':'''package xyz.urro.transit;class GoStateExtractor {static class Snapshot {boolean active=true,aboard;String shape;Snapshot(boolean b){aboard=b;shape=b?"STOPS":"WAIT";}}static Snapshot fromLive(Object o){Snapshot s=new Snapshot(Boolean.TRUE.equals(o));s.active=o!=null;return s;}}''',
'xyz/urro/transit/MotionController.java':'''package xyz.urro.transit;import android.content.Context;class MotionController {static final MotionController ONE=new MotionController();static int starts,stops;static MotionController get(Context c){return ONE;}void desire(String id,boolean active){if(active)starts++;else stops++;}}''',
'xyz/urro/transit/ReliabilityTest.java':'''package xyz.urro.transit;
import android.os.Handler;import android.content.Context;
public class ReliabilityTest {
 static void eq(Object a,Object b,String why){if(!a.equals(b))throw new AssertionError(why+": "+a+" != "+b);}
 public static void main(String[] args){
 Context c=new Context();Handler.advance(100);GoMotionAdapter.onLive(c,true);
 Handler.advance(20100);GoMotionAdapter.onLive(c,null);
 Handler.advance(20130);GoMotionAdapter.onLive(c,true);
 Handler.advance(45100);eq(MotionController.starts,1,"replacement null must not reset 45s timer");eq(GoModelDiagnostics.sessions,1,"replacement preserves identity");
 GoMotionAdapter.onLive(c,null);Handler.advance(45120);GoMotionAdapter.onLive(c,true);eq(MotionController.stops,0,"replacement must not release an activation");
 GoMotionAdapter.onLive(c,false);eq(MotionController.stops,1,"confirmed alighting releases immediately");GoMotionAdapter.stop();
 Handler.advance(60000);GoMotionAdapter.onLive(c,true);Handler.advance(104000);GoMotionAdapter.onLive(c,null);Handler.advance(105000);eq(MotionController.starts,1,"missing model must not activate at timer boundary");Handler.advance(106000);GoMotionAdapter.onLive(c,true);Handler.advance(150999);eq(MotionController.starts,1,"expired gap needs fresh threshold");Handler.advance(151000);eq(MotionController.starts,2,"new threshold completes");
 GoMotionAdapter.onLive(c,null);TransitHooks.enabled=false;GoMotionAdapter.preferenceChanged(false);eq(MotionController.stops,2,"disable releases immediately");GoMotionAdapter.stop();
 System.out.println("Adapter PASS: replacement identity, timer, ownership request, missing-data suspension/expiry, alighting, disable");
 }
}'''
}
with tempfile.TemporaryDirectory() as temp:
 d=Path(temp)
 for name,body in files.items():p=d/name;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(body)
 for name in ['GoMotionAdapter.java','BoardingDetector.java','GoDataContinuity.java']:
  p=d/'xyz/urro/transit'/name
  if '--baseline' in sys.argv and name!='GoDataContinuity.java':
   p.write_bytes(subprocess.check_output(['git','show','HEAD:extensions/extension/src/main/java/xyz/urro/transit/'+name],cwd=root))
  else:p.write_bytes((source/name).read_bytes())
 subprocess.run(['javac','-d',str(d/'classes'),*map(str,d.rglob('*.java'))],check=True)
 subprocess.run(['java','-cp',str(d/'classes'),'xyz.urro.transit.ReliabilityTest'],check=True)
