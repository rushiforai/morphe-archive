#!/usr/bin/env python3
"""Execute the actual Media3 diagnostics/recovery Java against controlled player doubles."""
from pathlib import Path
from tempfile import TemporaryDirectory
import subprocess

HERE = Path(__file__).resolve().parents[1]
CODE = HERE / "Media3Diagnostics276.java"

STUBS = {
 "android/os/Looper.java": """package android.os;
 public final class Looper {
   private static final Looper MAIN = new Looper();
   public static Looper getMainLooper(){return MAIN;}
 }
 """,
 "android/os/Handler.java": """package android.os;
 import java.util.*;
 public final class Handler {
   private static class Pending {
     Runnable runnable;long when;
     Pending(Runnable r,long w){runnable=r;when=w;}
   }
   private static final List<Pending> ITEMS = new ArrayList<>();
   public static long now;
   public Handler(Looper l){}
   public boolean postDelayed(Runnable r,long delay){ITEMS.add(new Pending(r,now+delay));return true;}
   public void removeCallbacks(Runnable r){ITEMS.removeIf(p -> p.runnable == r);}
   public static void advance(long ms){
     long end=now+ms;
     while(true){
       Pending first=null;
       for(Pending p:ITEMS) if(p.when<=end&&(first==null||p.when<first.when))first=p;
       if(first==null)break;
       ITEMS.remove(first);now=first.when;first.runnable.run();
     }
     now=end;
   }
 }
 """,
 "android/util/Log.java": """package android.util;
 public final class Log {
   public static final int DEBUG = 3;
   public static boolean isLoggable(String tag,int level){return false;}
   public static int i(String tag,String value){return 0;}
   public static int w(String tag,String value){return 0;}
   public static int w(String tag,String value,Throwable error){return 0;}
 }
 """,
 "androidx/media3/common/Player.java": """package androidx.media3.common;
 public interface Player {
   int getPlaybackState();
   boolean getPlayWhenReady();
   int getPlaybackSuppressionReason();
   long getCurrentPosition();
   long getBufferedPosition();
   Object getCurrentMediaItem();
   class Events { public boolean containsAny(int... values){return true;} public boolean contains(int value){return true;} }
   void stop();
   void seekTo(long where);
   void prepare();
 }
 """,
 "RecoveryCheck.java": """import androidx.media3.common.Player;
 import e.e.a.Media3Diagnostics276;
 import android.os.Handler;

 public class RecoveryCheck {
   public static class Events extends Player.Events {}
   public static class Mock implements Player {
     public int state=2,suppression=0,stops=0,prepares=0,seeks=0;
     public boolean ready=true;
     public long pos=102376,buffered=102376;
     public Object item=new Object();
     public int getPlaybackState(){return state;}
     public boolean getPlayWhenReady(){return ready;}
     public int getPlaybackSuppressionReason(){return suppression;}
     public long getCurrentPosition(){return pos;}
     public long getBufferedPosition(){return buffered;}
     public Object getCurrentMediaItem(){return item;}
     public void stop(){stops++;state=1;pos=0;}
     public void seekTo(long p){seeks++;pos=p;}
     public void prepare(){prepares++;state=2;}
   }
   public static class Owner {
     public Player player;
     public boolean pendingSeek=true,scrubbing=false,bindingRetainedView=false,released=false;
     Owner(Player p){player=p;}
   }
   static void ok(boolean condition,String reason){
     if(!condition)throw new AssertionError(reason);
   }
   static void ready(Owner owner,Mock player){
     player.state=3;Media3Diagnostics276.onEvents(owner,player,new Events());
   }
   static void watch(Owner owner,Mock player){
     player.state=2;player.ready=true;
     Media3Diagnostics276.onEvents(owner,player,new Events());
   }
   public static void main(String[] args){
     Mock stalled=new Mock();Owner owner=new Owner(stalled);
     watch(owner,stalled);
     Handler.advance(7999);ok(stalled.stops==0,"must wait for 8s");
     Handler.advance(1);
     ok(stalled.stops==1&&stalled.prepares==1&&stalled.seeks==1,
        "one bounded stop/seek/prepare");
     ok(stalled.pos==102376,"seek position preserved");
     watch(owner,stalled);Handler.advance(25000);
     ok(stalled.stops==1,"do not loop while same item is still BUFFERING");

     ready(owner,stalled);
     stalled.pos=90200;stalled.buffered=90200;
     watch(owner,stalled);Handler.advance(8000);
     ok(stalled.stops==2,"new freeze after READY can recover once");

     Mock paused=new Mock();Owner pausedOwner=new Owner(paused);
     watch(pausedOwner,paused);
     Media3Diagnostics276.onPause(pausedOwner);
     Handler.advance(10000);ok(paused.stops==0,"pause must cancel recovery");

     Mock handoff=new Mock();Owner handoffOwner=new Owner(handoff);
     watch(handoffOwner,handoff);
     Media3Diagnostics276.onHandoffPause(handoffOwner);
     Handler.advance(10000);ok(handoff.stops==0,"handoff must cancel recovery");

     Mock normal=new Mock();Owner normalOwner=new Owner(normal);
     normalOwner.pendingSeek=false;
     watch(normalOwner,normal);
     Handler.advance(10000);ok(normal.stops==0,"initial buffering unaffected");

     Mock scrubbing=new Mock();Owner scrubOwner=new Owner(scrubbing);
     scrubOwner.scrubbing=true;
     watch(scrubOwner,scrubbing);
     Handler.advance(10000);ok(scrubbing.stops==0,"scrub must not be interrupted");

     Mock suppressed=new Mock();Owner suppressOwner=new Owner(suppressed);
     suppressed.suppression=4;
     watch(suppressOwner,suppressed);
     Handler.advance(10000);ok(suppressed.stops==0,"suppressed playback unaffected");

     Mock replaced=new Mock();Owner replaceOwner=new Owner(replaced);
     watch(replaceOwner,replaced);
     replaced.item=new Object();
     Handler.advance(10000);ok(replaced.stops==0,"source replacement must not recover stale media");

     Mock releasing=new Mock();Owner releaseOwner=new Owner(releasing);
     watch(releaseOwner,releasing);
     releaseOwner.released=true;
     Handler.advance(10000);ok(releasing.stops==0,"released player must stay released");

     Mock advancing=new Mock();Owner advancingOwner=new Owner(advancing);
     watch(advancingOwner,advancing);
     advancing.buffered+=4000;
     Handler.advance(8000);ok(advancing.stops==0,"buffer progress must delay recovery");
     Handler.advance(8000);ok(advancing.stops==1,"lack of subsequent progress eventually recovers");

     Mock switched=new Mock();Owner switchOwner=new Owner(switched);
     watch(switchOwner,switched);
     switchOwner.player=new Mock();
     Handler.advance(10000);ok(switched.stops==0,"old player must not recover after handoff");

     System.out.println("PASS: 11 freeze, progress, pause, source, and handoff scenarios");
   }
 }
 """,
}

with TemporaryDirectory(prefix="nicoid-freeze-test-") as folder:
    out = Path(folder)
    paths = []
    for name, data in STUBS.items():
        path = out / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(data)
        paths.append(str(path))
    target = out / "classes"
    target.mkdir()
    subprocess.run(["javac", "--release", "8", "-d", str(target), str(CODE), *paths],
                   check=True, timeout=30)
    subprocess.run(["java", "-cp", str(target), "RecoveryCheck"],
                   check=True, timeout=15)
