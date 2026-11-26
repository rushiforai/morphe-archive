
package nl.johninnl.soundcloud;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.util.Log;

import java.lang.ref.WeakReference;

public final class SleepTimerEntry {
    private static final String TAG = "SleepTimer";

    private static volatile WeakReference<Activity> current =
            new WeakReference<>(null);

    private static volatile Application application;
    private static boolean callbacksRegistered;

    /**
     * Called from Application.onCreate(), i.e. at the start of EVERY process, whichever component
     * started it (launcher, task restore after the process was killed, notification, media
     * service, Android Auto, ...). From here on the tracker below sees every Activity that is
     * created, so open() always finds the foreground Activity.
     */
    public static void attachApplication(Application app) {
        if (app == null) return;
        application = app;
        SleepTimerIds.init(app);
        registerTracker(app);
        Log.i(TAG, "attached to the Application");
    }

    /** Kept as a second, harmless entry point; everything it does is idempotent. */
    public static void attach(Activity activity) {
        if (activity == null) return;

        current = new WeakReference<>(activity);

        Application app = activity.getApplication();
        application = app;

        SleepTimerIds.init(app);
        registerTracker(app);
    }

    private static void registerTracker(Application app) {
        synchronized (SleepTimerEntry.class) {
            if (!callbacksRegistered && app != null) {
                app.registerActivityLifecycleCallbacks(new Tracker());
                callbacksRegistered = true;
            }
        }
    }

    public static void open() {
        Activity activity = current.get();

        if (activity == null) {
            Log.w(TAG, "No Activity to show the sleep timer window");
            return;
        }

        activity.runOnUiThread(() -> {
            Activity latest = current.get();

            if (latest == null ||
                    latest.isFinishing() ||
                    latest.isDestroyed()) {
                Log.w(TAG, "No valid Activity to show the sleep timer window");
                return;
            }

            try {
                SleepTimerDialog.show(latest);
            } catch (RuntimeException e) {
                Log.e(TAG, "Failed to show dialog", e);
            }
        });
    }

    private static final class Tracker
            implements Application.ActivityLifecycleCallbacks {

        @Override
        public void onActivityCreated(Activity activity, Bundle state) {
            current = new WeakReference<>(activity);
        }

        @Override
        public void onActivityStarted(Activity activity) {
            current = new WeakReference<>(activity);
        }

        @Override
        public void onActivityResumed(Activity activity) {
            current = new WeakReference<>(activity);
        }

        @Override public void onActivityPaused(Activity activity) {}

        @Override public void onActivityStopped(Activity activity) {}

        @Override
        public void onActivitySaveInstanceState(
                Activity activity, Bundle outState) {}

        @Override
        public void onActivityDestroyed(Activity activity) {
            if (current.get() == activity) {
                current = new WeakReference<>(null);
            }
        }
    }

    private SleepTimerEntry() {}
}
