package android.util;

/** Test stand-in: errors are printed, so a failing patch shows in the test output. */
public final class Log {
    public static int e(String tag, String msg, Throwable tr) {
        System.err.println(tag + ": " + msg + " " + tr);
        return 0;
    }

    public static int e(String tag, String msg) {
        System.err.println(tag + ": " + msg);
        return 0;
    }
}
