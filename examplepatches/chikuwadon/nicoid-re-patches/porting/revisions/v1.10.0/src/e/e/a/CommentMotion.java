package e.e.a;
import android.os.SystemClock;import android.view.View;import android.preference.PreferenceManager;import java.util.*;
/** Keep comment onset on the video timeline, but animate an active comment at 1x. */
public final class CommentMotion {
 private static final WeakHashMap<Object,CommentMotionRules> states=new WeakHashMap<>();
 private static synchronized CommentMotionRules state(Object view){CommentMotionRules s=states.get(view);if(s==null){s=new CommentMotionRules();states.put(view,s);}return s;}
 public static void frame(Object view){state(view).frame(SystemClock.elapsedRealtime(),CommentClock.position(view),CommentClock.rate(view),CommentClock.playing(view));}
 public static long generation(Object view){return state(view).generation();}
 public static float position(Object view){return state(view).position();}
 public static float start(Object view,Object comment,float timestamp){return state(view).start(comment,timestamp);}
 public static int fps(Object view){try{View v=(View)view;int fps=Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(v.getContext()).getString("comment_fps","60"));fps=Math.max(1,Math.min(120,fps));fps=v.getContext().getClass().getName().contains("ChormecastSenderService")&&PreferenceManager.getDefaultSharedPreferences(v.getContext()).getBoolean("comment_cast_min",true)?Math.min(30,fps):fps;CommentDisplay.request(v,fps);return fps;}catch(Exception e){return 60;}}
 /** Monotonic Q16.16 milliseconds for the legacy renderer's frame-pacing math. */
 public static long nowQ16(){long nanos=SystemClock.elapsedRealtimeNanos();return ((nanos/1000000L)<<16)+((nanos%1000000L)*65536L/1000000L);}
 /** Preserve the fractional-millisecond part of a frame interval when sleeping. */
 public static void sleepQ16(long interval)throws InterruptedException{if(Thread.interrupted())throw new InterruptedException();if(interval<=0)return;long nanos=(interval>>16)*1000000L+((interval&0xffffL)*1000000L>>16);long deadline=System.nanoTime()+nanos;while(nanos>0){java.util.concurrent.locks.LockSupport.parkNanos(nanos);if(Thread.interrupted())throw new InterruptedException();nanos=deadline-System.nanoTime();}}
 public static long period(Object view){return (1000L<<16)/fps(view);}
}
