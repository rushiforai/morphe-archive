// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Application;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Exact-firmware layout opt-in. Preference, AppOps and local ADB work never runs on UI/input. */
public final class DiLink51Setup {
    private static final String PREFS="local_dilink51_profile",OWN="com.google.android.apps.maps.automotive";
    private static final Handler ui=new Handler(Looper.getMainLooper());
    private static final ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsDiLink51Setup");t.setDaemon(true);return t;});
    private static final AtomicLong generation=new AtomicLong(),request=new AtomicLong();
    private static final AtomicBoolean refreshing=new AtomicBoolean(),preparing=new AtomicBoolean();
    private static volatile Application context;
    private static volatile Runnable changed;
    private static volatile boolean loaded,follow,access;
    private static volatile DiLink51Profile.Theme theme=DiLink51Profile.Theme.MAP;
    private static volatile String state="Loading DiLink 5.1 layout settings.";
    private DiLink51Setup(){}

    public static boolean supported(){return DiLink51Profile.supported(Build.FINGERPRINT);}
    public static boolean loaded(){return supported()&&loaded;}
    public static boolean automatic(){return supported()&&loaded&&follow;}
    public static DiLink51Profile.Theme manualTheme(){return theme;}
    public static String status(){return supported()?state:"This layout profile is unavailable on this firmware.";}
    public static void init(Application application,Runnable onChanged){
        if(application==null||!supported())return;
        synchronized(DiLink51Setup.class){
            if(onChanged!=null)changed=onChanged;
            if(context!=null)return;
            context=application;final long epoch=generation.get();
            worker.execute(()->{
                boolean savedFollow=false;DiLink51Profile.Theme savedTheme=DiLink51Profile.Theme.MAP;
                try{
                    SharedPreferences p=preferences();savedFollow=p.getBoolean("automatic",false);
                    String name=p.getString("manual_theme",DiLink51Profile.Theme.MAP.name());
                    savedTheme=DiLink51Profile.Theme.valueOf(name==null?"":name);
                    if(savedTheme==DiLink51Profile.Theme.UNKNOWN)throw new IllegalArgumentException();
                }catch(RuntimeException invalid){savedFollow=false;savedTheme=DiLink51Profile.Theme.MAP;}
                if(generation.get()==epoch){follow=savedFollow;theme=savedTheme;loaded=true;refreshAccess();notifyChanged();}
            });
        }
    }
    private static SharedPreferences preferences(){return context.getSharedPreferences(PREFS,0);}
    private static void notifyChanged(){ui.post(()->{Runnable callback=changed;if(callback!=null)callback.run();});}
    private static String normalStatus(){
        return (follow?"Automatic following is on. ":"Manual layout is selected. ")+
            (access?"Usage Access is allowed.":"Usage Access is missing; automatic visibility is unavailable.");
    }
    private static void refreshAccess(){
        try{access=DiLink51Monitor.hasAccess(context);state=normalStatus();}
        catch(RuntimeException unavailable){access=false;state="Usage Access could not be checked; automatic visibility is unavailable.";}
    }
    /** Explicit settings-page refresh only; no ADB, event query, key offer or permission write. */
    public static void refreshStatus(){
        if(!supported()||context==null||!loaded||preparing.get()||!refreshing.compareAndSet(false,true))return;
        worker.execute(()->{try{refreshAccess();}finally{refreshing.set(false);}});
    }
    public static void setAutomatic(boolean enabled){save(enabled,theme);}
    public static void setTheme(DiLink51Profile.Theme selected){
        if(selected==null||selected==DiLink51Profile.Theme.UNKNOWN)throw new IllegalArgumentException("Choose a supported manual layout");
        save(follow,selected);
    }
    private static void save(boolean automatic,DiLink51Profile.Theme selected){
        if(!supported()||context==null||!loaded)return;
        final long epoch=generation.incrementAndGet();follow=automatic;theme=selected;state="Saving layout settings…";notifyChanged();
        worker.execute(()->{
            if(generation.get()!=epoch)return;
            boolean saved=false;
            try{saved=preferences().edit().putBoolean("automatic",automatic).putString("manual_theme",selected.name()).commit();}
            catch(RuntimeException unavailable){}
            if(generation.get()!=epoch)return;
            if(!saved){follow=false;state="Layout settings were not saved. Automatic following is off for this session; retry saving.";notifyChanged();}
            else{refreshAccess();notifyChanged();}
        });
    }

    /** The only grant path: a visible, explicit settings action followed by an owner consent dialog. */
    public static void prepareUsageAccess(Activity activity,boolean allowKey,Runnable done){
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||!supported()){finish(done);return;}
        init(activity.getApplication(),null);
        new AlertDialog.Builder(activity).setTitle("Allow Usage Access for Maps?")
            .setMessage("Maps will use Android Usage Access to follow only the stock BYD cluster Map, Scenario, Simple and mini-map activities. It does not save general app usage history.\n\nThis one-time setup uses this head unit's local ADB connection and the existing private Maps key. Approve the standard ADB prompt if shown. Only Maps Automotive's GET_USAGE_STATS permission is changed.\n\nThis does not change the Follow instrument theme switch; enable following separately if wanted. Turning following off stops its event reader and keeps the Android grant.")
            .setNegativeButton("Cancel",(d,w)->finish(done)).setOnCancelListener(d->finish(done))
            .setPositiveButton("Allow Usage Access",(d,w)->begin(activity,allowKey,done)).show();
    }
    private static void finish(Runnable done){if(done!=null)ui.post(done);}
    private static boolean active(long token,WeakReference<Activity> owner){
        Activity activity=owner.get();return context!=null&&supported()&&request.get()==token&&activity!=null&&!activity.isFinishing()&&!activity.isDestroyed();
    }
    private static void check(long token,WeakReference<Activity> owner)throws IOException{if(!active(token,owner))throw new SetupFailure("cancelled");}
    private static void begin(Activity activity,boolean allowKey,Runnable done){
        if(!preparing.compareAndSet(false,true)){finish(done);return;}
        final long token=request.incrementAndGet();final WeakReference<Activity> owner=new WeakReference<>(activity);
        state="Preparing Maps Usage Access over local ADB…";
        worker.execute(()->{
            try{grant(token,owner,allowKey);}
            catch(VehicleLocalAdb.ApprovalRequiredException approval){state="Approve the Maps ADB key on this head unit, then press Allow Usage Access again.";}
            catch(SetupFailure failure){state=failureStatus(failure.code);}
            catch(Exception unavailable){state="Usage Access setup could not finish. Check local ADB and retry the explicit setup button.";}
            finally{preparing.set(false);notifyChanged();finish(done);}
        });
    }
    private static String currentUser(VehicleLocalAdb adb)throws IOException{
        String value=adb.execute("am get-current-user").trim();if(!value.matches("[0-9]{1,6}"))throw new SetupFailure("user");
        return Integer.toString(Integer.parseInt(value));
    }
    private static String mode(VehicleLocalAdb adb,String user)throws IOException{
        return parseMode(adb.execute("cmd appops get --user "+user+" "+OWN+" GET_USAGE_STATS"));
    }
    /** Closed parser: fixed op/modes only; no raw shell reply or usage text reaches UI/logs. */
    static String parseMode(String reply)throws IOException{
        if(reply==null||reply.length()>4096)throw new SetupFailure("appop");
        String text=reply.trim();if("No operations.".equals(text))return "default";
        String[] lines=text.split("\\r?\\n",-1);if(lines.length>2)throw new SetupFailure("appop");
        if(lines.length==2&&"No operations.".equals(lines[0].trim())){
            Matcher fallback=Pattern.compile("Default mode: (allow|ignore|deny|default|foreground)").matcher(lines[1].trim());
            if(fallback.matches())return fallback.group(1);throw new SetupFailure("appop");
        }
        Pattern entry=Pattern.compile("(Uid mode:\\s*)?GET_USAGE_STATS:\\s*(allow|ignore|deny|default|foreground)(?:\\s*;[^\\r\\n]*)?");
        String uidMode=null,packageMode=null;
        for(String line:lines){
            Matcher match=entry.matcher(line.trim());if(!match.matches())throw new SetupFailure("appop");
            if(match.group(1)!=null){if(uidMode!=null)throw new SetupFailure("appop");uidMode=match.group(2);}
            else{if(packageMode!=null)throw new SetupFailure("appop");packageMode=match.group(2);}
        }
        // Android reports UID mode first because it overrides the package mode. Never edit UID mode.
        if(uidMode!=null)return uidMode;if(packageMode!=null)return packageMode;throw new SetupFailure("appop");
    }
    private static void grant(long token,WeakReference<Activity> owner,boolean allowKey)throws IOException{
        check(token,owner);
        if(!OWN.equals(context.getPackageName()))throw new SetupFailure("package");
        final int uid=Process.myUid();if(uid<0)throw new SetupFailure("user");final String ownUser=Integer.toString(uid/100000);
        try(VehicleLocalAdb adb=VehicleLocalAdb.open(context.getNoBackupFilesDir(),allowKey,()->active(token,owner))){
            check(token,owner);
            if(!"2000".equals(adb.execute("id -u").trim()))throw new SetupFailure("shell");
            String user=currentUser(adb);if(!ownUser.equals(user))throw new SetupFailure("user");
            String before=mode(adb,user);check(token,owner);
            if(!user.equals(currentUser(adb)))throw new SetupFailure("user");
            if(!"allow".equals(before)){
                check(token,owner);
                String result=adb.execute("cmd appops set --user "+user+" "+OWN+" GET_USAGE_STATS allow; printf '|maps_dilink51_rc=%s|' \"$?\"").trim();
                if(!"|maps_dilink51_rc=0|".equals(result))throw new SetupFailure("write");
            }
            check(token,owner);if(!user.equals(currentUser(adb)))throw new SetupFailure("user");
            if(!"allow".equals(mode(adb,user)))throw new SetupFailure("verify");
            refreshAccess();if(!access)throw new SetupFailure("verify");
            state=normalStatus()+" Enable Follow instrument theme separately if wanted.";
        }
    }
    private static final class SetupFailure extends IOException {final String code;SetupFailure(String code){this.code=code;}}
    private static String failureStatus(String code){
        if("shell".equals(code))return "Local ADB is not Android shell. No Usage Access write was attempted.";
        if("package".equals(code))return "Maps package identity did not match. No Usage Access write was attempted.";
        if("user".equals(code))return "The active Android user could not be verified. Retry setup in the Maps user profile.";
        if("appop".equals(code))return "The Maps Usage Access state could not be read safely. Setup is not confirmed; retry the explicit button.";
        if("cancelled".equals(code))return "Usage Access setup stopped because its settings screen is no longer available.";
        if("write".equals(code))return "Android refused the Usage Access write. Retry the explicit setup button.";
        return "Android did not confirm Maps Usage Access. Automatic visibility remains unavailable; retry setup.";
    }
}
