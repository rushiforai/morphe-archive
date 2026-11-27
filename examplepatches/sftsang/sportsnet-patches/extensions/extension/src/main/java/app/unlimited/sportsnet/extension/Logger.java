package app.unlimited.sportsnet.extension;

import android.util.Log;

final class Logger {
    private static final String TAG = "SportsnetUnlimited";

    private Logger() {
    }

    static void info(String message) {
        Log.i(TAG, message);
    }

    static void error(String message, Throwable error) {
        Log.e(TAG, message, error);
    }
}
