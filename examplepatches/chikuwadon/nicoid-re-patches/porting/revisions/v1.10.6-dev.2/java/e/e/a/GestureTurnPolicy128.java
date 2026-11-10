package e.e.a;

/** Pure recognizer policy; deliberately leaves all strokes except UD/DU alone. */
public final class GestureTurnPolicy128 {
    private GestureTurnPolicy128() {}

    public static boolean verticalReversal(String pattern) {
        return "UD".equals(pattern) || "DU".equals(pattern);
    }

    public static boolean allowClaim(boolean enabled, String pattern) {
        return enabled || !verticalReversal(pattern);
    }
}
