package e.e.a;

import android.os.SystemClock;
import java.util.WeakHashMap;
import java.lang.reflect.*;

/** One monotonic timeline per comment renderer, including normal and popup playback. */
public final class CommentClock {
    private static final WeakHashMap<Object,State> clocks=new WeakHashMap<>();
    private static final class State {
        final CommentClockRules clock=new CommentClockRules();
        Field provider,video; Method position,playing,rate; volatile float speed=1;
        State(Object view) throws Exception {
            provider=view.getClass().getField(view.getClass().getName().equals("e.e.a.u")?"D":"E");
            Class<?> type=provider.getType();position=type.getMethod("a");playing=type.getMethod("c");
            video=type.getField("a");rate=video.getType().getMethod("getPlaybackSpeed");
        }
    }
    private static State state(Object view) throws Exception {
        synchronized(clocks){State s=clocks.get(view);if(s==null){s=new State(view);clocks.put(view,s);}return s;}
    }
    public static void speed(Object view,float speed) {
        try{State s=state(view);s.speed=speed;}catch(Exception e){android.util.Log.w("nicoid-clock","Speed binding failed",e);}
    }
    public static float rate(Object view){try{State s=state(view);Object source=s.provider.get(view),player=source==null?null:s.video.get(source);return player==null?s.speed:((Number)s.rate.invoke(player)).floatValue();}catch(Exception e){return 1;}}
    public static boolean playing(Object view){try{State s=state(view);Object source=s.provider.get(view);return source!=null&&(Boolean)s.playing.invoke(source);}catch(Exception e){return false;}}
    public static int position(Object view) {
        try {
            State s=state(view);Object source=s.provider.get(view);if(source==null)return 0;
            Object player=s.video.get(source);float actual=player==null?s.speed:((Number)s.rate.invoke(player)).floatValue();
            return s.clock.position(((Number)s.position.invoke(source)).longValue(),(Boolean)s.playing.invoke(source),actual,SystemClock.elapsedRealtime());
        }catch(Exception e){return 0;}
    }
}
