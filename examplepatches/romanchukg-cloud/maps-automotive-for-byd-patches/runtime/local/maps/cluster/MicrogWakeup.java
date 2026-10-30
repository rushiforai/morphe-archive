package local.maps.cluster;

import android.app.*;
import android.content.*;
import android.content.pm.ApplicationInfo;
import android.os.*;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/** Wake BYD's stopped provider without waiting for its Binder on the Android main thread. */
final class MicrogWakeup {
    private static final String TAG="MapsClusterTest",GMS=MicrogProvider.PACKAGE,AUTHORITY=GMS+".auth.accounts";
    private static final ComponentName TRAMPOLINE=new ComponentName(GMS,"org.microg.gms.googlehelp.ui.GoogleHelpRedirectActivity");
    private static final long WAIT_MS=15000,RESTART_GUARD_MS=120000;
    private static boolean early,cold,installed;
    private static volatile boolean wakeRequired;
    private static volatile WeakReference<Activity> current=new WeakReference<>(null);
    private static volatile long requestedAt,generation;
    private static final class Attempt implements WakeupCoordinator.Gate {
        final WeakReference<Activity> activity;
        final long token,started;
        Attempt(Activity a,long token,long started){activity=new WeakReference<>(a);this.token=token;this.started=started;}
        boolean fresh(){long now=SystemClock.elapsedRealtime();return generation==token&&now>=started&&now-started<WAIT_MS;}
        public boolean alive(){return fresh()&&MicrogWakeup.alive(activity.get());}
        public WakeupCoordinator.Navigation navigation(){
            return BydGuidance.routeActiveForRecovery()?WakeupCoordinator.Navigation.ACTIVE:BydGuidance.updatePromptSafe()?WakeupCoordinator.Navigation.IDLE:WakeupCoordinator.Navigation.UNKNOWN;
        }
    }

    static boolean installed(Context c){
        try{
            if(MicrogProvider.state(c,false)!=ProviderPolicy.State.READY)return false;
            return c.getPackageManager().getActivityInfo(TRAMPOLINE,0).exported;
        }catch(Exception e){return false;}
    }
    /** Worker only: provider acquisition may wait far longer than any polling deadline. */
    static boolean running(Context c){
        if(Looper.myLooper()==Looper.getMainLooper())throw new IllegalStateException("Provider readiness probe on main thread");
        try(ContentProviderClient client=c.getContentResolver().acquireUnstableContentProviderClient(AUTHORITY)){return client!=null;}
        catch(Exception e){return false;}
    }
    private static boolean alive(Activity a){return a!=null&&current.get()==a&&!a.isFinishing()&&!a.isDestroyed();}
    private static boolean wake(Activity a){
        if(!alive(a)||BydGuidance.routeActiveForRecovery()||!installed(a))return false;
        try{
            a.startActivity(new Intent().setComponent(TRAMPOLINE).addFlags(Intent.FLAG_ACTIVITY_NO_ANIMATION|Intent.FLAG_ACTIVITY_NO_HISTORY|Intent.FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS));
            return true;
        }catch(RuntimeException e){Log.w(TAG,"microG wake-up launch failed: "+e.getClass().getSimpleName());return false;}
    }
    /** Observe only package metadata here. FLAG_STOPPED is not a process-liveness test. */
    static void early(Context base){
        if(early)return;early=true;
        if(!base.getPackageName().equals(Application.getProcessName()))return;
        try{cold=(base.getPackageManager().getApplicationInfo(GMS,0).flags&ApplicationInfo.FLAG_STOPPED)!=0;wakeRequired=cold;}
        catch(Exception ignored){}
    }
    static void install(Application app){
        if(installed)return;installed=true;
        Handler main=new Handler(Looper.getMainLooper());
        ExecutorService worker=Executors.newSingleThreadExecutor(r->{Thread t=new Thread(r,"maps-provider-readiness");t.setDaemon(true);return t;});
        SharedPreferences prefs=app.getSharedPreferences("local_microg_wakeup",Context.MODE_PRIVATE);
        WakeupCoordinator coordinator=new WakeupCoordinator(worker,main::post,SystemClock::elapsedRealtime,new WakeupCoordinator.Probe(){
            public boolean ready(){return false;}
            public boolean ready(WakeupCoordinator.Gate gate){
                Attempt attempt=(Attempt)gate;
                if(!attempt.fresh()||!installed(app))return false;
                boolean up=running(app);
                if(!attempt.fresh())return false;
                if(up)return wakeRequired;
                wakeRequired=true;main.post(()->{if(attempt.alive())wake(attempt.activity.get());});
                while(attempt.fresh()){
                    if(running(app))return true;
                    // Only the readiness worker waits; no lifecycle callback calls this loop.
                    SystemClock.sleep(100);
                }
                return false;
            }
        },()->{
            Activity a=current.get();long now=System.currentTimeMillis(),last=prefs.getLong("restart_at",0);
            if(!alive(a)||!BydGuidance.updatePromptSafe()||now<last||last>0&&now-last<RESTART_GUARD_MS)return;
            long generationAt=requestedAt,token=generation;
            // Persist the guard away from main, then recheck activity, deadline and route.
            worker.execute(()->{
                if(!prefs.edit().putLong("restart_at",now).commit())return;
                main.post(()->{
                    if(!alive(a)||token!=generation||SystemClock.elapsedRealtime()-generationAt>=WAIT_MS||!BydGuidance.updatePromptSafe())return;
                    try{
                        Intent again=new Intent(a.getIntent()).setComponent(a.getComponentName()).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK|Intent.FLAG_ACTIVITY_CLEAR_TASK);
                        Log.i(TAG,"restarting idle Maps after asynchronous microG wake-up");
                        a.startActivity(again);Runtime.getRuntime().exit(0);
                    }catch(RuntimeException e){Log.w(TAG,"microG recovery restart failed: "+e.getClass().getSimpleName());}
                });
            });
        },WAIT_MS,RESTART_GUARD_MS);
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks(){
            public void onActivityPreCreated(Activity a,Bundle b){
                if(!maps(a))return;
                generation++;
                current=new WeakReference<>(a);
                if(cold){cold=false;wake(a);}
            }
            public void onActivityResumed(Activity a){
                if(!maps(a))return;current=new WeakReference<>(a);requestedAt=SystemClock.elapsedRealtime();
                long token=++generation,generationAt=requestedAt;
                coordinator.request(new Attempt(a,token,generationAt));
                main.postDelayed(new Runnable(){public void run(){
                    if(!alive(a)||token!=generation)return;
                    // Once a route is active, do not restart later with its stale launch intent.
                    if(BydGuidance.routeActiveForRecovery()){generation++;coordinator.cancel();return;}
                    coordinator.recheck();
                    if(SystemClock.elapsedRealtime()-generationAt<WAIT_MS)main.postDelayed(this,250);
                }},250);
            }
            public void onActivityPaused(Activity a){if(current.get()==a){generation++;coordinator.cancel();current=new WeakReference<>(null);}}
            public void onActivityDestroyed(Activity a){if(current.get()==a){generation++;coordinator.cancel();current=new WeakReference<>(null);}}
            public void onActivityCreated(Activity a,Bundle b){}public void onActivityStarted(Activity a){}public void onActivityStopped(Activity a){}public void onActivitySaveInstanceState(Activity a,Bundle b){}
            private boolean maps(Activity a){return a.getClass().getName().equals("com.google.android.maps.MapsActivity");}
        });
    }
}
