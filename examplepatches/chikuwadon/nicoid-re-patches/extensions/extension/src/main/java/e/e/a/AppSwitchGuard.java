package e.e.a;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/** Distinguishes leaving the app from opening another screen inside it. */
public final class AppSwitchGuard {
    private static final int DELAY_MS = 500;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Activity, Runnable> PENDING = new WeakHashMap<>();
    private static WeakReference<Activity> resumed = new WeakReference<>(null);
    private static Application application;
    private static boolean dispatching;

    private AppSwitchGuard() { }

    /** Returns true when the caller should wait for lifecycle callbacks. */
    public static boolean intercept(Object owner, boolean back) {
        if (back || dispatching || !(owner instanceof Activity)) return false;
        final Activity activity = (Activity) owner;
        track(activity);
        if (resumed.get() == null) resumed = new WeakReference<>(activity);
        final Runnable transfer = PlaybackTransfer.capture(activity);
        Runnable old = PENDING.remove(activity);
        if (old != null) MAIN.removeCallbacks(old);
        final WeakReference<Activity> reference = new WeakReference<>(activity);
        Runnable pending = new Runnable() {
            public void run() {
                Activity target = reference.get();
                if (target == null) return;
                PENDING.remove(target);
                // In-app navigation resumes another Activity before this deadline.
                if (resumed.get() != null) return;
                if (transfer != null) { transfer.run(); return; }
                dispatching = true;
                try {
                    Class.forName("e.e.a.PlaybackSession")
                        .getMethod("leave", Object.class, boolean.class)
                        .invoke(null, target, false);
                } catch (Exception error) {
                    Log.w("nicoid-session", "Deferred playback policy failed", error);
                } finally {
                    dispatching = false;
                }
            }
        };
        PENDING.put(activity, pending);
        MAIN.postDelayed(pending, DELAY_MS);
        return true;
    }

    private static void track(Activity activity) {
        final Application app = activity.getApplication();
        if (application == app) return;
        application = app;
        app.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            public void onActivityCreated(Activity a, Bundle state) { }
            public void onActivityStarted(Activity a) { }
            public void onActivityResumed(Activity a) {
                resumed = new WeakReference<>(a);
                for (Runnable pending : PENDING.values()) MAIN.removeCallbacks(pending);
                PENDING.clear();
                PlaybackReturn.foreground(a);
            }
            public void onActivityPaused(Activity a) {
                if (resumed.get() == a) resumed = new WeakReference<>(null);
            }
            public void onActivityStopped(Activity a) { }
            public void onActivitySaveInstanceState(Activity a, Bundle state) { }
            public void onActivityDestroyed(Activity a) {
                Runnable pending = PENDING.remove(a);
                if (pending != null) MAIN.removeCallbacks(pending);
                if (resumed.get() == a) resumed = new WeakReference<>(null);
            }
        });
    }
}
