package app.twoeno.extension.shared;

import android.util.Log;

/**
 * Minimal logger shared by all 2eno extensions.
 * <p>
 * The extension code runs either inside an app patched with Morphe or inside an
 * Xposed module (NexAlloy), so it must not depend on anything but the Android framework.
 */
public final class Logger {
    private static final String TAG = "2enoPatches";

    private Logger() {
    }

    public static void info(String message) {
        Log.i(TAG, message);
    }

    public static void error(String message, Throwable throwable) {
        Log.e(TAG, message, throwable);
    }
}
