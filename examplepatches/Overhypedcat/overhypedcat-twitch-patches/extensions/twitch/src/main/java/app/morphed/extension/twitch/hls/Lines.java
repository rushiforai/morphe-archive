package app.morphed.extension.twitch.hls;

import java.util.ArrayList;
import java.util.List;

/**
 * Splits a playlist into lines. Gives exactly what {@code text.split("\r?\n")} gives (line breaks
 * {@code \n} or {@code \r\n}, trailing empty lines dropped) without a regular expression, which was
 * the most expensive part of reading a playlist on every poll.
 */
public final class Lines {
    private Lines() {
    }

    public static String[] of(String text) {
        List<String> lines = new ArrayList<>(64);
        int start = 0;
        int length = text.length();
        while (start <= length) {
            int end = text.indexOf('\n', start);
            if (end < 0) {
                lines.add(text.substring(start));
                break;
            }
            int lineEnd = end > start && text.charAt(end - 1) == '\r' ? end - 1 : end;
            lines.add(text.substring(start, lineEnd));
            start = end + 1;
            if (start == length) break;
        }
        int size = lines.size();
        while (size > 0 && lines.get(size - 1).isEmpty()) size--;
        // String.split gives one empty string for empty text.
        if (size == 0) return text.isEmpty() ? new String[]{""} : new String[0];
        return lines.subList(0, size).toArray(new String[0]);
    }
}
