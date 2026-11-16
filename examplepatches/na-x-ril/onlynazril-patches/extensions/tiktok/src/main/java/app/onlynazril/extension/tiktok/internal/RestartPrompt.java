package app.onlynazril.extension.tiktok.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build;
import android.util.Log;
import android.view.View;

import app.onlynazril.extension.tiktok.ui.Prompt;

/**
 * Asks for a restart, for either reason the extension has one.
 * <p>
 * The installation reason: a freshly patched install can render a name from values the app cached before
 * this extension was there, and the extension cannot clear that cache. The app's own
 * `lastUpdateTime` is remembered, and a newer one means the APK changed since it last asked.
 * <p>
 * The change reason: the background color is applied where the app builds its views, so a screen
 * already on the display keeps the color it was built with. Every change in the Background section
 * asks, and that ask is not tied to an installation.
 * <p>
 * Both are the same prompt, built once in {@link Prompt}; only the copy and the moment differ.
 */
public final class RestartPrompt {
    private static final String TAG = "tiktokHandle";
    private static final String PREFS = "tiktokHandle_prefs";
    private static final String KEY_INSTALL = "restart_prompt_install";

    private static final String INSTALL_TITLE = "Restart TikTok once";
    private static final String INSTALL_MESSAGE = "Restart to finish setting up.";

    private static final String CHANGE_TITLE = "Restart app to apply changes.";

    private static volatile boolean handled;

    private RestartPrompt() {}

    /** Called where a view is in hand; does nothing when this installation has already been asked. */
    public static void maybeShow(View view) {
        if (view == null || handled) return;
        try {
            Context context = view.getContext();
            if (context == null) return;

            Context appContext = context.getApplicationContext();
            SharedPreferences prefs = appContext.getSharedPreferences(PREFS, Context.MODE_PRIVATE);
            long installed = installedAt(appContext);

            if (installed <= 0 || prefs.getLong(KEY_INSTALL, 0) >= installed) {
                handled = true;
                return;
            }

            Activity activity = validActivity(context);
            if (activity == null) return;

            handled = true;
            prefs.edit().putLong(KEY_INSTALL, installed).apply();
            Debug.print("restart prompt: asked, install=" + installed);
            Prompt.show(activity, INSTALL_TITLE, INSTALL_MESSAGE, () -> restart(activity));
        } catch (Throwable t) {
            Log.w(TAG, "restart prompt failed", t);
        }
    }

    /**
     * Asks on purpose, after a setting that only a fresh process can pick up. Not tied to an
     * installation, and dropped by the prompt itself when one is already on screen.
     */
    public static void askNow(Context context) {
        try {
            Activity activity = validActivity(context);
            if (activity == null) return;
            Prompt.show(activity, CHANGE_TITLE, null, () -> restart(activity));
        } catch (Throwable t) {
            Log.w(TAG, "restart prompt failed", t);
        }
    }

    /** Restarts now, from any context that leads to an Activity. */
    public static void restartNow(Context context) {
        try {
            Activity activity = validActivity(context);
            if (activity == null) return;
            restart(activity);
        } catch (Throwable t) {
            Log.w(TAG, "restart failed", t);
        }
    }

    private static Activity validActivity(Context context) {
        if (context == null) return null;
        Activity activity = Activities.of(context);
        if (activity == null || activity.isFinishing() || activity.isDestroyed()) {
            return null;
        }
        return activity;
    }

    /**
     * Restarts the app rather than only closing it: the launcher activity is put in a fresh task and
     * this process is ended, so the app comes back on its own with the state a fresh installation left
     * behind cleared.
     */
    private static void restart(Activity activity) {
        Context appContext = activity.getApplicationContext();
        Intent launch = appContext.getPackageManager()
                .getLaunchIntentForPackage(appContext.getPackageName());

        if (launch == null || launch.getComponent() == null) {
            Debug.print("restart: the launcher activity could not be resolved");
            close(activity);
            return;
        }

        try {
            Intent restartIntent = Intent.makeRestartActivityTask(launch.getComponent());
            activity.startActivity(restartIntent);
            Debug.print("restart: a fresh task was started, ending this process now");
            activity.finishAffinity();
        } catch (Throwable t) {
            Debug.print("restart: the fresh task did not start (" + t + ")");
            close(activity);
            return;
        }

        Runtime.getRuntime().exit(0);
    }

    /** The fallback: close what is open and end the process, without bringing anything back. */
    private static void close(Activity activity) {
        try {
            activity.finishAffinity();
        } catch (Throwable ignored) {
        }
        Debug.print("restart: ending this process");
        Runtime.getRuntime().exit(0);
    }

    private static long installedAt(Context context) {
        try {
            PackageManager pm = context.getPackageManager();
            String pkg = context.getPackageName();
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
                return pm.getPackageInfo(pkg, PackageManager.PackageInfoFlags.of(0)).lastUpdateTime;
            }
            return pm.getPackageInfo(pkg, 0).lastUpdateTime;
        } catch (Throwable t) {
            return 0;
        }
    }
}
