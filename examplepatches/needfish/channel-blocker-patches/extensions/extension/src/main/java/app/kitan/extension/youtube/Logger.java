package app.kitan.extension.youtube;

import android.util.Log;

/**
 * Minimal logger for this add-on. Kept separate from the base bundle's Logger
 * so this bundle stays self-contained at compile time.
 */
final class Logger {

    private static final String TAG = "kitan.ChannelBlocker";
    private static final boolean DEBUG = false;

    private Logger() {
    }

    interface LogMessage {
        String message();
    }

    static void printDebug(LogMessage message) {
        if (DEBUG) {
            Log.d(TAG, message.message());
        }
    }

    static void printInfo(LogMessage message) {
        Log.i(TAG, message.message());
    }

    static void printException(LogMessage message) {
        Log.e(TAG, message.message());
    }

    static void printException(LogMessage message, Throwable ex) {
        Log.e(TAG, message.message(), ex);
    }
}
