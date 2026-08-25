package app.aimal.extension.streaming;

import android.util.Log;

/**
 * Thin logging wrapper, so `adb logcat -s StreamPlayback` is enough to debug a
 * patched build on device.
 *
 * Everything logs unconditionally. An earlier version gated the detail logs on
 * the app being debuggable, which meant the only builds that could ever be
 * debugged were the ones that never needed it - a release build of a streaming
 * app is never debuggable.
 */
public final class Logger {
    public static final String TAG = "StreamPlayback";

    private Logger() {
    }

    public static void d(String message) {
        Log.d(TAG, message);
    }

    public static void i(String message) {
        Log.i(TAG, message);
    }

    public static void e(String message, Throwable throwable) {
        Log.e(TAG, message, throwable);
    }
}
