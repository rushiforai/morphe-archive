package e.e.a;

/** Never claim a pure vertical scrolling stroke unless the option is enabled. */
public final class GestureTurnPolicy128 {
    private GestureTurnPolicy128() {}

    public static boolean verticalOnly(String pattern) {
        if (pattern == null || pattern.length() < 2) return false;
        for (int index = 0; index < pattern.length(); index++) {
            char direction = pattern.charAt(index);
            if (direction != 'U' && direction != 'D') return false;
        }
        return true;
    }

    public static boolean allowClaim(boolean enabled, String pattern) {
        return enabled || !verticalOnly(pattern);
    }
}
