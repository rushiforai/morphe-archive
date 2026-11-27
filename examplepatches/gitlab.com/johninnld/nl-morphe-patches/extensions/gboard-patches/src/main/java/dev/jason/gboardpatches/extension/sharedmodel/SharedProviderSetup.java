package dev.jason.gboardpatches.extension.sharedmodel;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import app.johninnl.modelhost.api.*;
import java.io.*;
import java.util.concurrent.*;
import java.util.function.Consumer;
import org.json.JSONObject;

/** User-initiated setup work; the existing Patches screen renders its progress. */
final class SharedProviderSetup {
    private static final ExecutorService WORKER=Executors.newSingleThreadExecutor(r->new Thread(r,"gboard-provider-setup"));
    private static final Handler MAIN=new Handler(Looper.getMainLooper());
    private static volatile boolean busy;
    private static volatile String message="";
    private static volatile VerifiedApk pending;
    private static volatile long generation;
    private static Future<?> job;
    private static final ExecutorService UPDATES = Executors.newSingleThreadExecutor(r ->
            new Thread(r, "gboard-host-update-check"));
    private static volatile ProviderRelease offeredUpdate;
    private static long nextUpdateCheck;

    static synchronized void checkForUpdates(Context context) {
        if (!ProviderDiscovery.isOfficialProviderSupported()) return;
        long now = android.os.SystemClock.elapsedRealtime();
        if (now < nextUpdateCheck) return;
        nextUpdateCheck = now + TimeUnit.HOURS.toMillis(6);
        Context app = context.getApplicationContext();
        UPDATES.submit(() -> {
            try {
                ProviderRelease discovered = ProviderUpdates.check(app, release(app).versionCode, 4);
                ProviderRelease current = offeredUpdate;
                if (discovered != null && (current == null || discovered.versionCode >= current.versionCode)) {
                    offeredUpdate = discovered;
                } else if (current != null && current.versionCode <= ProviderUpdates.installedVersion(app)) {
                    offeredUpdate = null;
                }
            } catch (HostException unavailable) {
                // Keep any previously verified offer and the bundled installer.
            } catch (Exception invalidBundle) {
                // The setup screen already reports an unavailable bundled installer.
            }
        });
    }

    private static ProviderRelease target(Context context) throws Exception {
        ProviderRelease pinned = release(context);
        ProviderRelease discovered = offeredUpdate;
        return discovered != null && discovered.versionCode > pinned.versionCode ? discovered : pinned;
    }
    static boolean installedMatchesReview(Context context) {
        try {
            VerifiedApk apk = pending;
            return apk != null && ProviderUpdates.installedVersion(context) >= apk.versionCode;
        } catch (Exception unavailable) {
            return false;
        }
    }
    static boolean needsUpdate(Context context) {
        try { return ProviderUpdates.installedVersion(context) < target(context).versionCode; }
        catch (Exception unavailable) { return false; }
    }
    static boolean needsBundledUpdate(Context context) {
        try { return ProviderUpdates.installedVersion(context) < release(context).versionCode; }
        catch (Exception unavailable) { return false; }
    }
    static String platformMessage(){return "Local AI requires Android 11 or later and a 64-bit ARM device.";}
    static boolean busy(){return busy;}
    static String message(){return message;}
    static VerifiedApk pending(){return pending;}
    static void finished(String status){pending=null;busy=false;message=status;}
    static ProviderRelease release(Context context)throws Exception{
        try(InputStream input=context.getAssets().open("morphe/model-host-release.json")){
            ByteArrayOutputStream data=new ByteArrayOutputStream();byte[] buffer=new byte[2048];int count;
            while((count=input.read(buffer))!=-1){if(data.size()+count>8192)throw new IOException("Release identity too large");data.write(buffer,0,count);}
            return new ProviderRelease(new JSONObject(data.toString("UTF-8")));
        }
    }
    private static VerifiedApk verify(Context context,Uri uri,ProviderRelease release)throws Exception{
        VerifiedApk result=VerifiedApk.verify(context,uri,release.packageName,release.apkSha256,release.signerSha256);
        if(result.versionCode!=release.versionCode)throw new IOException("Version mismatch");return result;
    }
    static synchronized void cancel(){generation++;if(job!=null)job.cancel(true);busy=false;message="Download cancelled.";}
    static synchronized void download(Context context){
        if(!ProviderDiscovery.isOfficialProviderSupported()){message=platformMessage();return;}
        if(busy)return;
        if(pending!=null){SharedModelSetupActivity.install(context);return;}
        Context app=context.getApplicationContext();java.lang.ref.WeakReference<Context> source=new java.lang.ref.WeakReference<>(context);long current=++generation;busy=true;message="Downloading companion app…";
        job=WORKER.submit(()->{
            File copy=null;
            try{
                ProviderRelease release = target(app);
                ProviderRelease.Progress progress = (done,total) -> {
                    if (generation == current) message = "Downloading companion app"
                            + (total > 0 ? " · " + done * 100 / total + "%" : "…");
                };
                VerifiedApk verified;
                if (release.versionCode > release(app).versionCode) {
                    verified = ProviderUpdates.download(app, release, progress);
                } else {
                    copy = File.createTempFile("local-ai-download-", ".apk", app.getCacheDir());
                    release.downloadTo(copy, progress);
                    if (generation != current) return;
                    message = "Checking the companion app…";
                    verified = verify(app, Uri.fromFile(copy), release);
                }
                MAIN.post(()->{if(generation!=current)return;pending=verified;busy=false;message="Ready to install.";Context origin=source.get();if(origin instanceof android.app.Activity && ((android.app.Activity)origin).hasWindowFocus()){try{SharedModelSetupActivity.install(origin);}catch(RuntimeException unavailable){message="Ready to install. Tap Install companion app to continue.";}}});
            }catch(Exception failure){if(generation==current){busy=false;message="Could not download the companion app. Check your connection and try again.";}}
            finally{if(copy!=null)copy.delete();}
        });
    }
    static synchronized void verifySelected(Context context,Uri uri,Consumer<Boolean> result){
        if(!ProviderDiscovery.isOfficialProviderSupported()){message=platformMessage();MAIN.post(()->result.accept(false));return;}
        if(busy){result.accept(false);return;}
        Context app=context.getApplicationContext();long current=++generation;busy=true;message="Checking the selected app…";
        job=WORKER.submit(()->{
            try{VerifiedApk verified=verify(app,uri,release(app));MAIN.post(()->{if(generation!=current)return;pending=verified;busy=false;message="Ready to install.";result.accept(true);});}
            catch(Exception failure){MAIN.post(()->{if(generation!=current)return;busy=false;message="That APK does not match the verified companion app.";result.accept(false);});}
        });
    }
}
