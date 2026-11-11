package e.e.a;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.BaseAdapter;
import android.widget.ListView;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Change the ranking period within the current tab. In contrast to the
 * legacy spinner handler, this neither starts an Activity nor replaces
 * a Fragment; its existing list loader performs an ordinary refresh.
 */
public final class Dev134 {
    private static final String TAG="nicoid-ranking-period";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Activity,Pending> PENDING=new WeakHashMap<>();
    private static final int MAX_RETRIES=100;
    private Dev134(){}

    private static final class Pending {
        final WeakReference<Object> fragment;
        final String tabId;
        final String url;
        Pending(Object fragment,String tabId,String url) {
            this.fragment=new WeakReference<>(fragment);
            this.tabId=tabId;
            this.url=url;
        }
    }
    private static Field field(Class<?> type,String name) throws Exception {
        for(Class<?> c=type;c!=null;c=c.getSuperclass()) {
            try {
                Field f=c.getDeclaredField(name);
                f.setAccessible(true);
                return f;
            } catch(NoSuchFieldException ignored){}
        }
        throw new NoSuchFieldException(name);
    }
    private static Object get(Object owner,String name) throws Exception {
        return field(owner.getClass(),name).get(owner);
    }
    private static void set(Object owner,String name,Object value) throws Exception {
        field(owner.getClass(),name).set(owner,value);
    }
    private static Object call(Object owner,String name,Class<?>[] signature,Object... args)
            throws Exception {
        Method m=owner.getClass().getDeclaredMethod(name,signature);
        m.setAccessible(true);
        return m.invoke(owner,args);
    }
    private static void callStatic(Class<?> owner,String name,Class<?>[] signature,Object... args)
            throws Exception {
        Method m=owner.getDeclaredMethod(name,signature);
        m.setAccessible(true);
        m.invoke(null,args);
    }
    private static boolean rankingUri(Uri uri) {
        if(uri==null) return false;
        String path=uri.getPath(),term=uri.getQueryParameter("term");
        if(path==null || !path.contains("/ranking/") || term==null) return false;
        switch(term) {
            case "hour":case "24h":case "week":case "month":case "total":return true;
            default:return false;
        }
    }
    private static boolean active(Object fragment,Object loader) {
        try {
            if(Boolean.TRUE.equals(get(loader,"n")))return true;
            Class<?> refresh=Class.forName("e.e.a.Refresh192");
            Object map=field(refresh,"ACTIVE").get(null);
            return map instanceof Map && ((Map<?,?>)map).containsKey(fragment);
        } catch(Exception ignored) {return false;}
    }
    /** Intercept the replacement-Activity route only for a live ranking tab. */
    public static boolean applyPeriod(Activity activity,Intent next) {
        if(activity==null||next==null||activity.isFinishing()||activity.isDestroyed()
                || !rankingUri(next.getData()))return false;
        if(Looper.myLooper()!=Looper.getMainLooper())return false;
        try {
            Class<?> multi=Class.forName("e.e.a.MultiTabs227");
            Object all=field(multi,"HOSTS").get(null);
            if(!(all instanceof Map))return false;
            Object host=((Map<?,?>)all).get(activity);
            if(host==null)return false;
            Object fragment=get(host,"current");
            String tabId=(String)get(host,"currentId");
            if(fragment==null||tabId==null||tabId.isEmpty())return false;
            if(!Integer.valueOf(6).equals(get(fragment,"g0")))return false;
            String before=String.valueOf(get(fragment,"d0"));
            if(!rankingUri(Uri.parse(before)))return false;
            Object loader=get(fragment,"c0");
            ListView list=(ListView)get(fragment,"b0");
            if(loader==null||list==null)return false;
            Method data=multi.getDeclaredMethod("data");data.setAccessible(true);
            Object model=data.invoke(null);
            Object tab=call(model,"find",new Class<?>[]{String.class},tabId);
            if(tab==null)return false;

            String updated=next.getDataString();
            if(updated.equals(before))return true;
            String subtitle=next.getStringExtra("subtitle");
            if(subtitle==null)subtitle=String.valueOf(get(tab,"subtitle"));
            // The existing tab and native Fragment stay alive. Persist its new
            // descriptor and arguments so later restoration uses the new period.
            set(tab,"url",updated);
            set(tab,"subtitle",subtitle);
            set(fragment,"d0",updated);
            set(fragment,"f0",subtitle);
            Object args=get(fragment,"f");
            if(args instanceof Bundle){
                ((Bundle)args).putString("url",updated);
                ((Bundle)args).putString("subtitle",subtitle);
            }
            next.putExtra("nicoid_saved_tab_id",tabId);
            activity.setIntent(next);
            callStatic(multi,"save",new Class<?>[0]);
            callStatic(Class.forName("e.e.a.TabPager233"),"destroy",
                       new Class<?>[]{Activity.class},activity);
            callStatic(Class.forName("e.e.a.RankingCaption232"),"refresh",
                       new Class<?>[]{Object.class},fragment);
            call(host,"bar",new Class<?>[0]);

            Pending change=new Pending(fragment,tabId,updated);
            PENDING.put(activity,change);
            enqueue(new WeakReference<>(activity),change,0);
            return true;
        }catch(Exception error){
            Log.w(TAG,"Cannot update ranking period in place",error);
            return false;
        }
    }
    private static void enqueue(WeakReference<Activity> activity,Pending change,int attempts) {
        MAIN.postDelayed(()->{
            Activity a=activity.get();
            if(a==null||a.isDestroyed()||a.isFinishing()
                    ||PENDING.get(a)!=change)return;
            Object fragment=change.fragment.get();
            if(fragment==null){PENDING.remove(a);return;}
            try {
                Class<?> multi=Class.forName("e.e.a.MultiTabs227");
                Object host=((Map<?,?>)field(multi,"HOSTS").get(null)).get(a);
                if(host==null||!change.tabId.equals(get(host,"currentId"))
                        ||get(host,"current")!=fragment) {
                    // A hidden or closed tab can be loaded when it becomes
                    // active again; never mutate another page's list.
                    PENDING.remove(a);
                    return;
                }
                Object loader=get(fragment,"c0");
                if(loader==null){PENDING.remove(a);return;}
                if(active(fragment,loader)){
                    if(attempts<MAX_RETRIES)enqueue(activity,change,attempts+1);
                    else{
                        PENDING.remove(a);
                        Log.w(TAG,"Ranking loader remained busy after period change");
                        Toast.makeText(a,"ランキングの更新を開始できませんでした",Toast.LENGTH_SHORT).show();
                    }
                    return;
                }
                // Reuse the network refresh that normal pull-to-refresh uses.
                // Clear the old period rows; do not retain the old scroll anchor.
                set(loader,"b",change.url);
                @SuppressWarnings("unchecked")
                ArrayList<Object> rows=(ArrayList<Object>)get(fragment,"a0");
                if(rows!=null)rows.clear();
                ListView list=(ListView)get(fragment,"b0");
                if(list!=null)list.setSelection(0);
                Object adapter=get(fragment,"p0");
                if(adapter instanceof BaseAdapter)
                    ((BaseAdapter)adapter).notifyDataSetChanged();
                Class<?> refresh=Class.forName("e.e.a.Refresh192");
                callStatic(refresh,"start",new Class<?>[]{Object.class,Object.class},fragment,null);
                PENDING.remove(a);
            }catch(Exception error){
                PENDING.remove(a);
                Log.w(TAG,"In-place ranking reload failed",error);
                Toast.makeText(a,"ランキングの更新に失敗しました",Toast.LENGTH_SHORT).show();
            }
        },attempts==0?0:100);
    }
}
