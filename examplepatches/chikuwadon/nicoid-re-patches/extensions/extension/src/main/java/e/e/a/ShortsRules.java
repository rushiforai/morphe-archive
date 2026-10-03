package e.e.a;

/** Gesture policy shared by the short player and JVM checks. */
public final class ShortsRules {
    private ShortsRules() {}
    public static int direction(float dx, float dy, float density, boolean multiplePointers) {
        if (multiplePointers || density <= 0 || Math.abs(dy) < 112 * density || Math.abs(dy) < Math.abs(dx) * 2) return 0;
        return dy < 0 ? 1 : -1;
    }
    public static boolean videoId(String id) { return id != null && id.matches("ss[0-9]+"); }
}
