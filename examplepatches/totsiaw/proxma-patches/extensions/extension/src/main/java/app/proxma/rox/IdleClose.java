package app.proxma.rox;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.Application;
import android.content.Context;
import android.media.AudioManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;
import android.os.SystemClock;
import android.util.Log;

import java.util.List;

/**
 * ROX keeps working after it leaves the screen: its Dart timers, the ad, analytics and push SDKs
 * and the web views it loaded stay alive for as long as Android keeps the process, which with
 * battery set to Unrestricted can be hours. The process is also started without any screen, by
 * push messages, jobs and alarms, and then stays up the same way. So once no ROX screen has been
 * visible for a few minutes, nothing is playing and no job is running, this closes the process.
 * Push notifications still arrive, because the system starts the app again to deliver them.
 * Opening ROX afterwards is a normal fresh start.
 */
public final class IdleClose {

    private static final String TAG = "PROXMA_ROX";
    private static final String PREFS = "proxma_rox";
    private static final String KEY_LAST_CLOSE = "idle_last_close";
    private static final long IDLE_MS = 180_000L;
    private static final long RECHECK_MS = 60_000L;
    // A process the system starts again this soon after a close is left alone, so a component
    // that keeps restarting can't turn closing into a start-close loop that costs more battery.
    private static final long RESTART_GUARD_MS = 15L * 60L * 1000L;

    // Job services that the system binds while their job runs. Closing then would make the
    // system retry the job, which wakes the app again.
    private static final String[] JOB_SERVICES = {
        "app.proxma.rox.CheckinJobService",
        "androidx.work.impl.background.systemjob.SystemJobService",
        "com.google.android.gms.measurement.AppMeasurementJobService",
        "com.google.android.datatransport.runtime.scheduling.jobscheduling.JobInfoSchedulerService",
    };

    private static volatile boolean sRegistered = false;
    private static boolean sLeaveAlone = false;
    private static int sStarted = 0;
    private static Context sContext;
    private static final Handler sHandler = new Handler(Looper.getMainLooper());

    private static final Runnable CHECK = new Runnable() {
        @Override public void run() {
            try {
                check();
            } catch (Throwable t) {
                Log.w(TAG, "IDLE_ERR " + t);
            }
        }
    };

    private IdleClose() {}

    /** From IdleProvider, before Application.onCreate, in every process the app starts. */
    static void onProcessStart(Context context) {
        if (context == null) return;
        Context app = context.getApplicationContext() != null ? context.getApplicationContext() : context;
        if (!(app instanceof Application)) {
            Log.w(TAG, "IDLE no application at process start");
            return;
        }
        if (!register((Application) app)) return;
        long lastClose = app.getSharedPreferences(PREFS, Context.MODE_PRIVATE).getLong(KEY_LAST_CLOSE, 0L);
        long since = System.currentTimeMillis() - lastClose;
        if (lastClose > 0 && since >= 0 && since < RESTART_GUARD_MS) {
            sLeaveAlone = true;
            Log.i(TAG, "IDLE process restarted " + (since / 1000L) + "s after a close, leaving it open");
        }
        // No screen yet; if none shows up, the process was started for background work.
        sHandler.postDelayed(CHECK, IDLE_MS);
        Log.i(TAG, "IDLE process start, close check scheduled");
    }

    /** From MainActivity.onCreate; a no-op when the provider already registered. */
    public static void onActivityCreate(Activity activity) {
        try {
            if (activity == null) return;
            if (register(activity.getApplication())) {
                // onActivityStarted for this activity has not run yet, so the counter starts at zero.
                Log.i(TAG, "IDLE registered from the app screen");
            }
        } catch (Throwable t) {
            Log.w(TAG, "IDLE_ENTRY_ERR " + t);
        }
    }

    private static synchronized boolean register(Application application) {
        if (sRegistered || application == null) return false;
        sRegistered = true;
        sContext = application;
        application.registerActivityLifecycleCallbacks(new Callbacks());
        Log.i(TAG, "IDLE registered");
        return true;
    }

    private static void check() {
        if (sStarted > 0) {
            Log.i(TAG, "IDLE check skipped, a screen is visible");
            return;
        }
        if (AutoCheckin.backgroundRunning()) {
            Log.i(TAG, "IDLE background check-in running, checking again later");
            sHandler.postDelayed(CHECK, RECHECK_MS);
            return;
        }
        AudioManager audio = (AudioManager) sContext.getSystemService(Context.AUDIO_SERVICE);
        if (audio != null && audio.isMusicActive()) {
            Log.i(TAG, "IDLE audio playing, checking again later");
            sHandler.postDelayed(CHECK, RECHECK_MS);
            return;
        }
        String busy = busyService();
        if (busy != null) {
            Log.i(TAG, "IDLE " + busy + " running, checking again later");
            sHandler.postDelayed(CHECK, RECHECK_MS);
            return;
        }
        if (sLeaveAlone) {
            Log.i(TAG, "IDLE not closing, this process was restarted right after a close");
            return;
        }
        Log.i(TAG, "IDLE closing app after time in background, up " +
            ((SystemClock.elapsedRealtime() - Process.getStartElapsedRealtime()) / 1000L) + "s");
        sContext.getSharedPreferences(PREFS, Context.MODE_PRIVATE).edit()
            .putLong(KEY_LAST_CLOSE, System.currentTimeMillis()).commit();
        Process.killProcess(Process.myPid());
    }

    /** A foreground service or a running job in this process, or null. */
    @SuppressWarnings("deprecation")
    private static String busyService() {
        try {
            ActivityManager manager = (ActivityManager) sContext.getSystemService(Context.ACTIVITY_SERVICE);
            if (manager == null) return null;
            List<ActivityManager.RunningServiceInfo> services = manager.getRunningServices(200);
            if (services == null) return null;
            int pid = Process.myPid();
            for (ActivityManager.RunningServiceInfo info : services) {
                if (info.pid != pid || info.service == null) continue;
                String name = info.service.getClassName();
                if (info.foreground) return "foreground service " + name;
                if (info.clientCount > 0) {
                    for (String job : JOB_SERVICES) {
                        if (job.equals(name)) return "job " + name;
                    }
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "IDLE_SERVICES_ERR " + t);
        }
        return null;
    }

    private static final class Callbacks implements Application.ActivityLifecycleCallbacks {
        @Override public void onActivityStarted(Activity activity) {
            sStarted++;
            // The user opened ROX: closing this process later is fine again.
            sLeaveAlone = false;
            sHandler.removeCallbacks(CHECK);
        }

        @Override public void onActivityStopped(Activity activity) {
            if (sStarted > 0) sStarted--;
            if (sStarted == 0) {
                sHandler.removeCallbacks(CHECK);
                sHandler.postDelayed(CHECK, IDLE_MS);
                Log.i(TAG, "IDLE app in background, close check scheduled");
            }
        }

        @Override public void onActivityCreated(Activity activity, Bundle state) {}
        @Override public void onActivityResumed(Activity activity) {}
        @Override public void onActivityPaused(Activity activity) {}
        @Override public void onActivitySaveInstanceState(Activity activity, Bundle state) {}
        @Override public void onActivityDestroyed(Activity activity) {}
    }
}
