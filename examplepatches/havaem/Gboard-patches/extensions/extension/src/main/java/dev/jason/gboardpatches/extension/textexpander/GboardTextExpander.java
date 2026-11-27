package dev.jason.gboardpatches.extension.textexpander;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.function.Supplier;

/** Shortcut storage format, trigger detection and template expansion; no Android types. */
public final class GboardTextExpander {
    public static final int MAX_SHORTCUT_LENGTH = 32;
    static final String CURSOR = "{cursor}";

    private GboardTextExpander() { }

    /** Values for the template variables, read only when the template uses them. */
    public interface Variables {
        String date();
        String time();
        String clipboard();
    }

    public static final class Expansion {
        public final String text;
        /** Index in {@link #text} where the cursor goes, or -1 for the end. */
        public final int cursor;

        Expansion(String text, int cursor) {
            this.text = text;
            this.cursor = cursor;
        }
    }

    /** The word just typed: the run of non-whitespace before the cursor, or null. */
    public static String trailingToken(CharSequence before) {
        if (before == null) return null;
        int end = before.length();
        int start = end;
        while (start > 0 && !Character.isWhitespace(before.charAt(start - 1))) start--;
        return start == end ? null : before.subSequence(start, end).toString();
    }

    public static Expansion expand(String template, Variables variables) {
        String text = template;
        text = replace(text, "{date}", variables::date);
        text = replace(text, "{time}", variables::time);
        text = replace(text, "{clipboard}", variables::clipboard);
        int cursor = text.indexOf(CURSOR);
        if (cursor >= 0) text = text.replace(CURSOR, "");
        return new Expansion(text, cursor);
    }

    private static String replace(String text, String token, Supplier<String> value) {
        if (!text.contains(token)) return text;
        String resolved = value.get();
        return text.replace(token, resolved == null ? "" : resolved);
    }

    /** A shortcut must be one word that fits the trigger lookback. */
    public static boolean validShortcut(String shortcut) {
        if (shortcut == null || shortcut.isEmpty() || shortcut.length() > MAX_SHORTCUT_LENGTH) {
            return false;
        }
        for (int i = 0; i < shortcut.length(); i++) {
            if (Character.isWhitespace(shortcut.charAt(i))) return false;
        }
        return true;
    }

    /**
     * Encodes shortcuts as lines of {@code shortcut TAB expansion}, with backslash, tab and
     * newline escaped, so the stored value stays readable in a backup.
     */
    public static String encode(Map<String, String> shortcuts) {
        StringBuilder out = new StringBuilder();
        for (Map.Entry<String, String> entry : shortcuts.entrySet()) {
            out.append(escape(entry.getKey())).append('\t').append(escape(entry.getValue()))
                    .append('\n');
        }
        return out.toString();
    }

    /** Insertion-ordered; malformed lines and invalid shortcuts are skipped. */
    public static Map<String, String> decode(String value) {
        Map<String, String> result = new LinkedHashMap<>();
        if (value == null || value.isEmpty()) return result;
        for (String line : value.split("\n")) {
            int tab = line.indexOf('\t');
            if (tab <= 0) continue;
            String shortcut = unescape(line.substring(0, tab));
            if (validShortcut(shortcut)) result.put(shortcut, unescape(line.substring(tab + 1)));
        }
        return result;
    }

    private static String escape(String value) {
        return value.replace("\\", "\\\\").replace("\t", "\\t").replace("\n", "\\n");
    }

    private static String unescape(String value) {
        StringBuilder out = new StringBuilder(value.length());
        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            if (c != '\\' || i + 1 == value.length()) {
                out.append(c);
                continue;
            }
            char next = value.charAt(++i);
            out.append(next == 't' ? '\t' : next == 'n' ? '\n' : next);
        }
        return out.toString();
    }
}
