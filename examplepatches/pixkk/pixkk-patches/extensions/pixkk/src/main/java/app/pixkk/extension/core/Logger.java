package app.pixkk.extension.core;

import android.util.Log;

/** The extension's log. Everything goes to logcat under one tag. */
public final class Logger {
    private static final String TAG = "pixkk";

    /** A message built only when it is wanted. Not java.util.function.Supplier, which needs API 24. */
    public interface Message {
        String get();
    }

    private Logger() {
    }

    public static void printDebug(Message message) {
        Log.d(TAG, message.get());
    }

    public static void printException(Message message, Throwable failure) {
        Log.e(TAG, message.get(), failure);
    }
}
