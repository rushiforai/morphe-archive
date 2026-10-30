// SPDX-License-Identifier: GPL-3.0-only
package local.maps.gsa;

import android.app.*;
import android.content.*;
import android.content.pm.*;
import android.net.Uri;
import android.os.*;
import android.provider.Settings;
import android.util.Log;
import android.view.ContextThemeWrapper;
import java.util.*;

/** Native GoogleAuthUtil remains responsible for sign-in; this only checks its provider. */
public final class MicrogProvider {
    public static final String PACKAGE="app.revanced.android.gms";
    private static final String TAG="GsaMicrogLab";
    private static final String AUTH="com.google.android.gms.auth.GetToken";
    private static final String AUTHORITY=PACKAGE+".auth.accounts";
    private static final byte[] CERT=hex("0b6c9515afb195fac59601696ba0a7907a0b217ccf720b43148427ccf64343e7");
    private static final String GOOGLE="com.google.android.location.internal.GoogleLocationManagerService.START";
    private static final String RENAMED="app.revanced.android.location.internal.GoogleLocationManagerService.START";
    private static volatile Context base;
    private static volatile ProviderPolicy.State last;
    private static volatile long checked=-10000;
    private static volatile int suppressed;
    private static boolean installed;
    private static final Map<Activity,ProviderPolicy.State> offered=new WeakHashMap<>();
    private static final Map<Activity,AlertDialog> dialogs=new WeakHashMap<>();
    private static byte[] hex(String s){byte[] b=new byte[s.length()/2];for(int i=0;i<b.length;i++)b[i]=(byte)Integer.parseInt(s.substring(i*2,i*2+2),16);return b;}
    public static void attach(Context context){Context app=context.getApplicationContext();base=app==null?context:app;}
    private static boolean exported(ComponentInfo c){return c!=null&&c.enabled&&c.exported&&c.applicationInfo!=null&&c.applicationInfo.enabled&&PACKAGE.equals(c.packageName);}
    private static boolean supports(PackageManager pm,String action){ResolveInfo r=pm.resolveService(new Intent(action).setPackage(PACKAGE),0);return r!=null&&exported(r.serviceInfo);}
    public static synchronized ProviderPolicy.State state(Context context,boolean refresh){
        if(context!=null&&base==null)attach(context);
        Context c=context==null?base:context;
        long now=SystemClock.elapsedRealtime();if(!refresh&&last!=null&&now-checked<1500)return last;
        ProviderPolicy.State result=ProviderPolicy.State.MISSING;
        try{
            PackageManager pm=c.getPackageManager();PackageInfo info=pm.getPackageInfo(PACKAGE,0);
            boolean trusted=pm.hasSigningCertificate(PACKAGE,CERT,PackageManager.CERT_INPUT_SHA256);
            boolean enabled=info.applicationInfo!=null&&info.applicationInfo.enabled;
            int setting=pm.getApplicationEnabledSetting(PACKAGE);
            enabled&=setting!=PackageManager.COMPONENT_ENABLED_STATE_DISABLED&&setting!=PackageManager.COMPONENT_ENABLED_STATE_DISABLED_USER&&setting!=PackageManager.COMPONENT_ENABLED_STATE_DISABLED_UNTIL_USED;
            boolean auth=false,accounts=false,location=false;
            if(trusted&&enabled){
                try{auth=exported(pm.getServiceInfo(new ComponentName(PACKAGE,AUTH),0));}catch(PackageManager.NameNotFoundException ignored){}
                accounts=exported(pm.resolveContentProvider(AUTHORITY,0));
                location=supports(pm,GOOGLE)||supports(pm,RENAMED);
            }
            result=ProviderPolicy.evaluate(true,enabled,trusted,info.getLongVersionCode(),auth,accounts,location);
        }catch(PackageManager.NameNotFoundException ignored){}catch(RuntimeException ignored){result=ProviderPolicy.State.INCOMPLETE;}
        if(result!=last)Log.i(TAG,"MicroG-RE provider: "+result);
        last=result;checked=now;return result;
    }
    public static int availability(Context context){return ProviderPolicy.availability(state(context,false));}
    /** Maps' own notification sends the driver to Play Store/Play services, which the car lacks; show() explains instead. */
    public static boolean suppressesNotification(int code){
        if(!ProviderPolicy.providerError(code))return false;
        // Maps retries its connections; log each code once, not every retry.
        if(code!=suppressed){suppressed=code;Log.i(TAG,"Suppressed Google Play services notification, code "+code);}
        return true;
    }
    public static String locationAction(){
        Context c=base;
        try{if(c!=null&&state(c,false)==ProviderPolicy.State.READY){if(supports(c.getPackageManager(),GOOGLE))return GOOGLE;if(supports(c.getPackageManager(),RENAMED))return RENAMED;}}catch(RuntimeException ignored){}
        return RENAMED;
    }
    public static String description(Context c){switch(state(c,false)){
        case READY:return "MicroG-RE is available. Google sign-in is handled by Google app.";
        case MISSING:return "Install MicroG-RE 7.2.2 or newer to use Google services in Google app laboratory.";
        case DISABLED:return "MicroG-RE is disabled. Enable it in Android settings, then restart Google app.";
        case OUTDATED:return "Update MicroG-RE to version 7.2.2 or newer, then restart Google app.";
        case UNTRUSTED:return "This MicroG-RE installation has an unsupported signing certificate. Use the official MorpheApp build.";
        default:return "MicroG-RE is missing a required account or location service. Check its installation, then restart Google app.";
    }}
    public static void open(Activity a){
        ProviderPolicy.State s=state(a,true);
        try{
            if(s==ProviderPolicy.State.READY)a.startActivity(new Intent().setClassName(PACKAGE,"org.microg.gms.ui.MainSettingsActivity"));
            else if(s==ProviderPolicy.State.MISSING)a.startActivity(new Intent(Intent.ACTION_VIEW,Uri.parse("https://github.com/MorpheApp/MicroG-RE/releases")));
            else a.startActivity(new Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS,Uri.parse("package:"+PACKAGE)));
        }catch(RuntimeException ignored){android.widget.Toast.makeText(a,"Open MicroG-RE from Android settings.",android.widget.Toast.LENGTH_LONG).show();}
    }
    public static void show(Activity a){
        if(a.isFinishing()||a.isDestroyed()||dialogs.containsKey(a))return;
        AlertDialog d=new AlertDialog.Builder(new ContextThemeWrapper(a,android.R.style.Theme_DeviceDefault_Dialog_Alert)).setTitle("Google services")
            .setMessage(description(a)).setPositiveButton("Open MicroG-RE",(dialog,w)->open(a)).setNegativeButton("Not now",null)
            .setNeutralButton("Retry",(dialog,w)->{checked=-10000;if(state(a,true)==ProviderPolicy.State.READY)restart(a);else new Handler(Looper.getMainLooper()).post(()->show(a));}).create();
        dialogs.put(a,d);d.setOnDismissListener(dialog->dialogs.remove(a));d.show();
    }
    /** Same restart as ClusterSettings.restartMaps; kept local until the cluster module is ported. */
    private static void restart(Activity a){
        Intent launch=a.getPackageManager().getLaunchIntentForPackage(a.getPackageName());
        if(launch==null||launch.getComponent()==null){android.widget.Toast.makeText(a,"Close Google app completely and open it again.",android.widget.Toast.LENGTH_LONG).show();return;}
        Log.i(TAG,"MicroG-RE ready: restarting Google app");
        a.startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
        Runtime.getRuntime().exit(0);
    }
    public static void install(Application app){
        Log.i(TAG,"bootstrap=GSA-LAB.20 process="+Application.getProcessName());
        if(installed)return;installed=true;attach(app);
        CarLivePanel.install(app);
        CarVoiceStrip.install(app);
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
            public void onActivityResumed(Activity a){if(!a.getPackageName().equals("com.google.android.googlequicksearchbox"))return;
                new Handler(Looper.getMainLooper()).postDelayed(()->{if(a.isFinishing()||a.isDestroyed())return;ProviderPolicy.State s=state(a,true);if(s==ProviderPolicy.State.READY){offered.remove(a);return;}if(offered.get(a)!=s){offered.put(a,s);show(a);}},800);
            }
            public void onActivityDestroyed(Activity a){AlertDialog d=dialogs.remove(a);if(d!=null)d.dismiss();offered.remove(a);}
            public void onActivityCreated(Activity a,Bundle b){} public void onActivityStarted(Activity a){} public void onActivityPaused(Activity a){} public void onActivityStopped(Activity a){} public void onActivitySaveInstanceState(Activity a,Bundle b){}
        });
    }
}
