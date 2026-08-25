package app.aimal.extension.streaming;

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
 * Entry point of the extension and the only class the patch calls into
 * besides {@link PlayerBridge}.
 *
 * The control panel is attached by watching the Activity's view tree for a
 * video surface rather than by hooking the app's player screen. That keeps the
 * patch side down to a single context hook and means a redesigned player UI in
 * a future app release cannot break the panel.
 */
public final class Controls {
    /** Re-walking the view tree on every layout pass would be wasteful. */
    private static final long SCAN_INTERVAL_MS = 400;

    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    private static Context applicationContext;
    private static WeakReference<Activity> activityReference = new WeakReference<>(null);
    private static ControlPanel panel;
    private static WeakReference<View> videoReference = new WeakReference<>(null);
    private static long lastScanUptime;

    private Controls() {
    }

    /**
     * Called from the app's main Activity onCreate with `p0`. Idempotent - a
     * patched app can reach this more than once if the Activity is recreated.
     */
    public static void setContext(Context context) {
        try {
            if (applicationContext != null) return;

            applicationContext = context.getApplicationContext();
            Prefs.init(applicationContext);

            Logger.i("Playback controls initialised for "
                    + applicationContext.getApplicationInfo().packageName);

            if (applicationContext instanceof Application) {
                ((Application) applicationContext).registerActivityLifecycleCallbacks(new Lifecycle());
            }

            // The Activity that ran this hook is already being created, and its
            // own onActivityResumed will follow, so nothing else is needed here.
        } catch (Throwable t) {
            Logger.e("setContext failed", t);
        }
    }

    static void postToMainThread(Runnable runnable) {
        MAIN.post(runnable);
    }

    static View currentVideo() {
        return videoReference.get();
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

            boolean isNewSurface = videoReference.get() != video;
            if (isNewSurface) {
                videoReference = new WeakReference<>(video);
                bindVideo(video);
            }

            if (panel == null) attachPanel(activity);
        } catch (Throwable t) {
            Logger.e("Scan failed", t);
        }
    }

    /**
     * Re-applies the aspect mode whenever the app re-lays-out the surface,
     * which it does on rotation, on entering fullscreen, and on every track
     * change. Without this the picture silently snaps back to FIT mid-episode.
     */
    private static void bindVideo(final View video) {
        AspectRatio.apply(video, Prefs.aspect());

        video.addOnLayoutChangeListener(new View.OnLayoutChangeListener() {
            @Override
            public void onLayoutChange(View v, int l, int t, int r, int b,
                                       int oldL, int oldT, int oldR, int oldB) {
                if (l == oldL && t == oldT && r == oldR && b == oldB) return;
                AspectRatio.apply(v, Prefs.aspect());
            }
        });
    }

    private static void attachPanel(Activity activity) {
        View content = activity.findViewById(android.R.id.content);
        if (!(content instanceof ViewGroup)) return;

        panel = new ControlPanel(activity);
        ((ViewGroup) content).addView(panel, panel.buildLayoutParams());
        Logger.d("Panel attached");
    }

    private static void detachPanel() {
        if (panel == null) return;

        ViewGroup parent = panel.getParent() instanceof ViewGroup ? (ViewGroup) panel.getParent() : null;
        if (parent != null) parent.removeView(panel);
        panel = null;
        Logger.d("Panel detached");
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
