package app.jofslash.extension.quora;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

/**
 * Splits a long text into parts that fit in one Google Translate link: at most MAX_CHARS characters
 * (its page takes about 5000) and MAX_ENCODED characters once put in the link, so text in other
 * scripts, which takes up to nine characters per letter there, doesn't make the link too long.
 * Parts end at a paragraph, then a sentence, then a space when there is one in the second half.
 */
final class TextParts {

    static final int MAX_CHARS = 4500;
    static final int MAX_ENCODED = 12000;

    private TextParts() {
    }

    static List<String> split(String text) {
        List<String> parts = new ArrayList<>();
        if (text == null) return parts;
        String rest = text.trim();
        while (!rest.isEmpty()) {
            int end = fit(rest);
            if (end < rest.length()) end = breakAt(rest, end);
            String part = rest.substring(0, end).trim();
            if (!part.isEmpty()) parts.add(part);
            rest = rest.substring(end).trim();
        }
        return parts;
    }

    /** How many characters from the start fit in both limits, never splitting a surrogate pair. */
    private static int fit(String s) {
        int encoded = 0;
        int i = 0;
        while (i < s.length() && i < MAX_CHARS) {
            int cp = s.codePointAt(i);
            int n = Character.charCount(cp);
            int size = encodedSize(cp);
            if (encoded + size > MAX_ENCODED || i + n > MAX_CHARS) break;
            encoded += size;
            i += n;
        }
        return Math.max(i, Math.min(s.length(), Character.charCount(s.codePointAt(0))));
    }

    /** Characters a code point takes in a link: unreserved ASCII as is, the rest as %XX per UTF-8 byte. */
    private static int encodedSize(int cp) {
        if (cp < 0x80) {
            boolean plain = (cp >= 'a' && cp <= 'z') || (cp >= 'A' && cp <= 'Z') || (cp >= '0' && cp <= '9')
                    || "-_.!~*'()".indexOf(cp) >= 0;
            return plain ? 1 : 3;
        }
        return new String(Character.toChars(cp)).getBytes(StandardCharsets.UTF_8).length * 3;
    }

    /** A nicer place to end a part at or before max: a paragraph, a sentence, a space. */
    private static int breakAt(String s, int max) {
        int half = max / 2;
        int at = s.lastIndexOf('\n', max - 1);
        if (at >= half) return at + 1;
        for (int i = max - 1; i >= half; i--) {
            char c = s.charAt(i);
            if ((c == '.' || c == '?' || c == '!' || c == '。') && (i + 1 >= s.length() || Character.isWhitespace(s.charAt(i + 1)) || c == '。')) {
                return i + 1;
            }
        }
        at = s.lastIndexOf(' ', max - 1);
        if (at >= half) return at + 1;
        // No good place: cut, but not inside a surrogate pair.
        if (max > 0 && Character.isHighSurrogate(s.charAt(max - 1))) return max - 1;
        return max;
    }
}
