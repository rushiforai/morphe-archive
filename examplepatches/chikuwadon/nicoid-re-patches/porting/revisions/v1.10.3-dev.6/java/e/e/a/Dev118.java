package e.e.a;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Path;
import android.graphics.Rect;
import android.preference.PreferenceManager;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ScrollView;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.WeakHashMap;

/** Use native list-gesture semantics on the profile's ScrollView. */
public final class Dev118 {
    private static final WeakHashMap<Activity,State> STATES=new WeakHashMap<>();
    private static final class State {
        final ScrollView scroll;
        Object rules;
        Path path=new Path();
        View trace;
        int[] origin=new int[2];
        boolean claimed,enabledTrace;
        State(ScrollView view) { scroll=view; }
    }
    private Dev118(){}
    private static Object reflect(Object owner,String method,Class<?>[] signature,Object... args)throws Exception {
        Class<?> type=owner instanceof Class ? (Class<?>)owner : owner.getClass();
        Method m=type.getDeclaredMethod(method,signature);
        m.setAccessible(true);
        return m.invoke(owner instanceof Class?null:owner,args);
    }
    private static ScrollView profile(View root) {
        if(root==null || root.getVisibility()!=View.VISIBLE)return null;
        if(root instanceof ScrollView && "nicoid_my_page".equals(root.getTag()))return (ScrollView)root;
        if(root instanceof ViewGroup) {
            ViewGroup group=(ViewGroup)root;
            for(int i=0;i<group.getChildCount();i++){
                ScrollView found=profile(group.getChildAt(i));
                if(found!=null)return found;
            }
        }
        return null;
    }
    private static void clear(Activity activity) {
        State state=STATES.remove(activity);
        if(state==null || state.trace==null)return;
        if(state.trace.getParent() instanceof ViewGroup) {
            ((ViewGroup)state.trace.getParent()).removeView(state.trace);
        }
    }
    private static String pattern(State state)throws Exception {
        return (String)state.rules.getClass().getField("pattern").get(state.rules);
    }
    private static void showTrace(Activity a,State s) {
        if(!s.enabledTrace)return;
        try {
            Class<?> type=Class.forName("e.e.a.GestureControls110$Trace");
            Constructor<?> ctor=type.getDeclaredConstructor(Context.class);
            ctor.setAccessible(true);
            View trace=(View)ctor.newInstance(a);
            Field rules=type.getDeclaredField("rules");
            rules.setAccessible(true);rules.set(trace,s.rules);
            trace.setClickable(false);
            ViewGroup container=(ViewGroup)a.findViewById(android.R.id.content);
            container.addView(trace,new ViewGroup.LayoutParams(-1,-1));
            s.trace=trace;
        } catch (Exception error) {
            android.util.Log.w("nicoid-gesture","Unable to display profile gesture trace",error);
        }
    }
    private static String action(Activity a,String gesture)throws Exception {
        return (String)reflect(Class.forName("e.e.a.GestureControls110"),
            "action",new Class<?>[]{Context.class,String.class},a,gesture);
    }
    private static void updateTrace(Activity a,State s)throws Exception {
        if(s.trace==null)return;
        Class<?> type=s.trace.getClass();
        Field path=type.getDeclaredField("path");path.setAccessible(true);
        ((Path)path.get(s.trace)).set(s.path);
        String p=pattern(s), name="";
        if(p.length()>=2) {
            String mapped=action(a,p);
            if(mapped!=null && !mapped.isEmpty())name=(String)reflect(
                Class.forName("e.e.a.GestureControls110"),"name",
                new Class<?>[]{Context.class,String.class},a,mapped);
        }
        Field label=type.getDeclaredField("message");label.setAccessible(true);
        label.set(s.trace,name);
        s.trace.invalidate();
    }
    private static void execute(Activity a,State s,String gesture) {
        try {
            String mapped=action(a,gesture);
            if(mapped==null || mapped.isEmpty())return;
            if(mapped.equals("top")){s.scroll.smoothScrollTo(0,0);return;}
            if(mapped.equals("bottom")){s.scroll.fullScroll(View.FOCUS_DOWN);return;}
            reflect(Class.forName("e.e.a.GestureControls110"),"perform",
                new Class<?>[]{Activity.class,String.class},a,mapped);
        } catch (Exception error) {
            android.util.Log.w("nicoid-gesture","Profile gesture action unavailable",error);
        }
    }
    public static boolean myPageTouch(Activity a,MotionEvent event) {
        final int eventType=event.getActionMasked();
        final State previous=STATES.get(a);
        if(eventType==MotionEvent.ACTION_DOWN)clear(a);
        ScrollView scroll=profile(a.getWindow().getDecorView());
        if(scroll==null){if(eventType!=MotionEvent.ACTION_DOWN)clear(a);return false;}
        SharedPreferences prefs=PreferenceManager.getDefaultSharedPreferences(a);
        if(!prefs.getBoolean("list_gestures_enabled",false)){clear(a);return false;}
        try {
            if(!Boolean.TRUE.equals(reflect(Class.forName("e.e.a.MultiTabs227"),
                    "enabled",new Class<?>[0])))return false;
            float rawX=event.getRawX(),rawY=event.getRawY();
            final float density=a.getResources().getDisplayMetrics().density;
            if(eventType==MotionEvent.ACTION_DOWN){
                Rect visible=new Rect();
                if(!scroll.getGlobalVisibleRect(visible) || !visible.contains((int)rawX,(int)rawY))return false;
                if(Boolean.TRUE.equals(reflect(Class.forName("e.e.a.GestureControls110"),
                        "excluded",new Class<?>[]{View.class,float.class,float.class},
                        a.getWindow().getDecorView(),rawX,rawY)))return false;
                State state=new State(scroll);
                Class<?> rulesClass=Class.forName("e.e.a.GestureRules110");
                state.rules=rulesClass.getConstructor().newInstance();
                float threshold=((Number)reflect(rulesClass,"threshold",new Class<?>[]{int.class},
                    prefs.getInt("gesture_sensitivity",50))).floatValue();
                rulesClass.getField("distance").setFloat(state.rules,threshold);
                reflect(state.rules,"down",new Class<?>[]{float.class,float.class},rawX/density,rawY/density);
                View content=a.findViewById(android.R.id.content);
                content.getLocationOnScreen(state.origin);
                state.path.moveTo(rawX-state.origin[0],rawY-state.origin[1]);
                state.enabledTrace=prefs.getBoolean("list_gestures_display",true);
                STATES.put(a,state);
                return false;
            }
            State s=previous;
            if(s==null)return false;
            if(event.getPointerCount()>1 || eventType==MotionEvent.ACTION_CANCEL){
                boolean claimed=s.claimed;clear(a);return claimed;
            }
            if(eventType==MotionEvent.ACTION_MOVE){
                s.path.lineTo(rawX-s.origin[0],rawY-s.origin[1]);
                if(!s.claimed && event.getEventTime()-event.getDownTime() > 
                        android.view.ViewConfiguration.getLongPressTimeout()) {
                    if(pattern(s).isEmpty()){clear(a);return false;}
                }
                reflect(s.rules,"move",new Class<?>[]{float.class,float.class},rawX/density,rawY/density);
                if(!s.claimed && pattern(s).length()>=2){
                    s.claimed=true;
                    MotionEvent cancel=MotionEvent.obtain(event);
                    cancel.setAction(MotionEvent.ACTION_CANCEL);
                    a.getWindow().superDispatchTouchEvent(cancel);
                    cancel.recycle();
                    // Do not roll back the ScrollView position when recognizing a gesture.
                    showTrace(a,s);
                }
                if(s.claimed)updateTrace(a,s);
                return s.claimed;
            }
            if(eventType==MotionEvent.ACTION_UP){
                boolean claimed=s.claimed;
                String drawing=pattern(s);
                boolean valid=Boolean.TRUE.equals(reflect(s.rules,"valid",new Class<?>[0]));
                boolean cancelled=Boolean.TRUE.equals(reflect(s.rules,"cancelled",
                    new Class<?>[]{float.class,float.class},rawX/density,rawY/density));
                clear(a);
                if(claimed && valid && !cancelled)execute(a,s,drawing);
                return claimed;
            }
            return s.claimed;
        } catch (Exception failure) {
            clear(a);
            android.util.Log.w("nicoid-gesture","Profile touch fallback",failure);
            return false;
        }
    }
}
