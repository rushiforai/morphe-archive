package app.template.extension.telegram;

/** Conservative classifier for messages whose entire payload is a sticker or emoji sequence. */
public final class MorpheMessageContentFilter {
    private MorpheMessageContentFilter() { }

    public static boolean isEmojiOnlyText(String value) {
        if (value == null || value.trim().isEmpty()) return false;
        boolean sawEmoji = false;
        for (int i = 0; i < value.length();) {
            int cp = value.codePointAt(i);
            i += Character.charCount(cp);
            if (Character.isWhitespace(cp) || cp == 0xFE0F || cp == 0xFE0E || cp == 0x200D
                    || (cp >= 0x1F3FB && cp <= 0x1F3FF) || cp == 0x20E3) continue;
            if ((cp == '#' || cp == '*' || (cp >= '0' && cp <= '9')) && hasKeycapSuffix(value, i)) {
                int next = value.codePointAt(i);
                i += Character.charCount(next);
                if (next == 0xFE0F && i < value.length()) i += Character.charCount(value.codePointAt(i));
                sawEmoji = true;
                continue;
            }
            if (isEmojiCodePoint(cp)) {
                sawEmoji = true;
                continue;
            }
            return false;
        }
        return sawEmoji;
    }

    private static boolean hasKeycapSuffix(String value, int offset) {
        if (offset >= value.length()) return false;
        int next = value.codePointAt(offset);
        if (next == 0xFE0F) {
            int after = offset + Character.charCount(next);
            return after < value.length() && value.codePointAt(after) == 0x20E3;
        }
        return next == 0x20E3;
    }

    private static boolean isEmojiCodePoint(int cp) {
        return (cp >= 0x1F000 && cp <= 0x1FAFF) || (cp >= 0x2600 && cp <= 0x27BF)
                || (cp >= 0x2300 && cp <= 0x23FF) || cp == 0x00A9 || cp == 0x00AE
                || cp == 0x203C || cp == 0x2049 || cp == 0x2122 || cp == 0x2139
                || cp == 0x3030 || cp == 0x303D || cp == 0x3297 || cp == 0x3299;
    }
}
