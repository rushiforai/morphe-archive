package e.e.a;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/** Recover once from a media source stuck buffering after the user presses Play.
 * Never force PLAYING after a user pause or source replacement/handoff.
 */
public final class Media3Stall275 {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Object, Probe> PROBES = new WeakHashMap<>();
    private static final long FIRST_MS = 4800L;
    private static final long SECOND_MS = 4200L;

    private Media3Stall275() {}

    public static void onPlay(Object owner) {
        if (owner == null) return;
        cancel(owner);
        Object player = field(owner,"player");
        if (player == null) return;
        Probe probe = new Probe(owner,player);
        PROBES.put(owner,probe);
        MAIN.postDelayed(probe,FIRST_MS);
    }

    public static void onPause(Object owner) {
        cancel(owner);
        try {
            StackTraceElement[] frames=Thread.currentThread().getStackTrace();
            String origin=frames.length>4 ? frames[Math.min(5,frames.length-1)].getClassName()+"."+
                    frames[Math.min(5,frames.length-1)].getMethodName() : "unknown";
            Log.i("nicoid-media-intent","Pause requested by "+origin);
        } catch (RuntimeException ignored) {}
    }

    public static void cancel(Object owner) {
        Probe prev=PROBES.remove(owner);
        if (prev!=null) {prev.cancelled=true; MAIN.removeCallbacks(prev);}
    }

    private static Object field(Object owner,String name) {
        try {
            java.lang.reflect.Field f=owner.getClass().getDeclaredField(name);
            f.setAccessible(true);
            return f.get(owner);
        }catch (Exception ignored) {return null;}
    }

    private static Object call(Object obj,String name) {
        try {return obj.getClass().getMethod(name).invoke(obj);}
        catch(Exception ignored) {return null;}
    }
    private static boolean playing(Object player) {
        return Boolean.TRUE.equals(call(player,"getPlayWhenReady"));
    }
    private static int state(Object player) {
        Object result=call(player,"getPlaybackState");
        return result instanceof Number ? ((Number)result).intValue() : -1;
    }
    private static long position(Object player) {
        Object result=call(player,"getCurrentPosition");
        return result instanceof Number ? ((Number)result).longValue() : -1L;
    }

    private static final class Probe implements Runnable {
        final WeakReference<Object> owner;
        final WeakReference<Object> player;
        final long startedAt;
        final long initialPosition;
        final Object initialMediaItem;
        boolean attempted, cancelled;
        Probe(Object o,Object p) {
            owner=new WeakReference<>(o);
            player=new WeakReference<>(p);
            initialPosition=position(p);
            initialMediaItem=call(p,"getCurrentMediaItem");
            startedAt=SystemClock.uptimeMillis();
        }
        @Override public void run() {
            Object o=owner.get(),p=player.get();
            if(cancelled||o==null||p==null||PROBES.get(o)!=this||field(o,"player")!=p)return;
            if(!playing(p) || initialMediaItem==null || call(p,"getCurrentMediaItem")!=initialMediaItem) {cancel(o);return;}
            int currentState=state(p);
            long currentPosition=position(p);
            long advanced=currentPosition-initialPosition;
            // READY with progressing media is healthy. A legitimate paused or
            // handoff player must never be restarted by this watchdog.
            if(currentState==3 && advanced>=500){cancel(o);return;}
            if(currentState==3 && advanced<500) {
                Log.i("nicoid-media-stall","READY but playback position not advancing; playWhenReady="+playing(p)
                        +" suppressed="+!Boolean.TRUE.equals(call(p,"isPlaying")));
                cancel(o);return;
            }
            if(currentState==2 && !attempted &&
                    currentPosition>=0 && initialPosition>=0 && advanced<500) {
                attempted=true;
                Log.w("nicoid-media-stall","Playback still buffering after explicit Play; reprepare once at "+currentPosition+"ms");
                try {
                    Object item=call(p,"getCurrentMediaItem");
                    if(item==null){cancel(o);return;}
                    Method prepare=p.getClass().getMethod("prepare");
                    prepare.invoke(p);
                }catch(Exception failure) {
                    Log.w("nicoid-media-stall","Bounded buffering recovery failed",failure);
                    cancel(o);return;
                }
                MAIN.postDelayed(this,SECOND_MS);
                return;
            }
            if(attempted && currentState==2 && advanced<500)
                Log.w("nicoid-media-stall","Buffering remains stalled after one reprepare; leaving control to Media3 error handling");
            cancel(o);
        }
    }
}
