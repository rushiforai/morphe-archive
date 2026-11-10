package app.fakh.extension.shared;

import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.Process;

/** What every patched app needs from the running process, wherever its extension code is called from. */
public final class AppRuntime {
    private AppRuntime() {
    }

    /**
     * The app's Application, for static initializers that run before any Context is at hand.
     *
     * @return the Application, or null while the process has none yet
     */
    public static Application application() {
        try {
            return (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (ReflectiveOperationException e) {
            return null;
        }
    }

    /**
     * Starts the app over in a fresh process.
     *
     * @param context any context of the app
     */
    public static void restart(Context context) {
        Intent launch = context.getPackageManager().getLaunchIntentForPackage(context.getPackageName());
        if (launch == null) return;
        context.startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
        Process.killProcess(Process.myPid());
    }
}
