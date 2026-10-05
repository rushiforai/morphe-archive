package e.e.a;

import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class HistoryRules {
    private HistoryRules() { }
    private static final Pattern ID = Pattern.compile("(?:^|/(?:watch|shorts)/)((?:sm|nm|so|ss)?[0-9]+)(?:[/?#].*)?$");
    public static String id(String text) {
        if (text == null) return null;
        Matcher match = ID.matcher(text.trim());
        return match.find() ? match.group(1) : text;
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
