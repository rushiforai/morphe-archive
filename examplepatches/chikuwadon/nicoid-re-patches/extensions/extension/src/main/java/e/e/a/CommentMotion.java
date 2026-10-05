package e.e.a;
import android.os.SystemClock;import android.view.View;import android.preference.PreferenceManager;import java.util.*;
/** Keep comment onset on the video timeline, but animate an active comment at 1x. */
public final class CommentMotion {
 private static final WeakHashMap<Object,CommentMotionRules> states=new WeakHashMap<>();
 private static synchronized CommentMotionRules state(Object view){CommentMotionRules s=states.get(view);if(s==null){s=new CommentMotionRules();states.put(view,s);}return s;}
 public static void frame(Object view){state(view).frame(SystemClock.elapsedRealtime(),CommentClock.position(view),CommentClock.rate(view),CommentClock.playing(view));}
 public static float position(Object view){return state(view).position();}
 public static float start(Object view,Object comment,float timestamp){return state(view).start(comment,timestamp);}
 public static int fps(Object view){try{View v=(View)view;int fps=Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(v.getContext()).getString("comment_fps","60"));fps=Math.max(1,Math.min(120,fps));return v.getContext().getClass().getName().contains("ChormecastSenderService")?Math.min(30,fps):fps;}catch(Exception e){return 60;}}
 public static long period(Object view){return (1000L<<16)/fps(view);}
}
