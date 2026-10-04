package app.threadripper.extension.youtube;

final class Log {
    private static final String TAG = "ThreadRipper";

    private Log() {
    }

    /** Per-request detail, only when log=true in the config. */
    static void d(String message) {
        // Info level: some ROMs (log.tag=I) drop debug logs of release apps.
        if (Config.get().log) android.util.Log.i(TAG, message);
    }

    static void i(String message) {
        android.util.Log.i(TAG, message);
    }

    static void e(String message, Throwable ex) {
        android.util.Log.e(TAG, message, ex);
    }
}
