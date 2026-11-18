package io.github.sabopura.morphe.extension.twitch.app;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.AlertDialog;
import android.app.Application;
import android.app.ApplicationExitInfo;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Process;

import java.util.EnumSet;
import java.util.List;

import io.github.sabopura.morphe.extension.twitch.Diagnostics;
import io.github.sabopura.morphe.extension.twitch.ui.Feature;
import io.github.sabopura.morphe.extension.twitch.ui.Features;
import io.github.sabopura.morphe.extension.twitch.ui.Text;

/**
 * Stops every patch feature after the app crashes within a minute of launch three times in a row.
 * Runs before anything else in the extension. Saved settings are never touched: only this file's
 * small state changes, and the user turns the features back on from the notice or the settings.
 */
public final class CrashGuard {
    static final int CRASHES_TO_PAUSE = 3;
    static final long WINDOW_MS = 60_000;
    private static final String FILE = "sabopura_safety", STARTED = "started", CRASHES = "crashes", CRASHED = "crashed",
            PAUSED = "paused";

    private static volatile boolean paused;
    private static SharedPreferences state;
    private static long startedAt;

    private CrashGuard() {
    }

    /** True while the features are paused. */
    public static boolean paused() {
        return paused;
    }

    /** Whether a crash at this time counts towards pausing. */
    static boolean withinWindow(long crashAt, long startedAt) {
        return crashAt >= startedAt && crashAt - startedAt < WINDOW_MS;
    }

    /** Whether this count of consecutive early crashes pauses the features. */
    static boolean shouldPause(int crashes) {
        return crashes >= CRASHES_TO_PAUSE;
    }

    /**
     * The count after a run that did not last the window, given how the system says it ended. Only
     * an end the system puts down to something other than a crash breaks the streak: a signal or the
     * app exiting by itself may be a crash handler that never reached this guard.
     *
     * @param recorded the Java handler already counted a crash of that run
     * @param early the end came within the window
     */
    static int crashesAfter(int crashes, boolean recorded, int reason, boolean early) {
        if (recorded) return crashes;
        switch (reason) {
            case ApplicationExitInfo.REASON_CRASH_NATIVE:
            case ApplicationExitInfo.REASON_ANR:
                // These skip the Java handler.
                return early ? crashes + 1 : crashes;
            case ApplicationExitInfo.REASON_LOW_MEMORY:
            case ApplicationExitInfo.REASON_PERMISSION_CHANGE:
            case ApplicationExitInfo.REASON_EXCESSIVE_RESOURCE_USAGE:
            case ApplicationExitInfo.REASON_USER_REQUESTED:
            case ApplicationExitInfo.REASON_USER_STOPPED:
            case ApplicationExitInfo.REASON_DEPENDENCY_DIED:
            case ApplicationExitInfo.REASON_OTHER:
            case ApplicationExitInfo.REASON_FREEZER:
            case ApplicationExitInfo.REASON_PACKAGE_STATE_CHANGE:
            case ApplicationExitInfo.REASON_PACKAGE_UPDATED:
                return 0;
            default:
                return crashes;
        }
    }

    /**
     * Injection point: the start of TwitchApplication.onCreate, through TwitchRuntime. Returns true
     * when the features are paused for this run, so the caller starts nothing.
     */
    public static boolean start(Context context) {
        try {
            Application application = (Application) context.getApplicationContext();
            if (application == null || !mainProcess(application)) return false;
            SharedPreferences prefs = application.getSharedPreferences(FILE, Context.MODE_PRIVATE);
            state = prefs;
            int crashes = prefs.getInt(CRASHES, 0);
            long lastStarted = prefs.getLong(STARTED, 0);
            if (lastStarted != 0) {
                ApplicationExitInfo exit = lastExit(application, lastStarted);
                if (exit != null)
                    crashes = crashesAfter(crashes, prefs.getLong(CRASHED, 0) == lastStarted, exit.getReason(),
                            withinWindow(exit.getTimestamp(), lastStarted));
            }
            paused = prefs.getBoolean(PAUSED, false) || shouldPause(crashes);
            startedAt = System.currentTimeMillis();
            SharedPreferences.Editor editor =
                    prefs.edit().putLong(STARTED, startedAt).putInt(CRASHES, crashes).remove(CRASHED);
            if (paused) editor.putBoolean(PAUSED, true);
            editor.apply();
            watchCrashes();
            new Handler(Looper.getMainLooper()).postDelayed(CrashGuard::stableRun, WINDOW_MS);
            if (paused) {
                stopFeatures();
                offerResume(application);
            }
        } catch (RuntimeException | LinkageError e) {
            Diagnostics.note("app.crash-guard", e);
        }
        return paused;
    }

    private static boolean mainProcess(Application application) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.P) return true;
        return application.getPackageName().equals(Application.getProcessName());
    }

    /** How the run started at {@code lastStarted} ended, or null when the system does not say. */
    private static ApplicationExitInfo lastExit(Application application, long lastStarted) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.R) return null;
        ActivityManager manager = (ActivityManager) application.getSystemService(Context.ACTIVITY_SERVICE);
        List<ApplicationExitInfo> exits =
                manager == null ? null : manager.getHistoricalProcessExitReasons(application.getPackageName(), 0, 1);
        if (exits == null || exits.isEmpty()) return null;
        ApplicationExitInfo exit = exits.get(0);
        return exit.getTimestamp() >= lastStarted ? exit : null;
    }

    private static void watchCrashes() {
        Thread.UncaughtExceptionHandler previous = Thread.getDefaultUncaughtExceptionHandler();
        Thread.setDefaultUncaughtExceptionHandler((thread, error) -> {
            try {
                SharedPreferences prefs = state;
                // Once per run, however many threads fail before the process ends.
                if (prefs != null && withinWindow(System.currentTimeMillis(), startedAt)
                        && prefs.getLong(CRASHED, 0) != startedAt)
                    prefs.edit().putInt(CRASHES, prefs.getInt(CRASHES, 0) + 1).putLong(CRASHED, startedAt).commit();
            } catch (RuntimeException | LinkageError ignored) {
            }
            if (previous != null) previous.uncaughtException(thread, error);
        });
    }

    /** A run that lasted the whole window breaks the streak. */
    private static void stableRun() {
        try {
            SharedPreferences prefs = state;
            if (prefs != null) prefs.edit().putInt(CRASHES, 0).putLong(STARTED, 0).remove(CRASHED).apply();
        } catch (RuntimeException | LinkageError ignored) {
        }
    }

    /**
     * Empties the cache behind {@link Features#has}. It is private to Features, which this package
     * does not own, and a pause must stop every feature that consults it.
     */
    static void stopFeatures() {
        Features.pause();
    }

    private static void offerResume(Application application) {
        application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() {
            private boolean shown;

            public void onActivityResumed(Activity activity) {
                if (shown) return;
                shown = true;
                try {
                    Text.use(activity);
                    new AlertDialog.Builder(activity)
                            .setTitle(Text.label("パッチの機能を停止しました", "Patch features were stopped"))
                            .setMessage(Text.label(
                                    "起動直後のクラッシュが3回続いたため、すべてのパッチ機能を止めています。設定は変更していません。",
                                    "The app crashed right after launch three times in a row, so every patch feature is stopped. Your settings have not changed."))
                            .setPositiveButton(Text.label("再度有効にする", "Turn back on"),
                                    (dialog, which) -> resumeAndRestart(activity))
                            .setNegativeButton(Text.label("このままにする", "Keep them off"), null)
                            .show();
                } catch (RuntimeException | LinkageError ignored) {
                }
            }

            public void onActivityCreated(Activity activity, Bundle saved) {
            }

            public void onActivityStarted(Activity activity) {
            }

            public void onActivityPaused(Activity activity) {
            }

            public void onActivityStopped(Activity activity) {
            }

            public void onActivitySaveInstanceState(Activity activity, Bundle out) {
            }

            public void onActivityDestroyed(Activity activity) {
            }
        });
    }

    /** Clears the pause and starts the app again, so the features start with it. */
    public static void resumeAndRestart(Context context) {
        SharedPreferences prefs = state;
        if (prefs != null) prefs.edit().clear().commit();
        paused = false;
        Context app = context.getApplicationContext();
        Intent launch = app.getPackageManager().getLaunchIntentForPackage(app.getPackageName());
        if (launch != null) {
            launch.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            app.startActivity(launch);
        }
        Process.killProcess(Process.myPid());
    }
}
