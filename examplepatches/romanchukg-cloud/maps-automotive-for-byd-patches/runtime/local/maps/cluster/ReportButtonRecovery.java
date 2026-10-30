package local.maps.cluster;

import android.os.*;
import android.view.*;
import java.lang.ref.WeakReference;
import java.lang.reflect.*;
import java.util.*;

/** Re-publishes the native incident model; never forces visibility or submits a road report. */
public final class ReportButtonRecovery {
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final List<WeakReference<Object>> controllers=new ArrayList<>();
    private static final WeakHashMap<Object,String> states=new WeakHashMap<>();
    private static long checked;
    private static boolean failed;
    public static void register(Object controller){main.post(()->controllers.add(new WeakReference<>(controller)));}
    private static Object get(Object o,String name)throws Exception{Field f=o.getClass().getDeclaredField(name);f.setAccessible(true);return f.get(o);}
    static void observe(View root){
        long now=SystemClock.elapsedRealtime();if(now-checked<250)return;checked=now;
        for(Iterator<WeakReference<Object>> it=controllers.iterator();it.hasNext();){
            Object controller=it.next().get();if(controller==null){it.remove();continue;}
            try{
                Object model=get(controller,"a");if(model==null)continue;
                View view=(View)controller.getClass().getMethod("b").invoke(controller);
                if(!view.isAttachedToWindow()||view.getRootView()!=root)continue;
                Object eligibility=get(model,"b");boolean eligible=(Boolean)eligibility.getClass().getMethod("b").invoke(eligibility);
                boolean f=(Boolean)get(model,"f"),g=(Boolean)get(model,"g");
                String key="route="+BydGuidance.routeActive()+" auth="+MicrogProvider.state(root.getContext(),false)+" eligible="+eligible+" f="+f+" g="+g+" visibility="+view.getVisibility();
                if(key.equals(states.get(controller)))continue;states.put(controller,key);
                android.util.Log.i("MapsReportRecovery",key);
                if(eligible&&g){
                    WeakReference<Object> ref=new WeakReference<>(controller);
                    for(long delay:new long[]{400,1800})main.postDelayed(()->refresh(root,ref,key),delay);
                }
            }catch(Exception error){if(!failed){failed=true;android.util.Log.w("MapsReportRecovery","Native incident model unavailable: "+error.getClass().getSimpleName());}}
        }
    }
    private static void refresh(View root,WeakReference<Object> ref,String expected){
        Object controller=ref.get();if(controller==null||!root.isAttachedToWindow()||!root.hasWindowFocus()||!expected.equals(states.get(controller)))return;
        try{
            Object model=get(controller,"a");if(model==null)return;
            Object publisher=get(model,"a");publisher.getClass().getMethod("a",Class.forName("tty")).invoke(publisher,model);
            root.requestLayout();android.util.Log.i("MapsReportRecovery","Native incident model refreshed; no eligibility override");
        }catch(Exception error){android.util.Log.w("MapsReportRecovery","Incident refresh failed: "+error.getClass().getSimpleName());}
    }
}
