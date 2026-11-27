package dev.brave.extension.perf;

import android.app.job.JobScheduler;
import android.content.Context;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class StartupHelper {
    private static final int TASK_ID_BACKGROUND_SYNC_ONE_SHOT = 102; // 0x66
    private static final int TASK_ID_BACKGROUND_SYNC_PERIODIC = 105; // 0x69
    private static final AtomicBoolean sBgSyncCleaned = new AtomicBoolean(false);

    /**
     * Cancels any pre-existing BackgroundSync JobScheduler jobs (e.g. scheduled prior to patching)
     * once per process startup.
     */
    public static void cancelPendingBackgroundSyncJobs(Context context) {
        if (context == null || !sBgSyncCleaned.compareAndSet(false, true)) return;
        dev.brave.extension.media.NetworkSafety.initContext(context);
        try {
            Object obj = context.getSystemService(Context.JOB_SCHEDULER_SERVICE);
            if (obj instanceof JobScheduler) {
                JobScheduler js = (JobScheduler) obj;
                js.cancel(TASK_ID_BACKGROUND_SYNC_ONE_SHOT);
                js.cancel(TASK_ID_BACKGROUND_SYNC_PERIODIC);
            }
        } catch (Throwable ignored) {}
    }

    /**
     * Drains startup callbacks safely without re-entrancy issues, stale indexing,
     * or dropped listeners.
     */
    public static void drainAndRunCallbacks(List<?> callbacks) {
        if (callbacks == null || callbacks.isEmpty()) return;

        List<Runnable> copy = new ArrayList<>();
        synchronized (callbacks) {
            for (Object o : callbacks) {
                if (o instanceof Runnable) {
                    copy.add((Runnable) o);
                }
            }
            callbacks.clear();
        }

        for (Runnable r : copy) {
            try {
                if (r != null) {
                    r.run();
                }
            } catch (Throwable ignored) {}
        }
    }
}
