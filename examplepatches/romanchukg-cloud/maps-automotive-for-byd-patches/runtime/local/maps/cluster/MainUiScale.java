// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Display;
import android.widget.Toast;
import java.lang.ref.WeakReference;

/** Local-only experiment. Maps' native DisplayScaler owns context/configuration updates. */
public final class MainUiScale {
    private static final String MAIN="com.google.android.maps.MapsActivity";
    static final String KEY="main_ui_scale";
    // Owner-requested private-car default. Existing explicit presets are never rewritten.
    private static final int DEFAULT_PERCENT=90;
    private static volatile int activePercent=DEFAULT_PERCENT;
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static final Runnable apply=MainUiScale::applyPending;
    private static WeakReference<Activity> resumed=new WeakReference<>(null);
    private static WeakReference<Activity> recreating=new WeakReference<>(null);
    private static boolean pending,explained;
    /** Fixed presets make corrupt preferences harmless and keep an explicit default. */
    static int valid(int value){return value==90||value==80?value:100;}
    static int selected(SharedPreferences prefs){
        try{return valid(prefs.getInt(KEY,DEFAULT_PERCENT));}catch(RuntimeException ignored){return 100;}
    }
    /** Called from the existing Application.attachBaseContext hook, before native UI creation. */
    public static void init(Context base){
        if(base==null)return;
        try{activePercent=selected(base.getSharedPreferences("local_cluster_settings",Context.MODE_PRIVATE));}
        catch(RuntimeException failure){activePercent=100;Log.w("MapsUiScale","using standard size after "+failure.getClass().getSimpleName());}
        Log.i("MapsUiScale","loaded main interface size="+activePercent+"%");
    }
    static int applied(Activity ignored){return activePercent;}
    /** The pinned bytecode branch calls this ONLY for the main-display Fxy.a target.
     * Its result remains subject to Maps' existing1.125 factor and native DPI/dp rounding.
     * The native wrapper preserves OS fontScale, night/locale, orientation and bounds updates.
     */
    public static float adjust(float original){
        int percent=activePercent;
        if(percent==100||Float.isNaN(original)||Float.isInfinite(original)||original<=0)return original;
        float result=original*(percent/100f);
        Log.i("MapsUiScale","main factor="+original+"->"+result+" size="+percent+"%");
        return result;
    }
    private static boolean mainActivity(Activity activity){
        if(activity==null||!MAIN.equals(activity.getClass().getName())||activity.isFinishing()||activity.isDestroyed())return false;
        try{Display display=PlatformCompat.getDisplay(activity);return display!=null&&display.getDisplayId()==Display.DEFAULT_DISPLAY;}
        catch(RuntimeException unavailable){return false;}
    }
    private static void schedule(long delay){main.removeCallbacks(apply);main.postDelayed(apply,delay);}
    /** The radio row has already saved its choice. Debounce taps and read the latest choice. */
    static void changed(Activity activity){
        if(!mainActivity(activity))return;
        pending=true;explained=false;
        if(resumed.get()==activity)schedule(150);
    }
    static void resumed(Activity activity){
        if(!mainActivity(activity))return;
        resumed=new WeakReference<>(activity);
        if(recreating.get()!=activity)recreating.clear();
        main.removeCallbacks(apply);
        if(pending)schedule(150);
    }
    static void paused(Activity activity){
        if(resumed.get()!=activity)return;
        resumed.clear();main.removeCallbacks(apply);
    }
    static void destroyed(Activity activity){
        paused(activity);
        if(recreating.get()==activity)recreating.clear();
    }
    /** Recreate only the foreground MAIN Activity in the existing process.
     * The one-second retry reads cached navigation state/preferences only. It does
     * not poll the car, start services, retain an Activity or restart the process.
     */
    private static void applyPending(){
        if(!pending)return;
        Activity activity=resumed.get();
        if(!mainActivity(activity)){resumed.clear();return;}
        if(activity.isInPictureInPictureMode()){schedule(1000);return;}
        final int wanted;
        try{wanted=selected(activity.getSharedPreferences("local_cluster_settings",Context.MODE_PRIVATE));}
        catch(RuntimeException unavailable){
            pending=false;explained=false;
            Toast.makeText(activity,"Could not read the saved size. Select it again to retry.",Toast.LENGTH_LONG).show();
            return;
        }
        if(wanted==activePercent){pending=false;explained=false;return;}
        // A recreate request is asynchronous. A second tap can save a newer choice,
        // but this instance must never request two recreations before its replacement.
        if(recreating.get()==activity)return;
        if(!BydGuidance.updatePromptSafe()){
            if(!explained){
                explained=true;
                Toast.makeText(activity,"Size saved. It will apply automatically when navigation is inactive and Maps is on screen.",Toast.LENGTH_LONG).show();
            }
            schedule(1000);return;
        }
        int previous=activePercent;
        activePercent=wanted;pending=false;explained=false;
        recreating=new WeakReference<>(activity);
        try{
            Log.i("MapsUiScale","applying main interface size="+wanted+"%");
            activity.recreate();
        }catch(RuntimeException failure){
            activePercent=previous;recreating.clear();
            Log.w("MapsUiScale","automatic redraw failed after "+failure.getClass().getSimpleName());
            Toast.makeText(activity,"Size saved, but Maps could not redraw. Select it again to retry.",Toast.LENGTH_LONG).show();
        }
    }
    private MainUiScale(){}
}
