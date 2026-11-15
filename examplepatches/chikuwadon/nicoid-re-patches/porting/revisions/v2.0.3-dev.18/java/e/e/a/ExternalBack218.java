package e.e.a;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.preference.PreferenceManager;
import android.util.Log;

/**
 * Issue #132: a link from an external app has a separate Back policy.
 *
 * The legacy in-app and notification-return paths remain untouched.
 * Intent classification is deliberately strict: explicit internal handoff
 * and native browse screens must never be routed as external links.
 */
public final class ExternalBack218 {
    public static final String KEY="nicoid_external_link_back";
    private ExternalBack218(){}

    static boolean isExternalVideo(Activity a){
        if(a==null||a.isFinishing()||a.isDestroyed())return false;
        String cls=a.getClass().getName();
        if(!"com.sauzask.nicoid.NicoidVideoActivity".equals(cls)
           &&!"com.sauzask.nicoid.intent.NicoidVideoActivityIntent".equals(cls))
           return false;
        Intent i=a.getIntent();
        if(i==null||!Intent.ACTION_VIEW.equals(i.getAction()))return false;
        if(i.getBooleanExtra("nicoid_return_to_browse_114",false)
           ||i.getBooleanExtra("nicoid_external_back_internal_216",false))return false;
        // Internal playback restoration uses intentselect; external wrappers
        // may also carry it, so origin/task checks below remain authoritative.
        if(i.getBooleanExtra("intentselect",false)
           &&!"com.sauzask.nicoid.intent.NicoidVideoActivityIntent".equals(cls))
           return false;
        Uri uri=i.getData();
        if(uri==null)return false;
        String scheme=uri.getScheme(),host=uri.getHost(),path=uri.getPath();
        if(scheme==null||!("https".equalsIgnoreCase(scheme)||"http".equalsIgnoreCase(scheme))
           ||host==null||path==null)return false;
        host=host.toLowerCase(java.util.Locale.ROOT);
        boolean video=("www.nicovideo.jp".equals(host)||"nicovideo.jp".equals(host)
                       ||"sp.nicovideo.jp".equals(host))&&path.startsWith("/watch/");
        boolean shortLink=("nico.ms".equals(host)||"www.nico.ms".equals(host))
                          &&path.matches("/(?:sm|nm|so|ss)[0-9]+/?");
        if(!video&&!shortLink)return false;
        // An external Android referrer is the strongest origin signal.
        Uri ref=a.getReferrer();
        if(ref!=null){
            String name=ref.getHost();
            if(name!=null&&!name.equals(a.getPackageName())
               &&!name.endsWith(".nicovideo.jp"))return true;
        }
        // Third-party apps often omit EXTRA_REFERRER. In that case only
        // treat a task-root direct watch intent as external. An in-app browse
        // destination makes this the normal in-app Back route instead.
        return a.isTaskRoot()&&PlaybackNavigation114.destination(a)==null;
    }

    // One-shot return policy: app-switch callbacks must not override a
    // Back action explicitly selected for an external video.
    private static final java.util.WeakHashMap<Activity,String> CHOSEN=new java.util.WeakHashMap<>();
    public static synchronized boolean suppressAppSwitch(Object activity){
        return activity instanceof Activity && CHOSEN.containsKey((Activity)activity);
    }
    public static synchronized void resumed(Activity a){CHOSEN.remove(a);}
    private static synchronized void mark(Activity a,String action){CHOSEN.put(a,action);}
    public static boolean back(Activity a){
        boolean external=isExternalVideo(a);
        Log.i("nicoid-external-back","Back intercepted activity="+
              (a==null?"null":a.getClass().getName())+" external="+external);
        if(!external)return false;
        String action=PreferenceManager.getDefaultSharedPreferences(a).getString(KEY,"inherit");
        Log.i("nicoid-external-back","external Back policy="+action+" activity="+a.getClass().getName()
              +" taskRoot="+a.isTaskRoot());
        if("inherit".equals(action))return false;
        try{
            if("stop".equals(action)){
                mark(a,action);
                stopPlayback(a);
                a.finish();
                Log.i("nicoid-external-back","Stopped external video and finished Activity");
                return true;
            }
            if("nicoid".equals(action)){
                mark(a,action);
                stopPlayback(a);
                if(PlaybackNavigation114.showBrowse(a,true))return true;
                Intent home=a.getPackageManager().getLaunchIntentForPackage(a.getPackageName());
                if(home==null)return false;
                home.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP|Intent.FLAG_ACTIVITY_SINGLE_TOP);
                home.putExtra("nicoid_external_back_internal_216",true);
                a.startActivity(home);
                a.overridePendingTransition(0,0);
                a.finish();
                return true;
            }
            if("popup".equals(action)){
                Object f=Playback214.get(a,"v");
                if(f==null||!PlaybackTransfer221.popup(f,false))return false;
                mark(a,action);
                a.moveTaskToBack(true);
                return true;
            }
            if("background".equals(action)){
                Runnable committed=RetainedPlayback137.captureForExternal(a);
                if(committed==null){
                    android.widget.Toast.makeText(a,"バックグラウンド再生を開始できません",0).show();
                    return true;
                }
                mark(a,action);
                if(a.moveTaskToBack(true)){
                    committed.run();
                    Log.i("nicoid-external-back","External link retained; media controls remain active");
                    return true;
                }
                resumed(a);
                RetainedPlayback137.cancelExternal(a);
                return false;
            }
        }catch(Exception e){
            resumed(a);
            Log.w("nicoid-external-back","External Back failed",e);
        }
        return false;
    }
    private static void stopPlayback(Activity a){
        RetainedPlayback137.stopExternal(a);
        try {
            Object fragment=Playback214.get(a,"v");
            if(fragment==null)return;
            Object player=Playback214.get(fragment,"a0");
            if(player!=null){
                try{player.getClass().getMethod("pause").invoke(player);}
                catch(Exception failure){Log.w("nicoid-external-back","pause unavailable",failure);}
            }
            // Explicit user Stop must detach the old MediaSession and its
            // controls before the lifecycle can dispatch app-switch playback.
            PlaybackSession.destroy(fragment,false);
        }catch(Exception e){Log.w("nicoid-external-back","Stop cleanup failed",e);}
    }
}
