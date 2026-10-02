package android.util;
public class Log {
    public static int w(String tag, String message, Throwable cause) {
        throw new AssertionError(message, cause);
    }
}
