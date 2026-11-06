package android.os;
public final class SystemProperties {
    public static int oneUi = 80500;
    public static boolean fail;
    public static int getInt(String key, int fallback) {
        if (fail) throw new IllegalStateException("configured reflection failure");
        return oneUi;
    }
}
