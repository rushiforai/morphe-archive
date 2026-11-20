package e.e.a;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.util.Log;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;

/** Remove only orphaned, explicitly tagged in-app mini panels after closure. */
public final class MiniGhost272 {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final String TAG="nicoid-retained-mini-player";
    private MiniGhost272() {}
    private static Object field(Object o,String key) {
        if(o==null)return null;
        for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try {
            Field f=c.getDeclaredField(key);f.setAccessible(true);return f.get(o);
        }catch(Exception ignored){}
        return null;
    }
    private static Object current(String className) {
        try {Class<?> c=Class.forName(className);Field f=c.getDeclaredField("active");f.setAccessible(true);return f.get(null);}
        catch(Exception ignored){return null;}
    }
    private static Activity activity(Object session) {
        Object host=field(session,"host");
        if(host instanceof Activity)return (Activity)host;
        Object source=field(session,"source");
        if(source instanceof Activity)return (Activity)source;
        return null;
    }
    public static void schedule(Object closingSession) {
        Activity host=activity(closingSession);
        Activity foreground=null;
        try {Class<?> cls=Class.forName("e.e.a.TabRoutes228");
             Field f=cls.getDeclaredField("foreground");f.setAccessible(true);Object ref=f.get(null);
             Object value=ref instanceof Reference?((Reference<?>)ref).get():null;
             if(value instanceof Activity)foreground=(Activity)value;
        }catch(Exception ignored){}
        if(host!=null)enqueue(host);
        if(foreground!=null&&foreground!=host)enqueue(foreground);
    }
    private static void enqueue(Activity target) {
        final WeakReference<Activity> ref=new WeakReference<>(target);
        MAIN.postDelayed(()->{
            Activity activity=ref.get();
            if(activity==null||activity.isDestroyed())return;
            View root=activity.getWindow().getDecorView();
            prune(root,field(current("e.e.a.DirectBackground235"),"panel"),
                       field(current("e.e.a.MiniSession225"),"panel"));
        },160);
    }
    private static void prune(View view,Object activeDirect,Object activeMini) {
        if(!(view instanceof ViewGroup))return;
        ViewGroup group=(ViewGroup)view;
        for(int i=group.getChildCount()-1;i>=0;i--){
            View child=group.getChildAt(i);
            if(TAG.equals(child.getTag()) && child!=activeDirect && child!=activeMini){
                // All active mini players are exempt, including a newly created successor.
                ViewParent parent=child.getParent();
                if(parent==group){group.removeViewAt(i);Log.i("nicoid-mini","Removed orphaned retained mini panel");}
            }else prune(child,activeDirect,activeMini);
        }
    }
}
