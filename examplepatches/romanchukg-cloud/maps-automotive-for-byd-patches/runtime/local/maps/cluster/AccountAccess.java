package local.maps.cluster;

import android.app.*;
import android.content.*;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;
import android.util.Log;
import android.view.ContextThemeWrapper;
import android.widget.Toast;

/** Android exposes the microG Google account to Maps only with Contacts; without it Maps opens microG add-account instead of signing in. */
final class AccountAccess {
    static final String PERMISSION="android.permission.READ_CONTACTS";
    private static final String TAG="MapsClusterTest";
    private static final int REQUEST=28020, RETRY_MS=3000, RETRIES=40;
    private static final Handler main=new Handler(Looper.getMainLooper());
    private static SharedPreferences prefs;
    private static boolean promptVisible, snoozed, awaitingResult, pausedSinceRequest, startedWithout;
    private static int generation;
    static synchronized void install(Application app) {
        if(prefs!=null)return;
        prefs=app.getSharedPreferences("local_account_access",Context.MODE_PRIVATE);
        // Maps reads the account list at startup, so a later grant needs a restart.
        startedWithout=!granted(app);
    }
    static boolean restartNeeded(Context c){return startedWithout&&granted(c);}
    static boolean microg(Context c) { return MicrogProvider.state(c,false)==ProviderPolicy.State.READY; }
    static boolean granted(Context c){return c.checkSelfPermission(PERMISSION)==PackageManager.PERMISSION_GRANTED;}
    private static boolean alive(Activity a){return a!=null&&!a.isFinishing()&&!a.isDestroyed();}
    static void resumed(Activity a) {
        if(prefs==null)return;
        if(awaitingResult) {
            awaitingResult=false;
            if(granted(a)){Log.i(TAG,"microG account access: Contacts granted");if(restartNeeded(a))offerRestart(a);}
            else{snoozed=true;Log.i(TAG,"microG account access: Contacts not granted");}
        }
        int g=++generation;
        main.postDelayed(()->offer(a,g,0),2500);
    }
    static void paused(){generation++;pausedSinceRequest=true;}
    private static void offer(Activity a,int g,int attempt) {
        if(g!=generation||!alive(a)||promptVisible||snoozed||prefs.getBoolean("never",false)||!microg(a)||granted(a))return;
        // Another dialog, the diagnostics choice or active guidance takes priority; retry briefly.
        if(Diagnostics.noticePending()||BydGuidance.routeActive()||!a.hasWindowFocus()) {
            if(attempt<RETRIES)main.postDelayed(()->offer(a,g,attempt+1),RETRY_MS);
            return;
        }
        promptVisible=true;
        Log.i(TAG,"microG account access: Contacts prompt shown");
        new AlertDialog.Builder(new ContextThemeWrapper(a,android.R.style.Theme_DeviceDefault_Dialog_Alert))
            .setTitle("Allow Google account access")
            .setMessage("Your Google account is managed by microG. Android lets Google Maps see that account only with the Contacts permission. Without it, Maps cannot sign in and opens the microG sign-in screen instead.\n\nWith this permission, Google Maps can also use contact addresses in search. You can change it later in Android settings.")
            .setPositiveButton("Allow",(d,w)->request(a))
            .setNegativeButton("Not now",(d,w)->snoozed=true)
            .setNeutralButton("Don't ask again",(d,w)->prefs.edit().putBoolean("never",true).apply())
            .setOnDismissListener(d->promptVisible=false).show();
    }
    private static void offerRestart(Activity a) {
        if(!alive(a))return;
        new AlertDialog.Builder(new ContextThemeWrapper(a,android.R.style.Theme_DeviceDefault_Dialog_Alert))
            .setTitle("Restart Maps to sign in")
            .setMessage("Google account access is allowed. Maps loads accounts when it starts, so restart it to see your Google account. Then tap your profile picture.")
            .setNegativeButton("Later",null)
            .setPositiveButton("Restart Maps",(d,w)->restart(a)).show();
    }
    static void restart(Activity a){Log.i(TAG,"microG account access: restarting Maps");ClusterSettings.restartMaps(a);}
    /** Also used by the Instrument cluster panel, so it clears an earlier "Don't ask again". */
    static void request(Activity a) {
        if(prefs==null||!alive(a))return;
        snoozed=false;
        boolean asked=prefs.getBoolean("asked",false);
        prefs.edit().putBoolean("asked",true).remove("never").apply();
        awaitingResult=true;
        // After a second denial Android no longer shows its dialog; only app settings can grant it.
        if(asked&&!a.shouldShowRequestPermissionRationale(PERMISSION)){openSettings(a);return;}
        pausedSinceRequest=false;
        a.requestPermissions(new String[]{PERMISSION},REQUEST);
        // A permission denied earlier by Maps itself is refused without any system dialog.
        main.postDelayed(()->{if(awaitingResult&&!pausedSinceRequest&&alive(a)&&!granted(a))openSettings(a);},1500);
    }
    private static void openSettings(Activity a) {
        awaitingResult=true;
        try {
            a.startActivity(new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,Uri.fromParts("package",a.getPackageName(),null)));
            Toast.makeText(a,"Open Permissions → Contacts → Allow, then return to Maps.",Toast.LENGTH_LONG).show();
        } catch(Exception e){awaitingResult=false;Toast.makeText(a,"Open Android settings → Apps → Maps → Permissions → Contacts.",Toast.LENGTH_LONG).show();}
    }
}
