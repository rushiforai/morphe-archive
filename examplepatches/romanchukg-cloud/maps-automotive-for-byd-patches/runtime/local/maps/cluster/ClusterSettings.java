package local.maps.cluster;

import android.app.*;
import android.content.*;
import android.os.Bundle;
import android.view.*;
import android.widget.*;

/** Persistent, live settings for our instrument-cluster route overlay. */
public final class ClusterSettings {
    static final class State {
        final boolean visible, mapEnabled, vehicleGuidance, pictureInPicture, satellite, backgroundStart;
        final int size, side, margin, vertical, pointerVertical, pointerHorizontal, clusterTheme, logoPosition;
        State(android.content.SharedPreferences p) {
            mapEnabled=p.getBoolean("map_enabled",true);
            satellite=p.getBoolean("cluster_satellite",false);
            vehicleGuidance=p.getBoolean("vehicle_guidance",true);
            visible=p.getBoolean("visible",false);
            size=Math.max(50,Math.min(100,p.getInt("size",50)));
            side=p.getInt("side",0)==1?1:0;
            margin=Math.max(0,Math.min(20,p.getInt("margin",5)));
            vertical=Math.max(-25,Math.min(25,p.getInt("vertical",0)));
            pointerVertical=Math.max(-25,Math.min(25,p.getInt("pointer_vertical",10)));
            // 0 keeps the native horizontal anchor (the centre of the free viewport).
            pointerHorizontal=Math.max(-25,Math.min(25,p.getInt("pointer_horizontal",0)));
            int theme=p.getInt("cluster_theme",THEME_AUTO);
            clusterTheme=theme==THEME_LIGHT||theme==THEME_SYSTEM||theme==THEME_AUTO?theme:THEME_DARK;
            logoPosition=p.getInt("logo_position",LOGO_BOTTOM_LEFT)==LOGO_TOP_RIGHT?LOGO_TOP_RIGHT:LOGO_BOTTOM_LEFT;
            pictureInPicture=p.getBoolean("picture_in_picture",false);
            backgroundStart=p.getBoolean(ClusterBackgroundStart.KEY,false);
        }
    }
    static final int THEME_DARK=0, THEME_LIGHT=1, THEME_SYSTEM=2, THEME_AUTO=3, LOGO_BOTTOM_LEFT=0, LOGO_TOP_RIGHT=1;
    private static java.lang.ref.WeakReference<Activity> resumedMaps=new java.lang.ref.WeakReference<>(null);
    private static android.content.SharedPreferences preferences;
    private static volatile State current;
    private static final android.content.SharedPreferences.OnSharedPreferenceChangeListener changes=(p,key)->{
        if(AppCorners.KEY.equals(key)){AppCorners.refresh();return;}
        current=new State(p); CardPlacement.refresh();
        if("pointer_vertical".equals(key)||"pointer_horizontal".equals(key))ClusterHost.refreshClusterCamera();
        if("map_enabled".equals(key))ClusterHost.mapSettingChanged();
        if("vehicle_guidance".equals(key))BydGuidance.settingsChanged();
        if("cluster_theme".equals(key))ClusterHost.themeSettingChanged();
        if("cluster_satellite".equals(key))ClusterHost.refreshClusterLayers();
        if("picture_in_picture".equals(key)){Activity a=resumedMaps.get();if(a!=null)applyPictureInPicture(a);}
    };
    /** Maps enters picture-in-picture from onUserLeaveHint only while its pb.l flag (device supports PiP) is set. */
    static void applyPictureInPicture(Activity a) {
        try {
            boolean supported=a.getPackageManager().hasSystemFeature(android.content.pm.PackageManager.FEATURE_PICTURE_IN_PICTURE);
            boolean allow=current!=null&&current.pictureInPicture&&supported;
            if(supported&&android.os.Build.VERSION.SDK_INT>=31)
                a.setPictureInPictureParams(new PictureInPictureParams.Builder().setAutoEnterEnabled(allow).setAspectRatio(new android.util.Rational(16,9)).build());
            if(!allow&&supported&&android.os.Build.VERSION.SDK_INT>=31)
                a.setPictureInPictureParams(new PictureInPictureParams.Builder().setAutoEnterEnabled(false).build());
        } catch(Throwable e){android.util.Log.w("MapsClusterTest","picture-in-picture setting",e);}
    }
    public static void leavingMaps(Activity a) {
        if(!a.getClass().getName().equals("com.google.android.maps.MapsActivity"))return;
        if(current==null||!current.pictureInPicture||a.isFinishing()||a.isInPictureInPictureMode())return;
        if(!a.getPackageManager().hasSystemFeature(android.content.pm.PackageManager.FEATURE_PICTURE_IN_PICTURE))return;
        try {a.enterPictureInPictureMode(new PictureInPictureParams.Builder().setAspectRatio(new android.util.Rational(16,9)).build());}
        catch(RuntimeException e){android.util.Log.w("MapsClusterTest","AAOS PiP",e);}
    }
    static State state(){return current;}
    static void toggleMap(){preferences.edit().putBoolean("map_enabled",!current.mapEnabled).apply();}
    static boolean untestedHud(){return preferences!=null&&preferences.getBoolean("hud_untested_firmware",false);}
    /** Restarts Maps; a killed guidance session is cleared by the next launch. */
    static void restartMaps(Activity a) {
        Intent launch=a.getPackageManager().getLaunchIntentForPackage(a.getPackageName());
        if(launch==null||launch.getComponent()==null){Toast.makeText(a,"Close Maps completely and open it again.",Toast.LENGTH_LONG).show();return;}
        android.util.Log.i("MapsClusterTest","restarting Maps from settings");
        a.startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
        Runtime.getRuntime().exit(0);
    }
    static void init(Application app) {
        if(preferences!=null)return;
        preferences=app.getSharedPreferences("local_cluster_settings",Context.MODE_PRIVATE);
        current=new State(preferences); preferences.registerOnSharedPreferenceChangeListener(changes);GeminiLaunch.init(app);
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
            public void onActivityResumed(Activity a){
                AppCorners.resumed(a);
                if(a.getClass().getName().equals("com.google.android.maps.MapsActivity")) {
                    resumedMaps=new java.lang.ref.WeakReference<>(a);GeminiLaunch.resumed(a);applyPictureInPicture(a);MainUiScale.resumed(a);
                    a.getWindow().getDecorView().post(()->{attach(a);Diagnostics.resumed(a);AccountAccess.resumed(a);SignInAccess.resumed(a);});
                }
            }
            public void onActivityCreated(Activity a,Bundle b){}
            public void onActivityStarted(Activity a){}
            public void onActivityPaused(Activity a){if(a.getClass().getName().equals("com.google.android.maps.MapsActivity")){GeminiLaunch.paused(a);MainUiScale.paused(a);AccountAccess.paused();SignInAccess.paused();}}
            public void onActivityStopped(Activity a){if(a.getClass().getName().equals("com.google.android.maps.MapsActivity"))GeminiLaunch.stopped(a);}
            public void onActivitySaveInstanceState(Activity a,Bundle b){}
            public void onActivityDestroyed(Activity a){GeminiLaunch.paused(a);AppCorners.destroyed(a);MainUiScale.destroyed(a);ClusterMenu.destroyed(a);}
        });
    }
    private static int dp(Context c,int value){return Math.round(value*c.getResources().getDisplayMetrics().density);}
    private static void attach(Activity activity){
        ClusterButtons.attach(activity);
        EvTest.attach(activity);
    }
    static void show(Activity activity){ClusterMenu.show(activity,preferences);}
}
