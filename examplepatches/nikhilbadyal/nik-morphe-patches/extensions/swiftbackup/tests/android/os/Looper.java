package android.os;

/** A single token is sufficient because the controller only needs a main-thread handler boundary. */
public final class Looper {
    private static final Looper MAIN = new Looper();
    public static Looper getMainLooper() { return MAIN; }
}
