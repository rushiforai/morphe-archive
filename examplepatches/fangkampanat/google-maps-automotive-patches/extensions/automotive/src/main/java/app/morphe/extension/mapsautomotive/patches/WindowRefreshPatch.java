package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/**
 * Split-screen layout. Maps' viewport (Llfg in 120003.E) reads the window size
 * through androidx.window, which below API 30 is {@link ApiCompat#getCurrentWindowBounds}, only when
 * it is created and when window insets are applied to the content view. A window resized after that
 * with the same insets keeps the old size: started by Quick Controls straight into split screen, Maps
 * laid out its cards for the full display (591 instead of 478 px). When the decor view's size
 * changes, and once after the first layout, this asks for the insets again so Maps measures the
 * window again.
 * <p>
 * The car also showed a case without any resize: BYD's camera ends split screen and moves Maps
 * behind home, where Maps measures the full display; when the camera closes, split screen returns
 * without resizing the decor view. So the width Maps last measured is also compared with the decor's
 * when the window gains focus, when the activity resumes and after every layout, and a mismatch asks
 * for the insets again. The density is not touched.
 * <p>
 * A mismatch, and a mismatch two retries could not reconcile, are logged.
 */
@SuppressWarnings("unused")
public final class WindowRefreshPatch {
    private static final String TAG = "MorpheWindow";
    private static final long CHECK_MS = 500;
    private static final int MAX_ATTACH_ATTEMPTS = 5, MAX_RETRIES = 2;
    private static final Set<View> attached = Collections.newSetFromMap(new WeakHashMap<>());
    private static Handler main;
    /** MapsActivity's last decor size, multi-window mode and density, for the problem report. */
    static volatile int decorWidth, decorHeight, densityDpi;
    static volatile Boolean multiWindow;

    private WindowRefreshPatch() {
    }

    /** Injection point: start of MapsActivity's onCreate, before the decor view exists. */
    public static void install(Activity activity) {
        try {
            if (!SafeMode.on(activity, SafeMode.WINDOW_REFRESH)) return;
            if (main == null) main = new Handler(Looper.getMainLooper());
            main.post(() -> attach(activity, 1));
        } catch (Throwable error) {
            ReportLog.w(TAG, "window refresh not installed", error);
        }
    }

    // Main thread only.
    private static void attach(Activity activity, int attempt) {
        try {
            if (activity.isFinishing() || activity.isDestroyed()) return;
            Window window = activity.getWindow();
            View decor = window == null ? null : window.peekDecorView();
            if (decor == null) {
                if (attempt < MAX_ATTACH_ATTEMPTS) main.postDelayed(() -> attach(activity, attempt + 1), 200);
                else ReportLog.w(TAG, "no decor view, window refresh not installed");
                return;
            }
            if (!attached.add(decor)) return;
            Watcher watcher = new Watcher(activity, decor);
            decor.addOnLayoutChangeListener(watcher);
            ViewTreeObserver observer = decor.getViewTreeObserver();
            observer.addOnGlobalLayoutListener(watcher);
            observer.addOnWindowFocusChangeListener(watcher);
            activity.getApplication().registerActivityLifecycleCallbacks(watcher);
            if (decor.isLaidOut()) watcher.refresh("attached", 0);
        } catch (Throwable error) {
            ReportLog.w(TAG, "window refresh not installed", error);
        }
    }

    /** One per decor view: the events that may leave Maps measuring a different width. */
    private static final class Watcher implements View.OnLayoutChangeListener, ViewTreeObserver.OnGlobalLayoutListener,
            ViewTreeObserver.OnWindowFocusChangeListener, Application.ActivityLifecycleCallbacks {
        private final Activity activity;
        private final View decor;
        private boolean laidOut, busy;
        // The measured and decor widths that two retries did not reconcile, checked again only after
        // focus or resume (Maps hidden behind home keeps measuring the full display).
        private long givenUp = -1;

        Watcher(Activity activity, View decor) {
            this.activity = activity;
            this.decor = decor;
        }

        @Override
        public void onLayoutChange(View view, int left, int top, int right, int bottom,
                                   int oldLeft, int oldTop, int oldRight, int oldBottom) {
            int width = right - left, height = bottom - top, oldWidth = oldRight - oldLeft, oldHeight = oldBottom - oldTop;
            decorWidth = width;
            decorHeight = height;
            multiWindow = activity.isInMultiWindowMode();
            boolean first = !laidOut;
            laidOut = true;
            if (!first && width == oldWidth && height == oldHeight) return;
            densityDpi = activity.getResources().getConfiguration().densityDpi;
            ReportBuilder.saveSnapshot(activity.getApplicationContext(), true);
            String reason = (first ? "first layout " : "resized ") + oldWidth + "x" + oldHeight + " -> " + width + "x" + height;
            // Not from inside the layout pass: the request schedules the next traversal.
            main.post(() -> refresh(reason, 0));
        }

        @Override
        public void onGlobalLayout() {
            main.post(() -> verify("layout", false));
        }

        @Override
        public void onWindowFocusChanged(boolean hasFocus) {
            if (hasFocus) main.post(() -> verify("focus", true));
        }

        @Override
        public void onActivityResumed(Activity resumed) {
            if (resumed == activity) main.post(() -> verify("resume", true));
        }

        @Override
        public void onActivityDestroyed(Activity destroyed) {
            if (destroyed != activity) return;
            activity.getApplication().unregisterActivityLifecycleCallbacks(this);
        }

        @Override public void onActivityCreated(Activity created, Bundle state) { }
        @Override public void onActivityStarted(Activity started) { }
        @Override public void onActivityPaused(Activity paused) { }
        @Override public void onActivityStopped(Activity stopped) { }
        @Override public void onActivitySaveInstanceState(Activity saved, Bundle state) { }

        // Asks for the insets again when the width Maps last measured is not the decor's.
        private void verify(String reason, boolean again) {
            try {
                if (activity.isDestroyed()) return;
                int measured = ApiCompat.lastWindowBoundsWidth, width = decor.getWidth();
                if (again) givenUp = -1;
                if (busy || measured <= 0 || width <= 0 || measured == width) return;
                if (key(measured, width) == givenUp) return;
                ReportLog.i(TAG, "Maps measured width " + measured + ", window " + width + " (" + reason + "): measuring again");
                refresh(reason + ": measured " + measured + ", window " + width, 0);
            } catch (Throwable error) {
                ReportLog.w(TAG, "window check failed", error);
            }
        }

        private void refresh(String reason, int retry) {
            try {
                if (activity.isDestroyed()) return;
                busy = true;
                decor.requestApplyInsets();
                main.postDelayed(() -> check(reason, retry), CHECK_MS);
            } catch (Throwable error) {
                busy = false;
                ReportLog.w(TAG, "window refresh failed", error);
            }
        }

        // Maps should have measured the decor's width by now; if the bounds it read still differ (the
        // configuration may arrive after the layout), ask once or twice more.
        private void check(String reason, int retry) {
            busy = false;
            if (activity.isDestroyed()) return;
            int measured = ApiCompat.lastWindowBoundsWidth, width = decor.getWidth();
            if (measured == width || measured <= 0) return;
            if (retry < MAX_RETRIES) {
                refresh(reason, retry + 1);
            } else {
                givenUp = key(measured, width);
                ReportLog.w(TAG, "Maps still measures width " + measured + ", window " + width + " (" + reason + ")");
            }
        }
    }

    private static long key(int measured, int width) {
        return (long) measured << 32 | width;
    }
}
