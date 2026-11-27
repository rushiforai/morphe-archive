package app.xposed.extension;

import java.text.Normalizer;
import java.util.Locale;

/** Text folding and counting shared by the name, bio, affiliation and digit filters. */
final class FilterText {
    private FilterText() {
    }

    /** "@Example" or "Example" from X's username text in lower case, or null when it isn't a handle. */
    static String handle(String username) {
        if (username == null) return null;
        int start = 0, end = username.length();
        while (start < end && username.charAt(start) <= ' ') start++;
        while (end > start && username.charAt(end - 1) <= ' ') end--;
        if (start < end && username.charAt(start) == '@') start++;
        if (end - start < 1 || end - start > 15) return null;
        for (int i = start; i < end; i++) {
            char c = username.charAt(i);
            if (!(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c >= '0' && c <= '9' || c == '_')) return null;
        }
        return username.substring(start, end).toLowerCase(Locale.ROOT);
    }

    /**
     * Folds text for case-insensitive substring matching. Compatibility forms such as styled
     * or full-width letters become plain ones and emoji variation selectors are dropped, so
     * "\uD835\uDC01\uD835\uDC0E\uD835\uDC13" matches "bot" and a heart with or without its
     * emoji selector matches either spelling.
     */
    static String fold(String text) {
        if (text == null || text.isEmpty()) return "";
        String s = Normalizer.normalize(text, Normalizer.Form.NFKC);
        StringBuilder sb = null;
        for (int i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if (c == '\uFE0E' || c == '\uFE0F') {
                if (sb == null) sb = new StringBuilder(s.length()).append(s, 0, i);
            } else if (sb != null) {
                sb.append(c);
            }
        }
        return (sb != null ? sb.toString() : s).toLowerCase(Locale.ROOT);
    }

    /** A folded filter term, or "" when nothing is left of it. */
    static String term(String text) {
        return text == null ? "" : fold(text.trim()).trim();
    }

    /** Decimal digits in any script, styled ones included, without converting other numerals. */
    static int decimalDigits(String text) {
        if (text == null) return -1;
        int count = 0;
        for (int i = 0; i < text.length(); ) {
            int cp = text.codePointAt(i);
            if (Character.getType(cp) == Character.DECIMAL_DIGIT_NUMBER) count++;
            i += Character.charCount(cp);
        }
        return count;
    }

    /** The ASCII digits in a valid handle, or -1 when it isn't one. */
    static int handleDigits(String handle) {
        if (handle == null || handle.isEmpty() || handle.length() > 15) return -1;
        int count = 0;
        for (int i = 0; i < handle.length(); i++) {
            char c = handle.charAt(i);
            if (c >= '0' && c <= '9') {
                count++;
            } else if (!(c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z' || c == '_')) {
                return -1;
            }
        }
        return count;
    }

    /** X's legacy language codes mapped to current ones, lowercase primary subtag only. */
    static String language(String tag) {
        if (tag == null) return "";
        String s = tag.trim().toLowerCase(Locale.ROOT);
        int dash = s.indexOf('-');
        if (dash < 0) dash = s.indexOf('_');
        if (dash >= 0) s = s.substring(0, dash);
        switch (s) {
            case "iw":
                return "he";
            case "in":
                return "id";
            case "ji":
                return "yi";
            case "nb":
            case "nn":
                return "no";
            case "fil":
                return "tl";
            default:
                return s;
        }
    }
}
