/*
 * Meta Patches — extension initialization.
 *
 * Forked from InstaFL (https://github.com/mamiiblt/instafel) by
 * mamiiblt (Muhammed Ali Bulut), rebranded to Meta Patches.
 *
 * This file is part of Meta Patches, licensed under the GNU General Public
 * License version 3. https://www.gnu.org/licenses/gpl-3.0.html
 */

package app.hemk651.meta.extension;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.widget.Toast;

import app.hemk651.meta.extension.activity.ModsMenuActivity;

/**
 * Entry points the patch calls from Instagram bytecode.
 */
public class ModsInit {

    private static Context ctx;

    /**
     * Called by the "Add Mods menu" patch from the Application.onCreate of the
     * app shell.
     *
     * InstaFL builds its crash handler inline in smali; here the installation
     * is done in Java so the patch only has to inject a single static call.
     */
    public static void init(Context context) {
        ctx = context;

        Thread.UncaughtExceptionHandler previous =
                Thread.getDefaultUncaughtExceptionHandler();
        if (previous instanceof ModsCrashManager.ModsCrashHandler) {
            return;
        }
        Thread.setDefaultUncaughtExceptionHandler(
                new ModsCrashManager.ModsCrashHandler(context));
    }

    /** Opens the main Mods menu activity. */
    public static void startModsMenu() {
        startModsMenu(null);
    }

    /**
     * Opens the main Mods menu activity, preferring the given context and
     * falling back to the one stored by {@link #init(Context)}.
     */
    public static void startModsMenu(Context context) {
        Context base = context != null ? context : ctx;
        if (base == null) {
            return;
        }
        Intent intent = new Intent(base, ModsMenuActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        base.startActivity(intent);
    }

    /** Restarts the whole app process, like InstaFL's restart menu item. */
    public static void restartApp(Activity activity) {
        Intent intent = activity.getPackageManager()
                .getLaunchIntentForPackage(activity.getPackageName());
        if (intent == null) {
            return;
        }
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP
                | Intent.FLAG_ACTIVITY_NEW_TASK
                | Intent.FLAG_ACTIVITY_CLEAR_TASK);

        activity.startActivity(intent);
        Runtime.getRuntime().exit(0);
    }

    /**
     * Reports a non-fatal error from patch-injected code into the in-app
     * crash reports (Mods &gt; Crash reports) without crashing the app.
     *
     * Called by the home sheet handler when opening the menu fails, so a
     * broken hook degrades to a toast instead of taking Instagram down.
     */
    public static void reportError(Context context, Throwable throwable) {
        try {
            new ModsCrashManager(context).saveLog(throwable);
        } catch (Exception ignored) {
            // Crash reporting must never become the crash itself.
        }
    }

    /**
     * Runs a menu action, reporting any failure into the in-app crash reports
     * and as a toast naming the cause instead of crashing the app.
     */
    public static void safeRun(Context context, Runnable action) {
        try {
            action.run();
        } catch (Throwable t) {
            reportError(context, t);
            showToast(context, "Menu error: " + t.getClass().getSimpleName());
        }
    }

    /** Shows a short toast on the UI thread. */
    public static void showToast(Context context, String message) {
        if (context == null || message == null) {
            return;
        }
        if (Looper.myLooper() == Looper.getMainLooper()) {
            Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
        } else {
            new Handler(Looper.getMainLooper()).post(
                    () -> Toast.makeText(context, message, Toast.LENGTH_SHORT).show());
        }
    }

    private ModsInit() {
    }
}
