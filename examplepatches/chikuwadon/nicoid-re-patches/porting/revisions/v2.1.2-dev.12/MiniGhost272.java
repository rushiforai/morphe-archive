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
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;

/** Reconcile the two mini-player owners after explicit closure, not just the
 *  Activity that happened to own the panel before the app switch. */
public final class MiniGhost272 {
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final String TAG="nicoid-retained-mini-player";
    private static final String DIRECT="e.e.a.DirectBackground235";
    private static final String MINI="e.e.a.MiniSession225";
    private MiniGhost272() {}

    private static Object field(Object o,String key) {
        if(o==null)return null;
        for(Class<?> c=o.getClass();c!=null;c=c.getSuperclass())try {
            Field f=c.getDeclaredField(key);f.setAccessible(true);return f.get(o);
        }catch(Exception ignored){}
        return null;
    }
    private static Object current(String name) {
        try{Class<?> cls=Class.forName(name);Field f=cls.getDeclaredField("active");
            f.setAccessible(true);return f.get(null);
        }catch(Exception ignored){return null;}
    }
    private static void putActivity(ArrayList<Activity> targets,Object candidate) {
        if(candidate instanceof Reference)candidate=((Reference<?>)candidate).get();
        if(candidate instanceof Activity && !targets.contains(candidate))targets.add((Activity)candidate);
    }
    private static ArrayList<Activity> activities(Object session) {
        ArrayList<Activity> targets=new ArrayList<>();
        putActivity(targets,field(session,"host"));
        putActivity(targets,field(session,"source"));
        putActivity(targets,field(session,"foreground"));
        try {Class<?> cls=Class.forName("e.e.a.TabRoutes228");
            Field f=cls.getDeclaredField("foreground");f.setAccessible(true);
            putActivity(targets,f.get(null));
        }catch(Exception ignored){}
        try {Class<?> cls=Class.forName("e.e.a.PlaybackPanels113");
            Field f=cls.getDeclaredField("PANELS");f.setAccessible(true);
            Object map=f.get(null);
            if(map instanceof Map)for(Object key:new ArrayList<>(((Map<?,?>)map).keySet()))putActivity(targets,key);
        }catch(Exception ignored){}
        return targets;
    }
    private static boolean closing(Object state) {
        return Boolean.TRUE.equals(field(state,"closing"));
    }
    private static void closeSameVideo(Object owner,Object exiting,Object video) {
        if(owner==null || owner==exiting || video==null || field(owner,"video")!=video)return;
        if(closing(owner))return;
        try {
            Method method=owner.getClass().getDeclaredMethod("close",boolean.class);
            method.setAccessible(true);
            method.invoke(owner,true);
            Log.i("nicoid-mini","Closed second mini owner retaining the same video");
        }catch(Exception e){Log.w("nicoid-mini","Cannot reconcile second mini owner",e);}
    }
    public static void schedule(Object closingSession, boolean stopPlayback) {
        final WeakReference<Object> exiting = new WeakReference<>(closingSession);
        final WeakReference<Object> video = new WeakReference<>(field(closingSession, "video"));
        final WeakReference<Object> oldDirect = new WeakReference<>(stopPlayback ? current(DIRECT) : null);
        final WeakReference<Object> oldMini = new WeakReference<>(stopPlayback ? current(MINI) : null);
        final ArrayList<WeakReference<Activity>> snapshot = new ArrayList<>();
        for (Activity a : activities(closingSession)) snapshot.add(new WeakReference<>(a));
        MAIN.postDelayed(() -> {
            Object exit = exiting.get(), media = video.get();
            if (stopPlayback && exit != null && media != null) {
                Object direct = oldDirect.get(), mini = oldMini.get();
                if (direct != null && direct == current(DIRECT)) closeSameVideo(direct, exit, media);
                if (mini != null && mini == current(MINI)) closeSameVideo(mini, exit, media);
            }
            ArrayList<Activity> hosts = activities(exit);
            for (WeakReference<Activity> ref : snapshot) putActivity(hosts, ref);
            for (Activity activity : hosts) {
                if (!activity.isDestroyed()) prune(activity.getWindow().getDecorView());
            }
        },180);
    }
    /** Run on the host whose panel is actually being detached. */
    public static void afterRelease(Activity host) {
        if (host == null) return;
        WeakReference<Activity> releasedFrom = new WeakReference<>(host);
        MAIN.post(() -> {
            Activity activity = releasedFrom.get();
            if (activity != null && !activity.isDestroyed()) prune(activity.getWindow().getDecorView());
        });
    }
    private static void prune(View root) {
        if(!(root instanceof ViewGroup))return;
        Object direct=current(DIRECT);
        Object mini=current(MINI);
        Object activeDirect=closing(direct)?null:field(direct,"panel");
        Object activeMini=field(mini,"panel");
        pruneChildren((ViewGroup)root,activeDirect,activeMini);
    }
    private static void pruneChildren(ViewGroup group,Object activeDirect,Object activeMini) {
        for(int i=group.getChildCount()-1;i>=0;i--){
            View child=group.getChildAt(i);
            if(TAG.equals(child.getTag()) && child!=activeDirect && child!=activeMini){
                ViewParent parent=child.getParent();
                if(parent==group){
                    group.removeViewAt(i);
                    Log.i("nicoid-mini","Removed orphaned retained mini panel from actual host");
                }
            }else if(child instanceof ViewGroup)pruneChildren((ViewGroup)child,activeDirect,activeMini);
        }
    }
}
