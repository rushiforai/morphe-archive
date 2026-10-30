// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.os.PowerManager;
import android.os.SystemClock;
import android.util.Log;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** "Send to car" routes from the phone arrive through MicroG-RE push. After a BYD car start Android 12
 * does not let MicroG-RE restart its push service in the background ("Background started FGS:
 * Disallowed"), so routes stop arriving until it reconnects. An app exempt from battery optimization
 * may start it. The owner turns that exemption on or off here; Maps applies it through its local ADB
 * key and then asks MicroG-RE to reconnect. Nothing runs without a tap. */
final class SendToCarSetup {
    static final String MICROG="app.revanced.android.gms";
    static final String ALLOW="dumpsys deviceidle whitelist +"+MICROG;
    static final String REMOVE="dumpsys deviceidle whitelist -"+MICROG;
    static final String RECONNECT="am broadcast -n "+MICROG+"/org.microg.gms.gcm.TriggerReceiver -a org.microg.gms.gcm.FORCE_TRY_RECONNECT";
    static final long LIMIT_MS=15000;
    private static final ExecutorService setup=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsSendToCarSetup");t.setDaemon(true);return t;});
    private static final Handler ui=new Handler(Looper.getMainLooper());
    private static volatile String status="";

    static boolean installed(Context c){
        try{c.getPackageManager().getPackageInfo(MICROG,0);return true;}catch(Exception e){return false;}
    }
    /** Read without ADB: Android reports the battery-optimization exemption of any package. */
    static boolean exempt(Context c){
        try{PowerManager pm=c.getSystemService(PowerManager.class);return pm!=null&&pm.isIgnoringBatteryOptimizations(MICROG);}catch(Exception e){return false;}
    }
    static String summary(Context c){return !installed(c)?"MicroG-RE is not installed":exempt(c)?"Routes keep arriving after the car starts":"Turn on so routes arrive after the car starts";}
    static String status(){return status;}

    /** Explicit tap only: may show the one-time local ADB key approval. */
    static void configure(Activity a,boolean on,Runnable finished){
        Context c=a.getApplicationContext();
        status=on?"Turning on through local ADB…":"Turning off through local ADB…";
        run(c,on?new String[]{ALLOW,RECONNECT}:new String[]{REMOVE},()->status=result(on,exempt(c)),finished);
    }
    /** Explicit tap only: asks MicroG-RE to reconnect push now. */
    static void reconnect(Activity a,Runnable finished){
        Context c=a.getApplicationContext();
        status="Asking MicroG-RE to reconnect…";
        run(c,new String[]{RECONNECT},()->status=exempt(c)?"MicroG-RE was asked to reconnect.":"MicroG-RE was asked to reconnect. Without the exemption Android may block it.",finished);
    }
    static String result(boolean wanted,boolean actual){
        if(wanted==actual)return wanted?"On. MicroG-RE can reconnect push after the car starts.":"Off. After the car starts, routes may not arrive until MicroG-RE reconnects.";
        return "Android did not apply the change. Check that MicroG-RE is installed and try again.";
    }
    private static void run(Context c,String[] commands,Runnable done,Runnable finished){
        if(!installed(c)){status="MicroG-RE is not installed.";if(finished!=null)ui.post(finished);return;}
        setup.execute(()->{
            long start=SystemClock.uptimeMillis();
            try(VehicleLocalAdb adb=VehicleLocalAdb.open(c.getNoBackupFilesDir(),true,()->SystemClock.uptimeMillis()-start<LIMIT_MS)){
                for(String command:commands)adb.execute(command);
                done.run();
                Log.i(ChimeIdentity.TAG,"MicroG-RE setup exempt="+exempt(c));
            }catch(VehicleLocalAdb.ApprovalRequiredException e){status="Approve the Maps ADB key on this head unit once (Always allow), then tap again.";}
            catch(Exception e){status="Local ADB is not available. Enable ADB on this head unit and tap again.";Log.i(ChimeIdentity.TAG,"MicroG-RE setup unavailable: "+e.getClass().getSimpleName());}
            finally{if(finished!=null)ui.post(finished);}
        });
    }
    private SendToCarSetup(){}
}
