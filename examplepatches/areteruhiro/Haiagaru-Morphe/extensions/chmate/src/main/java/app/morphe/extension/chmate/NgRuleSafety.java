package app.morphe.extension.chmate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Local input checks and a private-use range check for shared rules. */
final class NgRuleSafety {
    static final int REGEX_FLAG = 0x20;

    private static final String HEX_ESCAPE = "(?:\\\\x\\{([0-9a-f]{1,6})\\}|\\\\u([0-9a-f]{4}))";
    private static final Pattern EXPLICIT_RANGE = Pattern.compile(
            HEX_ESCAPE + "\\s*-\\s*" + HEX_ESCAPE, Pattern.CASE_INSENSITIVE);

    /** Returns a user-facing rejection reason, or null when this NG entry is allowed. */
    static String rejection(String category, String pattern) {
        String value = pattern == null ? "" : pattern.trim();
        if ("WORD".equals(category) && value.isEmpty())
            return "NGワードを入力してください";
        return null;
    }

    static void requireAllowed(String category, String pattern) {
        String reason = rejection(category, pattern);
        if (reason != null) throw new IllegalArgumentException(reason);
    }

    static boolean containsPrivateUseRange(String pattern) {
        Matcher matcher = EXPLICIT_RANGE.matcher(pattern == null ? "" : pattern);
        while (matcher.find()) {
            int start = parseCodePoint(matcher.group(1), matcher.group(2));
            int end = parseCodePoint(matcher.group(3), matcher.group(4));
            if (start < 0 || end < 0) continue;
            int low = Math.min(start, end), high = Math.max(start, end);
            if (intersects(low, high, 0xE000, 0xF8FF)
                    || intersects(low, high, 0xF0000, 0xFFFFD)
                    || intersects(low, high, 0x100000, 0x10FFFD)) return true;
        }
        return false;
    }

    private static int parseCodePoint(String xEscape, String uEscape) {
        String value = xEscape == null ? uEscape : xEscape;
        if (value == null) return -1;
        try { return Integer.parseInt(value, 16); }
        catch (NumberFormatException invalid) { return -1; }
    }

    private static boolean intersects(int low, int high, int rangeLow, int rangeHigh) {
        return low <= rangeHigh && high >= rangeLow;
    }

    private NgRuleSafety() {}
}
