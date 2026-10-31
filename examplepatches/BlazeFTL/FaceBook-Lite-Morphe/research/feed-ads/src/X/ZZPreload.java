package X;

/** Loads the X.1DY trace wrapper from the APK dex before the secondary dex exists. Research only. */
public final class ZZPreload {
    public static void run(android.content.Context context) {
        try {
            Class.forName("X.1DY", false, ZZPreload.class.getClassLoader());
        } catch (Throwable ignored) {
        }
    }
}
