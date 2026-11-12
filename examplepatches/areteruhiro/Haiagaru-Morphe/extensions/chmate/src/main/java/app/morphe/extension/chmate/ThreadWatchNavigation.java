package app.morphe.extension.chmate;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import java.lang.ref.WeakReference;

/** Resolve a notification's response after native DAT download and adapter binding. */
public final class ThreadWatchNavigation {
    private static final String PREFS="haiagaru-watch-navigation";
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static final long TIMEOUT=40000L;
    private static Pending pending;

    private static final class Pending {
        final String url;final int number;final long expires;
        WeakReference<Object> fragment;
        WeakReference<View> list;
        int lastRefreshAttempt=-1;
        Pending(String url,int number,long expires){this.url=url;this.number=number;this.expires=expires;}
    }

    static void expect(Context context,String url,int number){
        if(ThreadWatchRules.target(url)==null||number<1)return;
        long expires=System.currentTimeMillis()+TIMEOUT;
        context.getSharedPreferences(PREFS,0).edit().putString("url",url).putInt("number",number)
                .putLong("expires",expires).apply();
        pending=new Pending(url,number,expires);
    }

    static void register(Object fragment,View list){
        if(list==null)return;
        Pending target=load(list.getContext());
        if(target==null)return;
        // Existing tabs can resume before the notification's reader. Bind only
        // the exact thread; otherwise they steal this pending navigation.
        try {
            Activity activity=(Activity)fragment.getClass().getMethod("getActivity").invoke(fragment);
            if(activity==null)return;
            String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
            String address=NativeThreadContext.url(NativeThreadContext.board(fragment,version),version,1);
            ThreadWatchRules.Target opened=address==null?null:ThreadWatchRules.target(address);
            ThreadWatchRules.Target expected=ThreadWatchRules.target(target.url);
            if(opened==null||expected==null||!opened.url.equals(expected.url))return;
        }catch(Exception unavailable){return;}
        if(target.fragment!=null&&target.fragment.get()==fragment&&target.list.get()==list)return;
        target.fragment=new WeakReference<>(fragment);target.list=new WeakReference<>(list);
        poll(target,fragment,list,0);
    }

    public static void onResume(Object fragment){
        try {
            View root=(View)fragment.getClass().getMethod("getView").invoke(fragment);
            register(fragment,FilterPosition.findListForBinding(root));
        }catch(Exception error){Log.w("Haiagaru","Watched navigation resume unavailable",error);}
    }

    private static Pending load(Context context){
        if(pending==null){
            android.content.SharedPreferences pref=context.getSharedPreferences(PREFS,0);
            String url=pref.getString("url",null);
            if(url!=null)pending=new Pending(url,pref.getInt("number",1),pref.getLong("expires",0));
        }
        if(pending!=null&&System.currentTimeMillis()>pending.expires)clear(context,pending);
        return pending;
    }

    private static void clear(Context context,Pending target){
        if(pending!=target)return;
        pending=null;context.getSharedPreferences(PREFS,0).edit().clear().apply();
    }

    private static void poll(Pending target,Object fragment,View list,int attempt){
        if(pending!=target||System.currentTimeMillis()>target.expires){clear(list.getContext(),target);return;}
        if(target.fragment==null||target.fragment.get()!=fragment||target.list.get()!=list)return;
        try {
            Activity activity=(Activity)fragment.getClass().getMethod("getActivity").invoke(fragment);
            if(activity==null||activity.isFinishing()||activity.isDestroyed()||!list.isAttachedToWindow())return;
            String version=activity.getPackageManager().getPackageInfo(activity.getPackageName(),0).versionName;
            Object board=NativeThreadContext.board(fragment,version);
            String url=NativeThreadContext.url(board,version,1);
            ThreadWatchRules.Target opened=url==null?null:ThreadWatchRules.target(url);
            ThreadWatchRules.Target requested=ThreadWatchRules.target(target.url);
            if(opened!=null&&requested!=null){
                // Only move within the exact thread requested by the notification.
                // An older tab may resume before the newly opened reader binds.
                // Keep the target pending for that reader instead of discarding it.
                if(!opened.url.equals(requested.url))return;
                if(XPostPreviewPosition.hasUserInteraction(list)){clear(list.getContext(),target);return;}
                if(FilterPosition.jumpToResponse(fragment,target.number)){clear(list.getContext(),target);return;}
                // The worker may finish after the activity appears. Ask the native
                // reader to refresh once, then retry its real response adapter.
                if(attempt>=6&&(target.lastRefreshAttempt<0||attempt-target.lastRefreshAttempt>=12)){
                    target.lastRefreshAttempt=attempt;
                    OpenTabsRefresh.refreshWatchedFragment(fragment);
                }
            }
        }catch(Exception error){if(attempt==0)Log.w("Haiagaru","Watched reply navigation unavailable",error);}
        if(attempt<78)MAIN.postDelayed(()->poll(target,fragment,list,attempt+1),500);
        else clear(list.getContext(),target);
    }

    private ThreadWatchNavigation() { }
}
