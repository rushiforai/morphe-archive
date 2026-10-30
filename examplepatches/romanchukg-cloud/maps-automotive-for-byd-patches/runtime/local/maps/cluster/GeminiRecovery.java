// SPDX-License-Identifier: GPL-3.0-only
package local.maps.cluster;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import java.io.IOException;
import java.security.MessageDigest;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.atomic.AtomicLong;
import java.util.function.BooleanSupplier;

/** Opt-in repair on a voice-button gesture, using this app's existing localhost ADB key. */
final class GeminiRecovery {
    static final String KEY="gemini_restore_assistant";
    private static final Object io=new Object();
    private static final AtomicLong generation=new AtomicLong();
    private static final ExecutorService setup=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"MapsGeminiRecovery");t.setDaemon(true);return t;});
    private static final Handler ui=new Handler(Looper.getMainLooper());
    private static volatile boolean enabled;
    private static volatile String status="Automatic recovery is off.";
    private static volatile VehicleLocalAdb active;
    private static volatile SharedPreferences prefs;
    private static long lastAttempt;
    static void init(Context c){
        if(prefs!=null)return;
        synchronized(io){if(prefs==null){prefs=c.getSharedPreferences("local_cluster_settings",Context.MODE_PRIVATE);enabled=prefs.getBoolean(KEY,false);status=enabled?"Ready. A voice-button tap can restore Google after a BYD reset.":"Automatic recovery is off.";}}
    }
    static boolean enabled(){return enabled;}
    static String status(){return status;}
    static void configure(Activity a,boolean on,Runnable finished){
        init(a);long epoch=generation.incrementAndGet();enabled=on;
        VehicleLocalAdb previous=active;if(previous!=null)previous.close();
        status=on?"Checking local ADB and Google assistant…":"Automatic recovery is off.";
        Context c=a.getApplicationContext();
        setup.execute(()->{
            try{
                if(epoch!=generation.get())return;
                if(!prefs.edit().putBoolean(KEY,on).commit())throw new IOException("save_failed");
                if(on)recover(c,true,()->epoch==generation.get());
            }catch(Exception e){if(epoch==generation.get()){enabled=false;status="Could not save automatic recovery. Turn it off and retry.";}}
            finally{if(finished!=null)ui.post(finished);}
        });
    }
    @SuppressWarnings("deprecation")
    private static boolean trusted(Context c){
        try{
            PackageManager pm=c.getPackageManager();
            if(pm.checkSignatures(c.getPackageName(),GeminiLaunch.GOOGLE)==PackageManager.SIGNATURE_MATCH)return true;
            android.content.pm.Signature[] signatures=pm.getPackageInfo(GeminiLaunch.GOOGLE,PackageManager.GET_SIGNATURES).signatures;
            if(signatures==null||signatures.length!=1)return false;
            byte[] digest=MessageDigest.getInstance("SHA-256").digest(signatures[0].toByteArray());
            StringBuilder hex=new StringBuilder();for(byte b:digest)hex.append(String.format(java.util.Locale.US,"%02x",b&255));
            return BuildInfo.SIGNER.equals(hex.toString());
        }catch(Exception e){return false;}
    }
    /** Called off UI only. No ADB retry or approval unless this is the explicit Enable action. */
    static boolean recover(Context c,boolean authorize,BooleanSupplier callerActive){
        // A voice tap also repairs a binding stuck in STARTING; the explicit Enable check keeps 54N behaviour.
        return recover(c,authorize,callerActive,!authorize,false);
    }
    /** After a shown session without a Gemini window. True only when Google was re-registered and is
     * now bound; a binding that was already ready means Gemini is just slow, so nothing is retried. */
    static boolean recoverStalled(Context c,BooleanSupplier callerActive){return recover(c,false,callerActive,true,true);}
    private static boolean recover(Context c,boolean authorize,BooleanSupplier callerActive,boolean stalled,boolean onlyRestored){
        init(c);
        if(!enabled||!callerActive.getAsBoolean())return false;
        synchronized(io){
            long epoch=generation.get(),start=SystemClock.uptimeMillis();
            if(!enabled||!callerActive.getAsBoolean())return false;
            if(!authorize&&lastAttempt!=0&&start-lastAttempt<10000){status="Recovery is waiting briefly before another attempt.";return false;}
            lastAttempt=start;
            if(!trusted(c)){status="Recovery needs a trusted patched Google app signed with the same key as Maps or the project key.";return false;}
            BooleanSupplier allowed=()->enabled&&epoch==generation.get()&&callerActive.getAsBoolean()&&SystemClock.uptimeMillis()-start<8000;
            try(VehicleLocalAdb adb=VehicleLocalAdb.open(c.getNoBackupFilesDir(),authorize,allowed)){
                active=adb;
                GeminiRecoveryPolicy.Result result=GeminiRecoveryPolicy.repair(adb::execute,allowed,stalled);
                if(result==GeminiRecoveryPolicy.Result.OTHER_ASSISTANT){status="Another assistant is selected. Automatic recovery leaves it unchanged.";return false;}
                // Selection is not readiness: a stopped GSA can leave mBound=false indefinitely.
                String user=adb.execute("am get-current-user").trim();
                boolean bound=false;
                for(int i=0;i<10&&allowed.getAsBoolean();i++){
                    bound=GeminiRecoveryPolicy.binding(adb.execute("dumpsys voiceinteraction"),user)==GeminiRecoveryPolicy.Binding.BOUND;
                    if(bound)break;
                    Thread.sleep(150);
                }
                if(!allowed.getAsBoolean())throw new IOException("cancelled");
                boolean selected=GeminiLaunch.googleAssistant(c),ready=selected&&bound;
                status=ready?"Google assistant is ready. Recovery uses local ADB; no computer is needed.":"Google selection is still starting. Tap the voice button again.";
                Log.i("MapsGeminiRecovery","result="+result+" selected="+selected+" bound="+bound+(stalled?" stalled=true":""));
                return onlyRestored?ready&&result==GeminiRecoveryPolicy.Result.RESTORED:ready;
            }catch(VehicleLocalAdb.ApprovalRequiredException e){status="Approve the Maps ADB key once: turn recovery off and on, then allow it. Voice-button retries never request approval.";}
            catch(Exception e){status="Recovery could not finish. Enable ADB on this head unit and retry. No computer is needed after key approval.";Log.i("MapsGeminiRecovery","result=unavailable type="+e.getClass().getSimpleName());}
            finally{active=null;}
            return false;
        }
    }
}
