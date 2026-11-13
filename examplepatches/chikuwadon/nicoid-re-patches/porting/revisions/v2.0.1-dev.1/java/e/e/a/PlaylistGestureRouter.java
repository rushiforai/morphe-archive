package e.e.a;
import android.app.Activity;
import android.graphics.Path;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.ScrollView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Gesture routing for the visible local playlist (folder or video list). */
public final class PlaylistGestureRouter {
  private static final WeakHashMap<Activity,State> STATES=new WeakHashMap<>();
  private static final class State {
    final WeakReference<View> target;
    final GestureRules110 rules=new GestureRules110();
    final Path path=new Path();
    final int[] origin=new int[2];
    WeakReference<GestureControls110.Trace> trace;
    boolean claimed,feedback;
    State(View view){target=new WeakReference<>(view);}
  }
  private PlaylistGestureRouter(){}
  static void clear(Activity a){
    State s=STATES.remove(a);
    if(s==null||s.trace==null)return;
    View t=s.trace.get();
    if(t!=null&&t.getParent() instanceof ViewGroup)((ViewGroup)t.getParent()).removeView(t);
  }
  static View page(Activity a){
    try{
      Object v=a.getClass().getField("y").get(a);
      if(v instanceof View&&((View)v).isShown())return (View)v;
    }catch(ReflectiveOperationException ignored){}
    return null;
  }
  static boolean hit(View v,float x,float y){
    Rect r=new Rect();return v.isShown()&&v.getGlobalVisibleRect(r)&&r.contains((int)x,(int)y);
  }
  static View scrollAt(View v,float x,float y){
    if(!hit(v,x,y))return null;
    if(v instanceof ViewGroup){
      ViewGroup g=(ViewGroup)v;
      for(int i=g.getChildCount()-1;i>=0;i--){
        View found=scrollAt(g.getChildAt(i),x,y);
        if(found!=null)return found;
      }
    }
    return v instanceof ListView||v instanceof ScrollView?v:null;
  }
  static boolean editing(View v){
    if(PlaylistGesturePolicy.blockedTag(v.getTag()))return true;
    if(v instanceof ViewGroup){
      ViewGroup g=(ViewGroup)v;
      for(int i=0;i<g.getChildCount();i++)if(editing(g.getChildAt(i)))return true;
    }
    return false;
  }
  static void showTrace(Activity a,State s){
    if(!s.feedback)return;
    View content=a.findViewById(android.R.id.content);
    if(!(content instanceof ViewGroup))return;
    GestureControls110.Trace t=new GestureControls110.Trace(a);
    t.rules=s.rules;t.setClickable(false);
    ((ViewGroup)content).addView(t,new ViewGroup.LayoutParams(-1,-1));
    s.trace=new WeakReference<>(t);
  }
  static void updateTrace(Activity a,State s){
    GestureControls110.Trace t=s.trace==null?null:s.trace.get();
    if(t==null)return;
    t.path.set(s.path);
    String mapped=GestureControls110.action(a,s.rules.pattern);
    t.message=s.rules.valid()&&mapped!=null&&!mapped.isEmpty()
      ?GestureControls110.name(a,mapped):"";
    t.invalidate();
  }
  static void perform(Activity a,State s,String action){
    View v=s.target.get();
    if(v==null||!v.isAttachedToWindow())return;
    if("top".equals(action)||"bottom".equals(action)){
      if(v instanceof ListView){
        ListView list=(ListView)v;
        list.setSelection("top".equals(action)?0:Math.max(0,list.getCount()-1));
      }else if(v instanceof ScrollView){
        if("top".equals(action))((ScrollView)v).smoothScrollTo(0,0);
        else ((ScrollView)v).fullScroll(View.FOCUS_DOWN);
      }
      return;
    }
    GestureControls110.perform(a,action);
  }
  /** -1: other screen, 0: unclaimed local touch, 1: recognized local gesture. */
  public static int touch(Activity a,MotionEvent e){
    if(a.getIntent()==null||!a.getIntent().getBooleanExtra("nicoid_local_playlists",false)){
      clear(a);return -1;
    }
    int kind=e.getActionMasked();
    if(kind==MotionEvent.ACTION_DOWN)clear(a);
    if(!GestureControls110.prefs(a).getBoolean("list_gestures_enabled",false)
      ||!MultiTabs227.enabled()){clear(a);return 0;}
    View root=page(a);
    if(root==null){clear(a);return 0;}
    float x=e.getRawX(),y=e.getRawY(),d=a.getResources().getDisplayMetrics().density;
    if(kind==MotionEvent.ACTION_DOWN){
      if(editing(root)||GestureControls110.excluded(a.getWindow().getDecorView(),x,y))return 0;
      View target=scrollAt(root,x,y);
      if(target==null)return 0;
      State s=new State(target);
      s.rules.distance=GestureRules110.threshold(
        GestureControls110.prefs(a).getInt("gesture_sensitivity",50));
      s.rules.down(x/d,y/d);
      View content=a.findViewById(android.R.id.content);
      if(content==null)return 0;
      content.getLocationOnScreen(s.origin);
      s.path.moveTo(x-s.origin[0],y-s.origin[1]);
      s.feedback=GestureControls110.prefs(a).getBoolean("list_gestures_display",true);
      STATES.put(a,s);return 0;
    }
    State s=STATES.get(a);
    if(s==null)return 0;
    if(e.getPointerCount()>1||kind==MotionEvent.ACTION_CANCEL){
      int result=s.claimed?1:0;clear(a);return result;
    }
    View target=s.target.get();
    if(target==null||!target.isShown()){clear(a);return 0;}
    if(kind==MotionEvent.ACTION_MOVE){
      s.path.lineTo(x-s.origin[0],y-s.origin[1]);
      if(!s.claimed&&s.rules.pattern.isEmpty()
        &&e.getEventTime()-e.getDownTime()>ViewConfiguration.getLongPressTimeout()){
        clear(a);return 0;
      }
      s.rules.move(x/d,y/d);
      String action=GestureControls110.action(a,s.rules.pattern);
      if(!s.claimed&&PlaylistGesturePolicy.claim(s.rules.valid(),
        Dev128.allowClaim(a,s.rules.pattern),action,false)){
        s.claimed=true;
        MotionEvent cancel=MotionEvent.obtain(e);
        try{
          cancel.setAction(MotionEvent.ACTION_CANCEL);
          a.getWindow().superDispatchTouchEvent(cancel);
        }finally{cancel.recycle();}
        // Preserve scroll position; never snap back to the gesture's start.
        showTrace(a,s);
      }
      if(s.claimed)updateTrace(a,s);
      return s.claimed?1:0;
    }
    if(kind==MotionEvent.ACTION_UP){
      boolean claimed=s.claimed;
      String action=GestureControls110.action(a,s.rules.pattern);
      boolean execute=claimed&&s.rules.valid()&&!s.rules.cancelled(x/d,y/d)
        &&Dev128.allowClaim(a,s.rules.pattern)&&action!=null&&!action.isEmpty();
      clear(a);
      if(execute)perform(a,s,action);
      return claimed?1:0;
    }
    return s.claimed?1:0;
  }
}
