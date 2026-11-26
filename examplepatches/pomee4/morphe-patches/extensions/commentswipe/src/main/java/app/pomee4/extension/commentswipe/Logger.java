package app.pomee4.extension.commentswipe;

import android.util.Log;

final class Logger {
    private static final String TAG = "pomee4: CommentSwipe";

    interface LogMessage {
        String build();
    }

    private Logger() {
    }

    static void printDebug(LogMessage message) {
        if (Log.isLoggable(TAG, Log.DEBUG)) Log.d(TAG, message.build());
    }

    static void printException(LogMessage message, Throwable ex) {
        Log.e(TAG, message.build(), ex);
    }
}
