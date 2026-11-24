package android.util;

import java.util.ArrayList;
import java.util.List;

public final class Log {
    public static final int DEBUG = 3;
    public static final int INFO = 4;
    private static final List<String> MESSAGES = new ArrayList<String>();
    private static boolean debugEnabled = true;

    public static synchronized boolean isLoggable(String tag, int level) {
        return debugEnabled && level >= DEBUG;
    }

    public static synchronized int d(String tag, String msg) {
        MESSAGES.add(tag + ": " + msg);
        return 0;
    }

    public static synchronized void clearForTest() {
        MESSAGES.clear();
    }

    public static synchronized List<String> messagesForTest() {
        return new ArrayList<String>(MESSAGES);
    }
}
