// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import java.io.IOException;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;

/** Independently opted-in key service setup. All preference/ADB/settings work runs off UI. */
public final class WheelServiceSetup {
    private static final ScheduledExecutorService worker=Executors.newSingleThreadScheduledExecutor(r->{Thread thread=new Thread(r,"MapsWheelSetup");thread.setDaemon(true);return thread;});
    private static final Handler ui=new Handler(Looper.getMainLooper());
    private static final AtomicLong generation=new AtomicLong();
    private static volatile Application context;
    private static volatile WheelZoomSettings settings=WheelZoomSettings.defaults();
    private static volatile boolean loaded,connected;
    private static volatile String state="Steering-wheel zoom is loading.";
    private static volatile VehicleLocalAdb connection;
    private static long lastAttempt;
    private static long burstStarted;
    private static int attemptsLeft=6;
    private static final String TAG="MapsWheelSetup";
    /** Cold-start repair delay. A BYD quickboot force-stops Maps; afterwards Android keeps the
     * service listed but does not bind it again (seen on Tang 2026-10-20), while the explicit
     * toggle bound it within the same second. 10 s lets Android bind normally and covers the
     * start attempt and the +4 s resume attempt, well before the 30 s retry. */
    static final long AUTO_REBIND_DELAY_MS=10000;
    static long autoRebindDelayMs=AUTO_REBIND_DELAY_MS; // host tests shorten it
    private static final AtomicBoolean autoRebindUsed=new AtomicBoolean();
    private WheelServiceSetup(){}

    public static void init(Application application){
        if(application==null||context!=null)return;
        synchronized(WheelServiceSetup.class){
            if(context!=null)return;context=application;final long epoch=generation.get();
            worker.execute(()->{
                try{WheelZoomSettings saved=WheelZoomSettings.read(context);if(generation.get()==epoch){settings=saved;loaded=true;state=saved.enabled?(connected?"Connected. Press the custom key to toggle cluster zoom controls.":"Waiting for the wheel key service."):"Steering-wheel zoom is off.";}}
                catch(IOException unavailable){if(generation.get()==epoch){settings=WheelZoomSettings.defaults();loaded=true;state="Could not load wheel settings; steering-wheel zoom is off.";}}
                burstStarted=SystemClock.uptimeMillis();attempt(false,false);
                worker.schedule(()->autoRebind(epoch),autoRebindDelayMs,TimeUnit.MILLISECONDS);
            });
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
                public void onActivityResumed(Activity activity){worker.schedule(()->{
                    long now=SystemClock.uptimeMillis();
                    if(enabled()&&!connected&&attemptsLeft==0&&now-burstStarted>=300000){attemptsLeft=6;burstStarted=now;lastAttempt=0;}
                    attempt(false,false);
                },4,TimeUnit.SECONDS);}
                public void onActivityCreated(Activity activity,Bundle saved){}public void onActivityStarted(Activity activity){}public void onActivityPaused(Activity activity){}public void onActivityStopped(Activity activity){}public void onActivitySaveInstanceState(Activity activity,Bundle saved){}public void onActivityDestroyed(Activity activity){}
            });
            worker.scheduleWithFixedDelay(()->attempt(false,false),30,30,TimeUnit.SECONDS);
        }
    }
    public static boolean enabled(){return loaded&&settings.enabled;}
    public static boolean connected(){return connected;}
    public static String status(){return state;}
    static WheelKeyPolicy.Bindings bindings(){return settings.bindings;}
    static WheelKeyPolicy.Binding geminiBinding(){return settings.gemini;}
    static final WheelKeyPolicy.Learning learning=new WheelKeyPolicy.Learning();
    private static volatile long learnGeneration;
    private static volatile String learnResult="Tap a button above to assign it.";
    static String roleName(int role){return role==1?"Custom button":role==2?"Zoom in":role==3?"Zoom out":"Gemini";}
    static String describe(WheelKeyPolicy.Binding b){return "key "+b.code+"/"+b.scan+" · "+b.device;}
    /** UI thread. The key service takes the next press; nothing is saved until one arrives. */
    static boolean startLearning(int role){
        if(!enabled()||!connected){learnResult="Turn on the wheel key service in Steering-wheel zoom and wait until it is connected.";return false;}
        learnGeneration=generation.get();learnResult="Tap a button above to assign it.";learning.start(role,SystemClock.uptimeMillis());return true;
    }
    static void cancelLearning(){learning.cancel();}
    static String learningStatus(){
        long left=learning.remaining(SystemClock.uptimeMillis());int role=learning.role(SystemClock.uptimeMillis());
        return role!=0?"Press the steering-wheel button for "+roleName(role)+" now ("+((left+999)/1000)+" s)…":learnResult;
    }
    /** Key callback: only queues the save. Preference I/O stays on the worker; a newer setup drops it. */
    static void learned(int role,WheelKeyPolicy.Binding binding){
        final long epoch=learnGeneration;
        worker.execute(()->{
            if(generation.get()!=epoch||!enabled()){learnResult="Steering-wheel zoom changed; the button was not saved.";return;}
            WheelZoomSettings before=settings;
            // Zoom and Gemini never share a key: the service would give it to Gemini first.
            int zoomUser=WheelKeyPolicy.zoomRole(before.bindings,binding);
            if(role==4&&zoomUser!=0){learnResult="That button is the "+roleName(zoomUser)+" button. Choose another one, or assign a different zoom button first.";return;}
            if(role!=4&&before.gemini.same(binding)){learnResult="That button opens Gemini. Choose another one, or assign a different Gemini button first.";return;}
            try{WheelZoomSettings next=role==4?new WheelZoomSettings(before.enabled,before.bindings,binding):new WheelZoomSettings(before.enabled,WheelKeyPolicy.assign(before.bindings,role,binding),before.gemini);
                next.save(context);settings=next;learnResult=roleName(role)+" saved: "+describe(binding)+".";}
            catch(IOException|IllegalArgumentException failure){learnResult="Could not save the "+roleName(role)+" button; the previous buttons are kept.";}
        });
    }
    /** Restores the measured BYD Tang (DiLink 5.0) zoom buttons, or the Gemini long-press microphone. */
    static void restoreTangButtons(){restoreTang(false);}
    static void restoreTangGemini(){restoreTang(true);}
    private static void restoreTang(boolean gemini){
        learning.cancel();final long epoch=generation.get();
        worker.execute(()->{
            if(generation.get()!=epoch)return;
            WheelZoomSettings before=settings;
            WheelKeyPolicy.Bindings zoom=gemini?before.bindings:WheelKeyPolicy.Bindings.tang();
            WheelKeyPolicy.Binding voice=gemini||WheelKeyPolicy.zoomRole(zoom,before.gemini)!=0?WheelKeyPolicy.Bindings.tangGemini():before.gemini;
            if(WheelKeyPolicy.zoomRole(zoom,voice)!=0){learnResult="A zoom button uses the Tang microphone key; assign a different zoom button first.";return;}
            try{WheelZoomSettings next=new WheelZoomSettings(before.enabled,zoom,voice);next.save(context);settings=next;learnResult=gemini?"Tang Gemini button restored.":"BYD Tang buttons restored.";}
            catch(IOException failure){learnResult="Could not restore the buttons; the previous buttons are kept.";}
        });
    }
    static void serviceConnected(boolean value){
        connected=value;
        if(value)state=enabled()?"Connected. Press the custom key to toggle cluster zoom controls.":"Steering-wheel zoom is off; keys pass through.";
        else if(enabled())state="Waiting for the wheel key service.";
    }

    /** allowKey=true is reserved for the explicit Enable ADB button, never a background retry. */
    public static void configure(Activity activity,boolean on,boolean allowKey,Runnable finished){
        if(activity==null){if(finished!=null)ui.post(finished);return;}
        init(activity.getApplication());learning.cancel();boolean repair=on&&enabled()&&!connected;long epoch=generation.incrementAndGet();
        WheelZoomSettings desired=settings.enabled(on);settings=desired;loaded=true;
        state=on?"Preparing the wheel key service…":"Steering-wheel zoom is off; removing only its service entry…";
        WheelKeyService.endMode();VehicleLocalAdb old=connection;if(old!=null)old.close();
        if(!on)resetIfOff(epoch);
        worker.execute(()->{
            try{
                if(generation.get()!=epoch)return;
                try{desired.save(context);}catch(IOException failure){throw new SettingsSaveFailure(failure);}
                if(generation.get()!=epoch)return;
                attemptsLeft=5;burstStarted=SystemClock.uptimeMillis();lastAttempt=burstStarted;
                reconcile(epoch,on,on&&allowKey,repair);
            }catch(Exception failure){
                if(generation.get()==epoch){
                    if(failure instanceof SettingsSaveFailure){settings=desired.enabled(false);WheelKeyService.endMode();resetIfOff(epoch);state="Could not save wheel settings; steering-wheel zoom is off.";}
                    else failState(failure,on);
                }
            }finally{if(finished!=null)ui.post(finished);}
        });
    }
    /** Manual cluster controls may keep the map prepared; explicit wheel opt-out restores its camera. */
    private static void resetIfOff(long epoch){ui.post(()->{if(generation.get()==epoch&&!enabled())ClusterZoom.reset();});}
    private static final class SettingsSaveFailure extends IOException {SettingsSaveFailure(IOException cause){super(cause);}}
    private static void attempt(boolean allowKey,boolean force){
        if(!enabled()||connected||context==null||attemptsLeft==0)return;
        long now=SystemClock.uptimeMillis();if(!force&&lastAttempt!=0&&now-lastAttempt<15000)return;lastAttempt=now;
        attemptsLeft--;
        long epoch=generation.get();
        try{reconcile(epoch,true,allowKey,false);}catch(Exception unavailable){if(generation.get()==epoch)failState(unavailable,true);}
    }
    /** Once per process: an opted-in, listed but still unbound service is re-registered with the
     * same own-entry rebind the toggle performs, through the already approved key only. Any explicit
     * configure since start (new epoch), a connection, opt-out or another process skips it. */
    static void autoRebind(long epoch){
        String skip=null;
        if(context==null)skip="no application";
        else if(!context.getPackageName().equals(Application.getProcessName()))skip="not the main Maps process";
        else if(!loaded)skip="settings not loaded";
        else if(!settings.enabled)skip="steering-wheel zoom is off";
        else if(connected)skip="service already connected";
        else if(generation.get()!=epoch)skip="explicit setup ran since start";
        else if(!autoRebindUsed.compareAndSet(false,true))skip="already used in this process";
        if(skip!=null){android.util.Log.i(TAG,"autoRebind skipped: "+skip);return;}
        state="The wheel key service was listed but not connected after start; re-registering it once…";
        String result;
        try{
            reconcile(epoch,true,false,true);
            if(connected)result="connected";
            else{result="re-registered; waiting for Android to connect";if(allowed(epoch,true))state="Re-registered the wheel key service once after start; waiting for Android to connect. Press Enable again if it stays disconnected.";}
        }catch(Exception failure){
            result="failed: "+failure.getMessage();
            if(generation.get()==epoch)failState(failure,true);
        }
        android.util.Log.i(TAG,"autoRebind once after start: "+result);
    }
    private static boolean allowed(long epoch,boolean on){return context!=null&&loaded&&generation.get()==epoch&&settings.enabled==on;}
    private static void check(long epoch,boolean on)throws IOException{if(!allowed(epoch,on))throw new IOException("Wheel opt-in changed");}
    private static String own(){return WheelKeyPolicy.Components.normalize(context.getPackageName()+"/local.maps.cluster.WheelKeyService");}
    private static String user(VehicleLocalAdb adb)throws IOException{
        String value=adb.execute("am get-current-user").trim();
        if(!value.matches("[0-9]{1,6}"))throw new IOException("Android user unavailable");
        return Integer.toString(Integer.parseInt(value));
    }
    private static String get(VehicleLocalAdb adb,String user,String key)throws IOException{
        return adb.execute("settings --user "+user+" get secure "+key).trim();
    }
    private static void put(VehicleLocalAdb adb,String user,String key,String value)throws IOException{
        // Caller only passes a validated component list or the literal 1; no user-supplied shell.
        if(!key.equals("enabled_accessibility_services")&&!key.equals("accessibility_enabled"))throw new IOException("Invalid wheel setting");
        if(value.indexOf('\'')>=0||value.indexOf('\n')>=0||value.indexOf('\r')>=0)throw new IOException("Invalid wheel value");
        String result=adb.execute("settings --user "+user+" put secure "+key+" '"+value+"'; printf '|maps_wheel_rc=%s|' \"$?\"").trim();
        if(!result.equals("|maps_wheel_rc=0|"))throw new IOException("Android rejected wheel settings");
    }
    private static WheelKeyPolicy.Components components(String value)throws IOException{
        try{return WheelKeyPolicy.Components.parse(value);}catch(IllegalArgumentException invalid){throw new IOException("Accessibility service list cannot be safely edited",invalid);}
    }
    private static void editEntry(VehicleLocalAdb adb,String targetUser,String component,boolean wantEntry,long epoch,boolean on)throws IOException{
        for(int retry=0;retry<3;retry++){
            if(on&&!wantEntry&&connected)return; // It bound while an explicit repair was queued.
            check(epoch,on);String before=get(adb,targetUser,"enabled_accessibility_services");
            WheelKeyPolicy.Components baseline=components(before);
            String desired;
            try{desired=baseline.withOwn(component,wantEntry);}catch(IllegalArgumentException invalid){throw new IOException("Accessibility service list cannot be safely edited",invalid);}
            if(!before.equals(get(adb,targetUser,"enabled_accessibility_services")))continue;
            if(!targetUser.equals(user(adb)))throw new IOException("Android user changed; retry setup");
            check(epoch,on);
            if(on&&!wantEntry&&connected)return; // Recheck immediately before any own-entry removal.
            if(baseline.count(component)!=(wantEntry?1:0))put(adb,targetUser,"enabled_accessibility_services",desired);
            check(epoch,on);WheelKeyPolicy.Components after=components(get(adb,targetUser,"enabled_accessibility_services"));
            if(!after.preservesOthers(baseline,component)||after.count(component)!=(wantEntry?1:0))throw new IOException("Accessibility service list changed; setup paused");
            return;
        }
        throw new IOException("Accessibility settings are changing; retry setup");
    }
    private static void reconcile(long epoch,boolean on,boolean allowKey,boolean forceRebind)throws IOException{
        check(epoch,on);String component=own();
        try(VehicleLocalAdb adb=VehicleLocalAdb.open(context.getNoBackupFilesDir(),allowKey,()->allowed(epoch,on))){
            connection=adb;check(epoch,on);
            if(!"2000".equals(adb.execute("id -u").trim()))throw new IOException("Local ADB is not Android shell");
            String targetUser=user(adb);
            // Only an explicit Enable/Retry action repairs a listed-but-unbound component.
            if(on&&forceRebind&&!connected){
                editEntry(adb,targetUser,component,false,epoch,true);
                // Give Android's asynchronous settings observer time to see the removal.
                // This bounded grace runs on the setup worker and remains revocable.
                for(int i=0;i<10;i++){
                    check(epoch,true);
                    try{Thread.sleep(100);}catch(InterruptedException interrupted){Thread.currentThread().interrupt();throw new IOException("Wheel setup interrupted",interrupted);}
                }
            }
            editEntry(adb,targetUser,component,on,epoch,on);
            if(on){
                String enabled=get(adb,targetUser,"accessibility_enabled");
                if(!"1".equals(enabled)){if(!"0".equals(enabled)&&!"null".equals(enabled))throw new IOException("Accessibility state unavailable");check(epoch,on);put(adb,targetUser,"accessibility_enabled","1");}
                if(!"1".equals(get(adb,targetUser,"accessibility_enabled")))throw new IOException("Accessibility did not enable");
            }
            if(allowed(epoch,on))state=on?(connected?"Connected. Press the custom key to toggle cluster zoom controls.":"Service listed in Android; waiting for connection. Press Enable again to repair if it stays disconnected."):"Steering-wheel zoom is off. Other accessibility services were kept.";
        }finally{connection=null;}
    }
    private static void failState(Exception error,boolean on){
        if(error instanceof VehicleLocalAdb.ApprovalRequiredException)state=on?"Allow the existing Maps ADB key, then press Enable again. Background retries never request approval.":"Zoom is off. Local ADB approval is needed to remove its Android service entry.";
        else if("Accessibility service list cannot be safely edited".equals(error.getMessage()))state="Accessibility list could not be safely edited. No unrelated service was intentionally changed.";
        else if("Accessibility service list changed; setup paused".equals(error.getMessage())||"Accessibility settings are changing; retry setup".equals(error.getMessage()))state="Android accessibility settings changed during setup. Press Enable again.";
        else if("Android user changed; retry setup".equals(error.getMessage()))state="Android user changed during setup. Try again in the intended profile.";
        else if("Android user unavailable".equals(error.getMessage()))state="Could not identify the active Android user. No service list was edited.";
        else if("Local ADB is not Android shell".equals(error.getMessage()))state="Local ADB is not running as Android shell. No service list was edited.";
        else if("Android rejected wheel settings".equals(error.getMessage()))state="Android rejected the accessibility settings write. Check shell access and retry.";
        else if("Accessibility state unavailable".equals(error.getMessage())||"Accessibility did not enable".equals(error.getMessage()))state="Android accessibility state could not be enabled. Service setup is incomplete.";
        else state=on?"Wheel setup could not finish over local ADB (127.0.0.1:5555). Check ADB and press Enable again.":"Zoom is off; its Android service entry could not be removed. Other services were kept.";
    }
}
