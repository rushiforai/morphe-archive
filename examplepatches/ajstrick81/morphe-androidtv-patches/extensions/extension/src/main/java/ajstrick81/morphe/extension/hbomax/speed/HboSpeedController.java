package ajstrick81.morphe.extension.hbomax.speed;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;

/**
 * Entry point of the speed extension and the only class the patch calls into
 * besides {@link PlayerBridge}.
 *
 * The speed chip is attached by watching the Activity's view tree for a video
 * surface rather than by hooking HBO's player screen. That keeps the patch side
 * down to a single context hook, and means a redesigned player UI in a future
 * HBO release cannot break the chip.
 *
 * TV-adapted from aimal-patches' streaming/Controls — the aspect-ratio and
 * subtitle machinery is dropped; this only manages the speed chip.
 */
public final class HboSpeedController {
    /** Re-walking the view tree on every layout pass would be wasteful. */
    private static final long SCAN_INTERVAL_MS = 400;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static Context applicationContext;
    private static WeakReference<Activity> activityReference = new WeakReference<>(null);
    private static HboSpeedPanel panel;
    private static WeakReference<View> videoReference = new WeakReference<>(null);
    private static long lastScanUptime;

    private HboSpeedController() {
    }

    /**
     * Called from BeamApplication.onCreate with {@code p0}. Idempotent — safe if
     * the app reaches it more than once.
     */
    public static void setContext(Context context) {
        try {
            if (applicationContext != null || context == null) return;

            applicationContext = context.getApplicationContext();
            Prefs.init(applicationContext);

            Logger.i("Playback speed control initialised for "
                    + applicationContext.getApplicationInfo().packageName);

            if (applicationContext instanceof Application) {
                ((Application) applicationContext)
                        .registerActivityLifecycleCallbacks(new Lifecycle());
            }
        } catch (Throwable t) {
            Logger.e("setContext failed", t);
        }
    }

    static void postToMainThread(Runnable runnable) {
        MAIN.post(runnable);
    }

    // Attaching and detaching -------------------------------------------------

    private static void startWatching(Activity activity) {
        activityReference = new WeakReference<>(activity);

        View decor = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
        if (decor == null) return;

        decor.getViewTreeObserver().addOnGlobalLayoutListener(LAYOUT_LISTENER);
        scan();
    }

    private static void stopWatching(Activity activity) {
        if (activityReference.get() != activity) return;

        View decor = activity.getWindow() == null ? null : activity.getWindow().getDecorView();
        if (decor != null && decor.getViewTreeObserver().isAlive()) {
            decor.getViewTreeObserver().removeOnGlobalLayoutListener(LAYOUT_LISTENER);
        }

        detachPanel();
        activityReference = new WeakReference<>(null);
        videoReference = new WeakReference<>(null);
    }

    private static final ViewTreeObserver.OnGlobalLayoutListener LAYOUT_LISTENER =
            new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    long now = SystemClock.uptimeMillis();
                    if (now - lastScanUptime < SCAN_INTERVAL_MS) return;
                    lastScanUptime = now;
                    scan();
                }
            };

    private static void scan() {
        try {
            Activity activity = activityReference.get();
            if (activity == null) return;

            View root = activity.getWindow().getDecorView();
            View video = VideoSurface.find(root);

            if (video == null) {
                // Left the player, or it has not been laid out yet.
                if (panel != null) detachPanel();
                videoReference = new WeakReference<>(null);
                return;
            }

            videoReference = new WeakReference<>(video);

            if (panel == null) attachPanel(activity);
        } catch (Throwable t) {
            Logger.e("Scan failed", t);
        }
    }

    private static void attachPanel(Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof ViewGroup)) return;

        panel = new HboSpeedPanel(activity);
        ((ViewGroup) content).addView(panel, panel.buildLayoutParams());
        Logger.d("Speed chip attached");
    }

    private static void detachPanel() {
        if (panel == null) return;

        ViewGroup parent = panel.getParent() instanceof ViewGroup
                ? (ViewGroup) panel.getParent() : null;
        if (parent != null) parent.removeView(panel);
        panel = null;
        Logger.d("Speed chip detached");
    }

    private static final class Lifecycle implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityResumed(Activity activity) {
            startWatching(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
            stopWatching(activity);
        }

        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        }

        @Override
        public void onActivityStarted(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }
}
