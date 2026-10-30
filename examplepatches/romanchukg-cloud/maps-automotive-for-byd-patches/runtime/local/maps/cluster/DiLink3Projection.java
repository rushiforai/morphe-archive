// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.app.Application;
import android.content.SharedPreferences;
import android.graphics.Point;
import android.hardware.display.DisplayManager;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.AtomicFile;
import android.view.Display;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLong;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Explicit DiLink 3 map-only experiment. No SDK-only activation, guidance writes or general shell. */
public final class DiLink3Projection {
    public static final String DISPLAY_NAME="fission_bg_xdjaVirtualSurface";
    private static final String PREFS="local_dilink3_projection",OWN="com.google.android.apps.maps.automotive";
    private static final String JOURNAL="maps-dilink3-projection-recovery";
    private static final Handler ui=new Handler(Looper.getMainLooper());
    private static final ScheduledExecutorService worker=Executors.newSingleThreadScheduledExecutor(r->{Thread t=new Thread(r,"MapsDiLink3Projection");t.setDaemon(true);return t;});
    private static final AtomicLong generation=new AtomicLong(),settingsGeneration=new AtomicLong();
    private static final Object resumeLock=new Object();
    private static final AtomicBoolean queued=new AtomicBoolean();
    private static volatile Application context;
    private static volatile Runnable changed;
    private static volatile boolean loaded,optedIn,saving,wanted,ready,visible,pending,paused;
    private static volatile boolean quarantined,quarantineDurable;
    private static volatile String state="DiLink 3 projection is loading.";
    private static volatile VehicleLocalAdb activeConnection;
    private static volatile long nextAttempt;
    private static volatile int attempts=3;
    private static long projectionGeneration=-1;
    private static final String TAG="MapsDiLink3";
    /** 54D automatic resume after a car power cycle (BYD quickboot force-stops Maps mid-projection).
     * Durable auto_resume_ok is true only after a projection window ran HEALTHY_MS without a failure;
     * every new attempt, window failure and explicit pause durably clears it first. A start may then
     * resume once on its own after stock restoration; any unconfirmed attempt falls back to Retry. */
    static final long HEALTHY_MS=30000;
    static long healthyMs=HEALTHY_MS; // host tests shorten it
    private static volatile boolean autoResumeOk,failedThisProcess,autoResumeReported;
    private static final AtomicBoolean autoResumeUsed=new AtomicBoolean();
    private DiLink3Projection(){}

    /** UI eligibility only. Runtime service/adapter/display checks are required before every write. */
    public static boolean isCandidate(){return Build.VERSION.SDK_INT==29;}
    public static boolean loaded(){return isCandidate()&&loaded;}
    public static boolean enabled(){return isCandidate()&&loaded&&!saving&&optedIn;}
    public static boolean ready(){return enabled()&&wanted&&!paused&&!quarantined&&ready;}
    public static boolean recoveryPending(){return isCandidate()&&pending&&!ready();}
    public static String status(){return isCandidate()?state:"DiLink 3 projection is unavailable on this Android version.";}
    public static void init(Application application,Runnable onChanged){
        if(application==null||!isCandidate())return;
        synchronized(DiLink3Projection.class){
            if(onChanged!=null)changed=onChanged;
            if(context!=null)return;
            context=application;
            worker.execute(()->{
                boolean saved=false,resume=false,unknown=false,autoOk=false;
                try{saved=preferences().getBoolean("enabled",false);resume=preferences().getBoolean("resume_required",false);autoOk=preferences().getBoolean("auto_resume_ok",false);}
                catch(RuntimeException unavailable){resume=true;unknown=true;autoOk=false;}
                autoResumeOk=autoOk;
                pending=readJournal();quarantined=pending||resume;quarantineDurable=resume&&!unknown;optedIn=saved;loaded=true;
                state=quarantined?resumeStatus():saved?"DiLink 3 projection is enabled; waiting for the map request.":"DiLink 3 projection is off.";
                notifyChanged();requestWork(true);
            });
            worker.scheduleWithFixedDelay(()->{
                if(loaded&&attempts>0&&SystemClock.uptimeMillis()>=nextAttempt&&(pending&&!ready()||enabled()&&wanted&&!paused&&!quarantined&&!ready()))requestWork(false);
            },30,30,TimeUnit.SECONDS);
        }
    }
    private static SharedPreferences preferences(){return context.getSharedPreferences(PREFS,0);}
    private static void notifyChanged(){ui.post(()->{Runnable callback=changed;if(callback!=null)callback.run();});}
    private static void cancelledConnection(){VehicleLocalAdb connection=activeConnection;if(connection!=null)connection.close();}
    private static void invalidateState(){generation.incrementAndGet();ready=false;visible=false;}
    private static void invalidate(){synchronized(resumeLock){invalidateState();}cancelledConnection();}

    /** Called only after the settings page's explicit DiLink 3 consent. Never tied to reader/wheel opt-in. */
    public static void configure(Activity activity,boolean on,boolean allowKey,Runnable done){
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||!isCandidate()){finish(done);return;}
        init(activity.getApplication(),null);if(!loaded){finish(done);return;}
        final long saveEpoch=settingsGeneration.incrementAndGet();optedIn=on;saving=true;paused=false;invalidate();final long projectionEpoch=generation.get();attempts=3;nextAttempt=0;
        state=on?"Saving the explicit DiLink 3 projection opt-in…":"Turning projection off and restoring any owned stock mode…";notifyChanged();
        worker.execute(()->{
            try{
                if(settingsGeneration.get()!=saveEpoch)return;
                boolean saved;
                try{saved=preferences().edit().putBoolean("enabled",on).commit();}catch(RuntimeException unavailable){saved=false;}
                if(settingsGeneration.get()!=saveEpoch)return;
                saving=false;
                if(!saved){optedIn=false;state="The opt-in was not saved. Projection is off for this session; retry saving.";}
                runLatest(projectionEpoch,on&&allowKey&&saved,true,on&&saved);
            }finally{finish(done);}
        });
    }
    public static void retry(Activity activity,boolean allowKey,Runnable done){
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||!isCandidate()||!loaded){finish(done);return;}
        paused=false;invalidate();attempts=3;nextAttempt=0;final long epoch=generation.get();
        worker.execute(()->{try{runLatest(epoch,allowKey,true,true);}finally{finish(done);}});
    }
    /** Restore only a journal-owned mode. The opt-in is retained, but output stays paused until Retry. */
    public static void restore(Activity activity,Runnable done){
        if(activity==null||activity.isFinishing()||activity.isDestroyed()||!isCandidate()||!loaded){finish(done);return;}
        paused=true;invalidate();attempts=3;nextAttempt=0;final long epoch=generation.get();
        // An explicit pause must not come back on its own after the next car start.
        worker.execute(()->{try{saveAutoOk(false);runLatest(epoch,false,true);}finally{finish(done);}});
    }
    private static void finish(Runnable done){if(done!=null)ui.post(done);}

    /** Main/host-safe: cached desired state and serial worker enqueue only. */
    public static void reconcile(boolean mapWanted){
        if(!isCandidate()||context==null)return;
        if(wanted==mapWanted)return;
        wanted=mapWanted;paused=false;invalidate();attempts=3;nextAttempt=0;requestWork(true);
    }
    /** Android window creation confirmation only; this never claims driver-visible pixels. */
    public static void windowVisible(boolean shown){
        if(!isCandidate()||!loaded)return;
        if(shown){if(ready()){boolean first=!visible;visible=true;state="Projection commands and Android map window are ready. Confirm the physical cluster.";if(first)confirmHealthyLater();}return;}
        if(!ready&&!visible)return;
        windowFailed();
    }
    /** Strong failure signal for this backend's owned, possibly only partially created window. */
    public static void windowFailed(){
        if(!isCandidate()||context==null)return;
        synchronized(resumeLock){quarantined=true;quarantineDurable=false;paused=wanted;failedThisProcess=true;invalidateState();}
        cancelledConnection();state=resumeStatus();attempts=3;nextAttempt=0;requestWork(true);
    }
    /** The window stayed up HEALTHY_MS in the same projection generation: allow one automatic resume next start. */
    private static void confirmHealthyLater(){
        final long epoch=generation.get(),owned=projectionGeneration;
        worker.schedule(()->{
            if(!ready()||!visible||failedThisProcess||generation.get()!=epoch||projectionGeneration!=owned)return;
            if(saveAutoOk(true))android.util.Log.i(TAG,"projection healthy for "+healthyMs+" ms; automatic resume allowed after the next car start");
        },healthyMs,TimeUnit.MILLISECONDS);
    }
    /** Worker-only durable auto-resume evidence; the in-memory copy follows only confirmed writes. */
    private static boolean saveAutoOk(boolean value){
        boolean saved;
        try{saved=preferences().edit().putBoolean("auto_resume_ok",value).commit();}catch(RuntimeException unavailable){saved=false;}
        if(saved||!value)autoResumeOk=saved?value:autoResumeOk&&value;
        return saved;
    }
    private static boolean autoResumeEligible(long epoch){
        return autoResumeOk&&!failedThisProcess&&quarantined&&!pending&&!autoResumeUsed.get()&&projectionAllowedAfterResume(epoch);
    }
    private static boolean projectionAllowedAfterResume(long epoch){return allowed(epoch)&&optedIn&&wanted&&!paused;}
    private static String resumeStatus(){return pending?"The previous projection session needs stock restoration. New projection is paused. After restoration, press Authorize or retry to resume. You can use Maps without cluster projection.":"Cluster projection requires manual resume after a previous session. Projection is paused; press Authorize or retry to resume. You can use Maps without cluster projection.";}
    /** Worker-only durable latch. Keep the ownership journal pending if this checkpoint fails. */
    private static boolean saveQuarantine(boolean value){
        try{return preferences().edit().putBoolean("resume_required",value).commit();}
        catch(RuntimeException unavailable){return false;}
    }
    public static boolean matches(Display display){
        try{
            if(display==null||display.getDisplayId()==Display.DEFAULT_DISPLAY||!display.isValid()||!DISPLAY_NAME.equals(display.getName())||(display.getFlags()&Display.FLAG_PRIVATE)!=0||(display.getFlags()&Display.FLAG_PRESENTATION)==0)return false;
            Point size=new Point();display.getRealSize(size);return size.x==1920&&size.y==720||size.x==1280&&size.y==480;
        }catch(RuntimeException unavailable){return false;}
    }
    private static boolean displayPresent()throws IOException{
        DisplayManager manager=context.getSystemService(DisplayManager.class);if(manager==null)return false;
        int matches=0;for(Display display:manager.getDisplays())if(matches(display)&&++matches>1)throw new Failure("display_ambiguous");return matches==1;
    }
    private static boolean allowed(long epoch){return context!=null&&isCandidate()&&loaded&&generation.get()==epoch&&!saving;}
    private static boolean projectionWanted(long epoch){return allowed(epoch)&&optedIn&&wanted&&!paused&&!quarantined;}
    private static void check(long epoch)throws IOException{if(!projectionWanted(epoch))throw new Failure("cancelled");}
    private static void requestWork(boolean force){
        if(context==null||!loaded||!isCandidate()||!force&&(attempts<=0||SystemClock.uptimeMillis()<nextAttempt))return;
        if(!queued.compareAndSet(false,true))return;
        worker.execute(()->{
            long epoch=generation.get();
            try{runLatest(epoch,false,force);}finally{
                queued.set(false);
                if(generation.get()!=epoch&&(pending||enabled()&&wanted))requestWork(true);
            }
        });
    }
    private static void runLatest(long epoch,boolean allowKey,boolean force){
        runLatest(epoch,allowKey,force,false);
    }
    private static void runLatest(long epoch,boolean allowKey,boolean force,boolean manualResume){
        if(!allowed(epoch)||!force&&(attempts<=0||SystemClock.uptimeMillis()<nextAttempt))return;
        if(ready&&projectionGeneration==epoch&&projectionWanted(epoch))return;
        if(pending||projectionWanted(epoch)){attempts=Math.max(0,attempts-1);nextAttempt=SystemClock.uptimeMillis()+30000;}
        boolean cleanupFailed=false;
        try{
            if(quarantined&&!quarantineDurable){quarantineDurable=saveQuarantine(true);if(failedThisProcess)saveAutoOk(false);}
            if(pending&&!restorePending(allowKey,epoch))throw new Failure("restore");
            // Only this explicit ON/Retry may clear the restart latch, after owned cleanup.
            if(manualResume&&quarantined&&allowed(epoch)&&optedIn&&wanted&&!paused){
                // Reserve the new attempt before clearing the durable pause. Death/cancellation
                // between this point and the first16 must still be recoverable on next startup.
                saveJournal(true);
                if(!allowed(epoch))return;
                saveAutoOk(false);
                if(!saveQuarantine(false)){quarantineDurable=saveQuarantine(true);throw new Failure("resume");}
                boolean current;
                synchronized(resumeLock){current=allowed(epoch);if(current){quarantined=false;quarantineDurable=false;}}
                if(!current){quarantineDurable=saveQuarantine(true);return;}
            }else if(!manualResume&&quarantined&&projectionAllowedAfterResume(epoch)){
                if(autoResumeEligible(epoch)&&autoResumeUsed.compareAndSet(false,true)){
                    // Same durable order as an explicit resume. The attempt is recorded unconfirmed
                    // before the pause is cleared, so a crash before HEALTHY_MS falls back to Retry.
                    saveJournal(true);
                    if(!allowed(epoch))return;
                    if(!saveAutoOk(false)){android.util.Log.i(TAG,"autoResume skipped: attempt could not be recorded");throw new Failure("resume");}
                    if(!saveQuarantine(false)){quarantineDurable=saveQuarantine(true);throw new Failure("resume");}
                    boolean current;
                    synchronized(resumeLock){current=allowed(epoch)&&!failedThisProcess;if(current){quarantined=false;quarantineDurable=false;}}
                    if(!current){quarantineDurable=saveQuarantine(true);return;}
                    android.util.Log.i(TAG,"autoResume once after the previous session: resuming projection");
                }else if(!autoResumeReported){
                    autoResumeReported=true;
                    android.util.Log.i(TAG,"autoResume skipped: "+(autoResumeUsed.get()?"already used in this process":failedThisProcess?"projection failed in this process":!autoResumeOk?"previous attempt was not confirmed healthy":"stock restoration pending"));
                }
            }
            if(!quarantined&&projectionWanted(epoch)&&!ready)saveAutoOk(false); // any new projection attempt is unconfirmed until healthy
            if(!projectionWanted(epoch)){
                if(allowed(epoch))state=quarantined?resumeStatus():paused?"Stock mode is restored. Press Retry to project again.":"DiLink 3 projection is off; the stock view is restored.";
                notifyChanged();return;
            }
            try(VehicleLocalAdb adb=VehicleLocalAdb.open(context.getNoBackupFilesDir(),allowKey,()->projectionWanted(epoch))){
                activeConnection=adb;String user=preflight(adb);check(epoch);
                if(!displayPresent()){
                    state="Creating the missing DiLink 3 projection display…";notifyChanged();
                    saveJournal(true);check(epoch);send(adb,16,user);grace(epoch,30);send(adb,35,user);grace(epoch,30);
                    // Creation always hands the temporary projection back before a new 16→17 entry.
                    if(!restorePending(false,epoch))throw new Failure("restore");
                    check(epoch);if(!displayPresent())throw new Failure("display");
                }
                check(epoch);state="Entering DiLink 3 projection…";notifyChanged();
                saveJournal(true);check(epoch);send(adb,16,user);grace(epoch,10);send(adb,17,user);check(epoch);
                if(!displayPresent())throw new Failure("display");
                projectionGeneration=epoch;ready=true;visible=false;
                state="Projection commands were accepted; waiting for the Android map window. Physical visibility is unconfirmed.";notifyChanged();
            }finally{activeConnection=null;}
        }catch(Exception failure){
            ready=false;visible=false;
            // A cancelled user request must still restore its owned mode through a fresh bounded connection.
            if(pending)try{cleanupFailed=!restorePending(false,epoch);}catch(Exception unavailable){cleanupFailed=true;}
            if(generation.get()==epoch){
                nextAttempt=SystemClock.uptimeMillis()+30000;
                if(cleanupFailed||pending)state="Stock restoration is pending. New projection is blocked; check ADB and press Retry.";
                else if(failure instanceof VehicleLocalAdb.ApprovalRequiredException)state="Approve the Maps ADB key, then press Retry. Background work never offers a key.";
                else if(failure instanceof Failure)state=failureStatus(((Failure)failure).code);
                else state="DiLink 3 projection could not finish. Check local ADB and press Retry; no general shell output was retained.";
                notifyChanged();
            }
        }
    }
    private static String currentUser(VehicleLocalAdb adb)throws IOException{
        String value=adb.execute("am get-current-user").trim();if(!value.matches("[0-9]{1,6}"))throw new Failure("user");return Integer.toString(Integer.parseInt(value));
    }
    private static String preflight(VehicleLocalAdb adb)throws IOException{
        if(!isCandidate()||!OWN.equals(context.getPackageName()))throw new Failure("identity");
        if(!"2000".equals(adb.execute("id -u").trim()))throw new Failure("shell");
        int uid=Process.myUid();String user=currentUser(adb);if(uid<0||!Integer.toString(uid/100000).equals(user))throw new Failure("user");
        if(!"29".equals(adb.execute("getprop ro.build.version.sdk").trim()))throw new Failure("sdk");
        String build=adb.execute("getprop ro.build.display.id"),product=adb.execute("getprop ro.product.name");
        if(!diLink3Name(build)&&!diLink3Name(product))throw new Failure("build");
        if(!"Service AutoContainer: found".equals(adb.execute("service check AutoContainer").trim()))throw new Failure("service");
        String paths=adb.execute("pm path --user "+user+" com.example.amapservice").trim();
        if(paths.isEmpty()||paths.length()>4096)throw new Failure("adapter");
        String[] lines=paths.split("\\r?\\n",-1);if(lines.length>16)throw new Failure("adapter");
        for(String line:lines)if(!line.matches("package:/[A-Za-z0-9_./=+~%-]+\\.apk"))throw new Failure("adapter");
        if(!user.equals(currentUser(adb)))throw new Failure("user");return user;
    }
    /** Positive system-name evidence, not a generic Android 10/version-number guess. Never logged. */
    static boolean diLink3Name(String input){
        if(input==null||input.length()>256)return false;String value=input.trim();
        for(int i=0;i<value.length();i++)if(Character.isISOControl(value.charAt(i)))return false;
        return Pattern.compile("(?i)(?<![a-z0-9])DiLink3(?:\\.0)?(?![a-z0-9.])").matcher(value).find();
    }
    private static void send(VehicleLocalAdb adb,int command,String user)throws IOException{
        if(command!=16&&command!=17&&command!=18&&command!=35)throw new Failure("command");
        if(!user.equals(currentUser(adb)))throw new Failure("user");
        if(!accepted(adb.execute("service call AutoContainer 2 i32 1000 i32 "+command+" s16 ''")))throw new Failure("parcel");
    }
    static boolean accepted(String output){
        if(output==null||output.length()>4096)return false;
        Matcher match=Pattern.compile("(?s)^(?:Result:\\s*)?Parcel\\(\\s*(?:0x[0-9a-fA-F]{8}:\\s*)?([0-9a-fA-F]{8})(?:\\s.*)?\\)\\s*$").matcher(output.trim());
        return match.matches()&&"00000000".equals(match.group(1));
    }
    private static void grace(long epoch,int steps)throws IOException{
        for(int i=0;i<steps;i++){check(epoch);try{Thread.sleep(100);}catch(InterruptedException interrupted){Thread.currentThread().interrupt();throw new Failure("cancelled");}}check(epoch);
    }
    private static AtomicFile journal(){return new AtomicFile(new File(context.getNoBackupFilesDir(),JOURNAL));}
    private static boolean readJournal(){return !Boolean.FALSE.equals(journalValue());}
    /** Null is an unreadable/invalid marker, never proof of a completed pending reservation. */
    private static Boolean journalValue(){
        AtomicFile file=journal();
        try(FileInputStream input=file.openRead()){
            ByteArrayOutputStream bytes=new ByteArrayOutputStream();byte[] buffer=new byte[32];int count;
            while((count=input.read(buffer))!=-1){if(bytes.size()+count>32)return null;bytes.write(buffer,0,count);}
            String value=new String(bytes.toByteArray(),StandardCharsets.US_ASCII);
            return "pending\n".equals(value)?Boolean.TRUE:"clean\n".equals(value)?Boolean.FALSE:null;
        }catch(FileNotFoundException missing){
            File base=file.getBaseFile();return base.exists()||new File(base.getPath()+".bak").exists()||new File(base.getPath()+".new").exists()?null:Boolean.FALSE;
        }
        catch(IOException|RuntimeException unreadable){return null;}
    }
    private static void saveJournal(boolean next)throws IOException{
        AtomicFile file=journal();FileOutputStream output=null;boolean previousPending=pending;
        try{
            output=file.startWrite();output.write((next?"pending\n":"clean\n").getBytes(StandardCharsets.US_ASCII));output.flush();output.getFD().sync();file.finishWrite(output);output=null;
            Boolean confirmed=journalValue();if(confirmed==null||confirmed.booleanValue()!=next)throw new Failure("journal");pending=next;
        }catch(IOException|RuntimeException failure){
            try{if(output!=null)file.failWrite(output);}catch(RuntimeException ignored){}
            pending=previousPending||Boolean.TRUE.equals(journalValue());throw new Failure("journal");
        }
    }
    private static boolean restorePending(boolean allowKey,long epoch)throws IOException{
        if(!pending)return true;
        ready=false;visible=false;
        // Existing-key cleanup is independent of cancelled map/config generations. A public-key offer
        // remains generation-bound and is possible only in an explicit ON/Retry operation.
        try(VehicleLocalAdb adb=VehicleLocalAdb.open(context.getNoBackupFilesDir(),allowKey,()->context!=null&&isCandidate()&&(!allowKey||generation.get()==epoch))){
            String user=preflight(adb);send(adb,18,user);
            // A window failure can arrive while this owned cleanup is clearing its journal.
            // Fence every clean transition durably, not only an already observed failure.
            if(!saveQuarantine(true))throw new Failure("resume");
            quarantineDurable=true;
            saveJournal(false);projectionGeneration=-1;return true;
        }
    }
    private static final class Failure extends IOException {final String code;Failure(String code){this.code=code;}}
    private static String failureStatus(String code){
        if("identity".equals(code)||"sdk".equals(code))return "The Android/package identity does not match this DiLink 3 experiment. Projection is blocked.";
        if("build".equals(code))return "The system build was not identified as DiLink 3. Send a firmware settings screenshot; projection and stock-mode writes are blocked.";
        if("shell".equals(code))return "Local ADB is not Android shell. Projection is blocked.";
        if("user".equals(code))return "The current Android user changed or could not be verified. Retry in the Maps user profile.";
        if("service".equals(code)||"adapter".equals(code))return "The required AutoContainer and DiLink 3 map adapter were not verified. Android 10 alone is insufficient.";
        if("journal".equals(code))return "Recovery ownership could not be saved reliably. No new projection is permitted; retry setup.";
        if("resume".equals(code))return "The projection safety pause could not be saved. New output remains blocked; press Authorize or retry.";
        if("display".equals(code))return "The exact public DiLink 3 projection display is unavailable. Stock restoration was attempted; press Retry.";
        if("display_ambiguous".equals(code))return "More than one matching DiLink 3 projection display is present. New projection is blocked; press Retry after checking the display setup.";
        if("parcel".equals(code))return "AutoContainer did not return an accepted Binder reply. Stock restoration was attempted; press Retry.";
        if("cancelled".equals(code))return "The projection request changed; its owned mode was handed back to the car.";
        return "DiLink 3 projection is waiting for verified stock restoration. Press Retry after checking ADB.";
    }
}
