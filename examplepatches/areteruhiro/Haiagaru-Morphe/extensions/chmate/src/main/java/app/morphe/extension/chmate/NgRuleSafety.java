package app.morphe.extension.chmate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Validation shared by native and Haiagaru NG-word registration paths. */
final class NgRuleSafety {
    static final int MIN_WORD_LENGTH = 6;
    static final int REGEX_FLAG = 0x20;

    private static final String HEX_ESCAPE = "(?:\\\\x\\{([0-9a-f]{1,6})\\}|\\\\u([0-9a-f]{4}))";
    private static final Pattern EXPLICIT_RANGE = Pattern.compile(
            HEX_ESCAPE + "\\s*-\\s*" + HEX_ESCAPE, Pattern.CASE_INSENSITIVE);

    /** Returns a user-facing rejection reason, or null when this NG entry is allowed. */
    static String rejection(String category, String pattern, short flags) {
        String value = pattern == null ? "" : pattern.trim();
        if ((flags & REGEX_FLAG) != 0 && containsPrivateUseRange(value))
            return "私用領域を広く対象にする正規表現はNGに登録できません";
        if (!"WORD".equals(category)) return null;
        if (value.codePointCount(0, value.length()) < MIN_WORD_LENGTH)
            return "NGワードは6文字以上で入力してください";
        return null;
    }

    static void requireAllowed(String category, String pattern, short flags) {
        String reason = rejection(category, pattern, flags);
        if (reason != null) throw new IllegalArgumentException(reason);
    }

    static String rejectionForUpdate(String category, String beforePattern, String pattern, short flags) {
        String reason = rejection(category, pattern, flags);
        if (reason == null) return null;
        if ("WORD".equals(category) && beforePattern != null && beforePattern.equals(pattern)
                && !((flags & REGEX_FLAG) != 0 && containsPrivateUseRange(pattern))) return null;
        return reason;
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
