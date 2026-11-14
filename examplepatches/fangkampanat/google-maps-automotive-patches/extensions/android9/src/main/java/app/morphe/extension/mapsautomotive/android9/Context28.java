package app.morphe.extension.mapsautomotive.android9;

import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Build;

import java.util.concurrent.Executor;

/**
 * Android 10 members of Context (patch "Android 9 (API 28)"). Android 9 binds without an executor (callbacks on the
 * main thread, as Play services' own code does below Android 10); the op package is the app's package.
 */
public final class Context28 {
    public static final String OWNER = "Landroid/content/Context;";

    private Context28() {
    }

    public static boolean bindService(Context context, Intent service, int flags, Executor executor,
                                      ServiceConnection connection) {
        if (Build.VERSION.SDK_INT >= 29) return context.bindService(service, flags, executor, connection);
        return context.bindService(service, connection, flags);
    }

    public static String getOpPackageName(Context context) {
        if (Build.VERSION.SDK_INT >= 29) return context.getOpPackageName();
        return context.getPackageName();
    }
}
