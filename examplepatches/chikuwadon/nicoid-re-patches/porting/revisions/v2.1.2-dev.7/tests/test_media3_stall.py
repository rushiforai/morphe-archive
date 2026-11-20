#!/usr/bin/env python3
"""Execute the real bounded Media3 buffering recovery with Java/Android doubles."""
from pathlib import Path
from tempfile import TemporaryDirectory
import subprocess
source=Path(__file__).resolve().parents[1]/'Media3Stall275.java'
with TemporaryDirectory(prefix='nicoid-stall-test-') as home:
 p=Path(home)
 files={
 'android/os/Looper.java':'''package android.os; public class Looper{public static Looper getMainLooper(){return new Looper();}}''',
 'android/os/SystemClock.java':'''package android.os;public class SystemClock{public static long now;public static long uptimeMillis(){return now;}}''',
 'android/os/Handler.java':'''package android.os; public class Handler {
 public static java.util.LinkedHashMap<Runnable,Long> tasks=new java.util.LinkedHashMap<>();
 public Handler(Looper l){} public boolean postDelayed(Runnable r,long d){tasks.put(r,SystemClock.now+d);return true;}
 public void removeCallbacks(Runnable r){tasks.remove(r);}
 public static void advance(long until){SystemClock.now=until;for(int round=0;round<20;round++){
 java.util.List<Runnable> ready=new java.util.ArrayList<>();
 for(java.util.Map.Entry<Runnable,Long> e:tasks.entrySet())if(e.getValue()<=SystemClock.now)ready.add(e.getKey());
 if(ready.isEmpty())break;
 for(Runnable r:ready){tasks.remove(r);r.run();}
 }} }''',
 'android/util/Log.java':'''package android.util;public class Log{public static int i(String s,String t){return 0;} public static int w(String s,String t){return 0;} public static int w(String s,String t,Throwable e){throw new AssertionError(e);}}''',
 'Verify.java':'''import android.os.*;import e.e.a.Media3Stall275;
public class Verify {
 public static class Player {public boolean ready=true;public int state=2;public long position=1000;public Object item=new Object();public int prepares;
 public boolean getPlayWhenReady(){return ready;}
 public int getPlaybackState(){return state;}
 public long getCurrentPosition(){return position;}
 public Object getCurrentMediaItem(){return item;}
 public void prepare(){prepares++;}}
 public static class Owner {public Player player=new Player();}
 static void check(boolean b){if(!b)throw new AssertionError();}
 public static void main(String[] args){
 Owner a=new Owner();Media3Stall275.onPlay(a);Handler.advance(4800);check(a.player.prepares==1);
 Handler.advance(9000);check(a.player.prepares==1);
 Owner b=new Owner();Media3Stall275.onPlay(b);Media3Stall275.onPause(b);Handler.advance(14000);check(b.player.prepares==0);
 Owner c=new Owner();Media3Stall275.onPlay(c);c.player.ready=false;Handler.advance(19000);check(c.player.prepares==0);
 Owner d=new Owner();Media3Stall275.onPlay(d);d.player.item=new Object();Handler.advance(24000);check(d.player.prepares==0);
 Owner e=new Owner();Media3Stall275.onPlay(e);e.player.state=3;e.player.position+=1000;Handler.advance(29000);check(e.player.prepares==0);
 Owner f=new Owner();Media3Stall275.onPlay(f);Media3Stall275.cancel(f);Handler.advance(34000);check(f.player.prepares==0);
 System.out.println("PASS: single stalled-buffer recovery, preserved pause, stream swap, active playback, and owner cancellation");
 }}'''
 }
 for name,txt in files.items():
  f=p/name;f.parent.mkdir(parents=True,exist_ok=True);f.write_text(txt)
 out=p/'out';out.mkdir()
 subprocess.run(['javac','--release','8','-d',str(out),*map(str,p.rglob('*.java')),str(source)],check=True)
 subprocess.run(['java','-cp',str(out),'Verify'],check=True)
