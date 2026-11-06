package app.morphe.extension.googlemessages;

import java.util.Locale;

/**
 * Injected into Google Messages by MessageKeywordFilterPatch.
 * Keywords are supplied by the patch option (comma-separated) and matched
 * case-insensitively as substrings of the message body.
 */
@SuppressWarnings("unused")
public final class KeywordFilter {
    private static volatile String rawKeywords = null;
    private static volatile String[] keywords = new String[0];

    private KeywordFilter() {}

    /** Called by the patched code with the patch option value. Cheap if unchanged. */
    public static void setKeywords(String csv) {
        if (csv == null) csv = "";
        if (csv.equals(rawKeywords)) return;
        String[] parts = csv.split(",");
        int n = 0;
        for (String part : parts) {
            String p = part.trim().toLowerCase(Locale.ROOT);
            if (!p.isEmpty()) parts[n++] = p;
        }
        String[] out = new String[n];
        System.arraycopy(parts, 0, out, 0, n);
        keywords = out;
        rawKeywords = csv;
    }

    /** Return true to drop the message. Never throws. */
    public static boolean shouldBlock(String sender, String body) {
        try {
            if (body == null || body.isEmpty()) return false;
            String haystack = body.toLowerCase(Locale.ROOT);
            for (String keyword : keywords) {
                if (haystack.contains(keyword)) return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }
}
