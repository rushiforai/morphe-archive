package android.util;

/** Expected recovery failures should not require the Android runtime to report diagnostics. */
public final class Log {
    public static int e(String tag, String message, Throwable error) { return 0; }
}
