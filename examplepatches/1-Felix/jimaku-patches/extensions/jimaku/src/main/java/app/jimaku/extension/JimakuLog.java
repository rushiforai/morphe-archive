package app.jimaku.extension;

import android.util.Log;

/** Jimaku's lines in the app's log, under one tag. */
public final class JimakuLog {
    public static final String TAG = "Jimaku";

    private JimakuLog() {
    }

    public static void info(String message) {
        Log.i(TAG, message);
    }

    public static void warn(String message) {
        Log.w(TAG, message);
    }

    public static void fault(String where, Throwable fault) {
        Log.e(TAG, "Fault in " + where, fault);
    }
}
