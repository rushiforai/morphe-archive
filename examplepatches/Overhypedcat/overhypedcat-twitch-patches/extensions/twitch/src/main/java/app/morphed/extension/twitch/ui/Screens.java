package app.morphed.extension.twitch.ui;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;

import app.morphed.extension.twitch.App;
import app.morphed.extension.twitch.patches.DebugLog;
import app.morphed.extension.twitch.settings.PlayerOptionsSection;

/**
 * Follows the app's screens: which one is in front (for the patches' dialogs), the live log window on each, and
 * the player's Options sheet, which gets the patches' switches when it opens.
 */
public final class Screens implements Application.ActivityLifecycleCallbacks {
    private static final long SCAN_GAP_MS = 250;
    /** A new window is looked for this long after the activity's lost focus to it (it's being added then). */
    private static final long WINDOW_WAIT_MS = 300;
    private static WeakReference<Activity> resumed = new WeakReference<>(null);
    /** Whether the screen last resumed has been paused since (it stays current() for the Settings rows). */
    private static volatile boolean resumedPaused;
    private static boolean installed;

    private Screens() {
    }

    /** Injected at the start of the app's Application.onCreate. */
    public static void install(Application application) {
        if (installed || application == null) return;
        installed = true;
        try {
            application.registerActivityLifecycleCallbacks(new Screens());
            DebugLog.resumeIfEnabled();
        } catch (Throwable t) {
            Log.e(App.TAG, "Following the screens failed", t);
        }
    }

    public static Activity current() {
        return resumed.get();
    }

    /**
     * The kind of screen the patches' Settings rows are on (noted while they're built, when that screen is the one
     * resumed). Kept by its class, not the screen itself: each refresh rebuilds that screen as a new one.
     */
    public static void noteSettings() {
        Activity activity = resumed.get();
        if (activity != null && isSettingsScreen(activity.getClass().getName(), null)) {
            settingsClass = activity.getClass().getName();
        }
    }

    /** The rows' texts are read when Settings is built: the Settings screen, if it's the one shown, is rebuilt. */
    public static void refreshSettingsRows() {
        Activity now = resumed.get();
        if (now == null || now.isFinishing() || now.isDestroyed()) return;
        if (isSettingsScreen(now.getClass().getName(), settingsClass)) now.recreate();
    }

    /** Whether a screen of this class shows the Settings rows (never the player's: it mustn't be rebuilt). */
    static boolean isSettingsScreen(String className, String noted) {
        if (className == null) return false;
        if (className.equals(noted)) return true;
        int dot = className.lastIndexOf('.');
        return className.substring(dot + 1).endsWith("SettingsActivity");
    }

    private static volatile String settingsClass;

    @Override
    public void onActivityResumed(Activity activity) {
        resumed = new WeakReference<>(activity);
        resumedPaused = false;
        try {
            if (DebugMode.windowWanted(activity)) LogWindow.show(activity);
            watch(activity);
        } catch (Throwable t) {
            Log.e(App.TAG, "Preparing the screen failed", t);
        }
    }

    @Override
    public void onActivityPaused(Activity activity) {
        if (resumed.get() == activity) {
            resumedPaused = true; // (a layout pass after this must not bring the log window back)
            LogWindow.hide();
        }
        PlayerOverlay.paused(activity); // a screen lock ends when the screen goes
    }

    private static void watch(Activity activity) {
        View decor = activity.getWindow().getDecorView();
        if (decor.getTag(TAG_KEY) != null) return;
        watch(activity, decor);
        // A sheet or dialog (the player's Options in full screen) opens in a window of its own, and the
        // activity's window loses focus to it: its window is watched as well from then on.
        decor.getViewTreeObserver().addOnWindowFocusChangeListener(focused -> {
            if (!focused) decor.postDelayed(() -> watchWindows(activity), WINDOW_WAIT_MS);
        });
    }

    /** The activity's other windows (sheets, dialogs) not watched yet: watched, and looked through now. */
    private static void watchWindows(Activity activity) {
        try {
            for (View root : Windows.roots(activity)) {
                Activity owner = Windows.owner(root);
                // (a window whose context doesn't lead to an activity is looked through too: only the Options
                // sheet's rows are looked for there)
                if (root.getTag(TAG_KEY) != null || (owner != null && owner != activity)) continue;
                watch(activity, root);
                PlayerOptionsSection.scan(activity, root);
            }
            String problem = Windows.problem();
            if (problem != null) {
                throw new IllegalStateException("the player's sheets in their own window can't be read (" + problem + ")");
            }
        } catch (Throwable t) {
            PlayerOptionsSection.failed(t);
        }
    }

    /** Looks through a window of the activity whenever its layout changes (at most every SCAN_GAP_MS). */
    private static void watch(Activity activity, View root) {
        boolean main = root == activity.getWindow().getDecorView(); // (the debug window lives on that one)
        long[] last = {0};
        boolean[] queued = {false};
        ViewTreeObserver.OnGlobalLayoutListener listener = () -> {
            if (queued[0]) return;
            long wait = Math.max(0, SCAN_GAP_MS - (SystemClock.uptimeMillis() - last[0]));
            queued[0] = true;
            root.postDelayed(() -> {
                queued[0] = false;
                last[0] = SystemClock.uptimeMillis();
                // The log is too small to read in picture in picture.
                if (!main) {
                    // another window of the activity: only the Options sheet is looked for there
                } else if (android.os.Build.VERSION.SDK_INT >= 24 && activity.isInPictureInPictureMode()) {
                    LogWindow.hide();
                } else if (DebugMode.windowWanted(activity) && activity == resumed.get() && !resumedPaused) {
                    LogWindow.show(activity);
                }
                try {
                    PlayerOptionsSection.scan(activity, root);
                    if (main) PlayerOverlay.scan(activity, root);
                } catch (Throwable t) {
                    PlayerOptionsSection.failed(t);
                }
            }, wait);
        };
        root.getViewTreeObserver().addOnGlobalLayoutListener(listener);
        root.setTag(TAG_KEY, listener);
    }

    /** A key for our tag on the window's root view (any id-like constant outside the app's own ids works). */
    private static final int TAG_KEY = 0x7e000101;

    @Override
    public void onActivityCreated(Activity activity, Bundle saved) {
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
        PlayerOptionsSection.closeSheet(activity); // its window goes with the screen
        if (resumed.get() == activity) LogWindow.hide(); // (its views not held past the screen)
    }
}
