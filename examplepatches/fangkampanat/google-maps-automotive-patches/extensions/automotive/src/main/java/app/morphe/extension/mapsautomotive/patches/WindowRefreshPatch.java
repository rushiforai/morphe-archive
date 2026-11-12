package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.hardware.display.DisplayManager;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.Display;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;

import org.json.JSONException;
import org.json.JSONObject;

import java.lang.ref.WeakReference;
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
 * <p>
 * For diagnosis only (a window on a display that was removed): the display the window is on and the
 * one its window manager adds popups to, logged when either changes, in the problem report's {@code ui.window}
 * and in crash files.
 */
@SuppressWarnings("unused")
public final class WindowRefreshPatch {
    private static final String TAG = "MorpheWindow";
    private static final long CHECK_MS = 500;
    private static final int MAX_ATTACH_ATTEMPTS = 5, MAX_RETRIES = 2, MAX_DISPLAY_NAME_CHARS = 40;
    private static final Set<View> attached = Collections.newSetFromMap(new WeakHashMap<>());
    private static Handler main;
    /** MapsActivity's last decor size, multi-window mode and density, for the problem report. */
    static volatile int decorWidth, decorHeight, densityDpi;
    static volatile Boolean multiWindow;
    /** The last MapsActivity created, for its displays in the report and crash files; set in safe mode too (read only). */
    private static volatile WeakReference<Activity> watched;

    private WindowRefreshPatch() {
    }

    /** Injection point: start of MapsActivity's onCreate, before the decor view exists. */
    public static void install(Activity activity) {
        try {
            watched = new WeakReference<>(activity);
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
        // The display ids noteDisplays saw last; NOT_SEEN before the first layout.
        private int windowDisplayId = NOT_SEEN, managerDisplayId = NOT_SEEN;

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
            boolean moved = noteDisplays();
            if (!first && width == oldWidth && height == oldHeight) {
                if (moved) ReportBuilder.saveSnapshot(activity.getApplicationContext(), true);
                return;
            }
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

        // The display the window is on and the one its window manager adds popups to: two id reads per layout, the
        // names only when an id changed. A change is logged; the usual start, both on the default display, is not.
        // True when either id changed after the first layout.
        private boolean noteDisplays() {
            try {
                Display window = decor.getDisplay(), manager = activity.getWindowManager().getDefaultDisplay();
                int windowId = window != null ? window.getDisplayId() : NONE, managerId = manager != null ? manager.getDisplayId() : NONE;
                if (windowId == windowDisplayId && managerId == managerDisplayId) return false;
                boolean first = windowDisplayId == NOT_SEEN;
                windowDisplayId = windowId;
                managerDisplayId = managerId;
                if (first && windowId == Display.DEFAULT_DISPLAY && managerId == Display.DEFAULT_DISPLAY) return false;
                ReportLog.i(TAG, "Displays: window " + describe(window) + ", window manager " + describe(manager)
                        + (first ? " (first layout)" : ""));
                return !first;
            } catch (RuntimeException error) {
                ReportLog.w(TAG, "display check failed", error);
                return false;
            }
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

    // Displays. Display ids are never negative.
    private static final int NONE = -1, NOT_SEEN = -2;

    // The last MapsActivity while it is not destroyed, else null.
    private static Activity watched() {
        WeakReference<Activity> reference = watched;
        Activity activity = reference != null ? reference.get() : null;
        return activity == null || activity.isDestroyed() ? null : activity;
    }

    /** The display MapsActivity's window is on now; null without the activity or before its window is added. */
    static Display windowDisplay() {
        try {
            Activity activity = watched();
            Window window = activity != null ? activity.getWindow() : null;
            View decor = window != null ? window.peekDecorView() : null;
            return decor != null ? decor.getDisplay() : null;
        } catch (RuntimeException error) {
            return null;
        }
    }

    /**
     * The display MapsActivity's window manager adds windows to (popups among them): its own context's, which a
     * move to another display updates through the activity's base context chain only.
     */
    static Display managerDisplay() {
        try {
            Activity activity = watched();
            WindowManager windows = activity != null ? activity.getWindowManager() : null;
            return windows != null ? windows.getDefaultDisplay() : null;
        } catch (RuntimeException error) {
            return null;
        }
    }

    /** "5 "Overlay #1"", with " (removed)" once the display is gone; "none" for none. */
    static String describe(Display display) {
        if (display == null) return "none";
        String name = displayName(display);
        return display.getDisplayId() + (name != null ? " \"" + name + "\"" : "") + (display.isValid() ? "" : " (removed)");
    }

    /** For the problem report: id, name and whether the display is still there; null for none or unreadable. */
    static Object displayJson(Display display) throws JSONException {
        if (display == null) return JSONObject.NULL;
        try {
            String name = displayName(display);
            return new JSONObject()
                    .put("id", display.getDisplayId())
                    .put("name", name != null ? name : JSONObject.NULL)
                    .put("valid", display.isValid());
        } catch (RuntimeException error) {
            return JSONObject.NULL;
        }
    }

    // A removed display keeps its last name. Another app names its virtual displays, so the name goes into reports and
    // crash files on one line (control characters and line separators become spaces) and at most 40 characters.
    private static String displayName(Display display) {
        String name = display.getName();
        if (name == null) return null;
        StringBuilder clean = new StringBuilder(name.length());
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);
            clean.append(Character.isISOControl(c) || c == ' ' || c == ' ' ? ' ' : c);
        }
        name = clean.toString().trim();
        if (name.isEmpty()) return null;
        if (name.length() <= MAX_DISPLAY_NAME_CHARS) return name;
        int cut = MAX_DISPLAY_NAME_CHARS - 1;
        if (Character.isHighSurrogate(name.charAt(cut - 1))) cut--;
        return name.substring(0, cut) + "…";
    }

    /**
     * For crash files, from the crashing thread: the displays there are now, then the ones MapsActivity's window and
     * its window manager use, as in "0 "Built-in Screen"; Maps window 0 "Built-in Screen", window manager 5 "Overlay #1" (removed)".
     * Never throws, not even an Error, so the crash file is still written.
     */
    static String describeDisplays(Context context) {
        StringBuilder text = new StringBuilder();
        try {
            DisplayManager displays = (DisplayManager) context.getSystemService(Context.DISPLAY_SERVICE);
            if (displays != null) {
                for (Display display : displays.getDisplays()) {
                    if (text.length() > 0) text.append(", ");
                    text.append(describe(display));
                }
            }
            if (watched() != null) {
                text.append("; Maps window ").append(describe(windowDisplay()))
                        .append(", window manager ").append(describe(managerDisplay()));
            }
        } catch (Throwable error) {
            text.append(text.length() > 0 ? "; " : "").append("unreadable");
        }
        return text.length() > 0 ? text.toString() : "none";
    }
}
