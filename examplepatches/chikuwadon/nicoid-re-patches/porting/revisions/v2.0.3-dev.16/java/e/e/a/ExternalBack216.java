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
public final class ExternalBack216 {
    public static final String KEY="nicoid_external_link_back";
    private ExternalBack216(){}

    static boolean isExternalVideo(Activity a){
        if(a==null||a.isFinishing()||a.isDestroyed())return false;
        if(!"com.sauzask.nicoid.NicoidVideoActivity".equals(a.getClass().getName()))return false;
        Intent i=a.getIntent();
        if(i==null||!Intent.ACTION_VIEW.equals(i.getAction()))return false;
        if(i.getBooleanExtra("nicoid_return_to_browse_114",false)
           ||i.getBooleanExtra("intentselect",false)
           ||i.getBooleanExtra("nicoid_external_back_internal_216",false))return false;
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

    public static boolean back(Activity a){
        if(!isExternalVideo(a))return false;
        String action=PreferenceManager.getDefaultSharedPreferences(a).getString(KEY,"inherit");
        if("inherit".equals(action))return false;
        try{
            if("stop".equals(action)){
                Object f=Playback214.get(a,"v");
                if(f!=null){
                    try{
                        Object player=Playback214.get(f,"a0");
                        if(player!=null)player.getClass().getMethod("pause").invoke(player);
                    }catch(Exception e){Log.w("nicoid-external-back","Pause before closing",e);}
                    PlaybackSession.save(f,false);
                }
                a.finish();
                return true;
            }
            if("nicoid".equals(action)){
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
                a.moveTaskToBack(true);
                return true;
            }
            if("background".equals(action)){
                Runnable committed=RetainedPlayback137.captureForExternal(a);
                if(committed==null){
                    android.widget.Toast.makeText(a,"バックグラウンド再生を開始できません",0).show();
                    return true;
                }
                if(a.moveTaskToBack(true)){
                    committed.run();
                    Log.i("nicoid-external-back","External link retained; media controls remain active");
                    return true;
                }
                RetainedPlayback137.cancelExternal(a);
                return false;
            }
        }catch(Exception e){
            Log.w("nicoid-external-back","External Back failed",e);
        }
        return false;
    }
}
