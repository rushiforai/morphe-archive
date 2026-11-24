package android.os;

public final class Looper {
    private static final Looper MAIN = new Looper();
    private static final ThreadLocal<Looper> CURRENT = new ThreadLocal<Looper>();

    public static Looper getMainLooper() { return MAIN; }
    public static Looper myLooper() { return CURRENT.get(); }
    public static void setMyLooperForTest(Looper looper) {
        if (looper == null) CURRENT.remove();
        else CURRENT.set(looper);
    }
}
