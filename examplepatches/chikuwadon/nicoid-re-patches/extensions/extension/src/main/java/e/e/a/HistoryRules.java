package e.e.a;

import java.util.Set;

public final class HistoryRules {
    private HistoryRules() { }

    // Parsing watch IDs by scanning characters avoids regex backtracking on
    // user-supplied URLs, especially repeated /watch/... segments.
    private static String videoIdAt(String value, int start, boolean terminated) {
        if (start < 0 || start >= value.length()) return null;
        int digits = start;
        if (value.startsWith("sm", start) || value.startsWith("nm", start)
                || value.startsWith("so", start) || value.startsWith("ss", start)) {
            digits += 2;
        }
        int end = digits;
        while (end < value.length()) {
            char ch = value.charAt(end);
            if (ch < '0' || ch > '9') break;
            end++;
        }
        if (end == digits) return null;
        if (terminated && end < value.length()) {
            char after = value.charAt(end);
            if (after != '/' && after != '?' && after != '#') return null;
        }
        return value.substring(start, end);
    }

    // Video URL routing accepts the same http(s), optional www and /watch/
    // forms as the old matches() expressions without a regex on remote data.
    static boolean watchUrl(String url, boolean allowHttp) {
        if (url == null) return false;
        int host;
        if (url.startsWith("https://")) host = 8;
        else if (allowHttp && url.startsWith("http://")) host = 7;
        else return false;
        if (url.startsWith("www.", host)) host += 4;
        String path = "nicovideo.jp/watch/";
        return url.startsWith(path, host)
                && videoIdAt(url, host + path.length(), false) != null;
    }

    public static String id(String text) {
        if (text == null) return null;
        String value = text.trim();
        String id = videoIdAt(value, 0, true);
        if (id != null) return id;
        int slash = value.indexOf('/');
        while (slash >= 0) {
            int start = -1;
            if (value.startsWith("/watch/", slash)) start = slash + 7;
            else if (value.startsWith("/shorts/", slash)) start = slash + 8;
            if (start >= 0) {
                id = videoIdAt(value, start, true);
                if (id != null) return id;
            }
            slash = value.indexOf('/', slash + 1);
        }
        return text;
    }

    // Account history's views field is not supplied reliably by the endpoint.
    // Match the localized format rather than assuming a Japanese date or label.
    public static String accountViewedAt(String text, String template) {
        if (text == null || template == null) return text;
        String plain = template.replaceAll("<[^>]*>", "");
        int first = plain.indexOf("%s"), second = plain.indexOf("%s", first + 2);
        if (first < 0 || second < 0) return text;
        String separator = plain.substring(first + 2, second);
        int end = separator.isEmpty() ? -1 : text.indexOf(separator);
        return end < 0 ? text : text.substring(0, end).trim();
    }
    public static boolean same(String first, Object second) {
        return first != null && second instanceof String && id(first).equals(id((String) second));
    }
    public static boolean contains(Set<?> selected, Object stored) {
        for (Object value : selected) if (value instanceof String && same((String) value, stored)) return true;
        return false;
    }
}
