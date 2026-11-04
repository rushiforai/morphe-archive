package app.linkedin.extension;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Removes tracking parameters from LinkedIn links inside shared or copied text.
 * Plain Java (no Android types) so it can be tested off device.
 */
final class LinkCleaner {
    private static final Pattern URL = Pattern.compile("https?://[^\\s\"'<>]+");
    private static final Set<String> TRACKING_PARAMS = new HashSet<>(Arrays.asList(
            "utm_source", "utm_medium", "utm_campaign", "utm_content", "utm_term", "utm_id",
            "trk", "trkinfo", "trkemail", "rcm", "lipi", "trackingid", "refid", "midtoken", "midsig",
            "eid", "li_fat_id", "originalsubdomain", "sharetype", "src"));

    private LinkCleaner() {
    }

    /** Returns text with every LinkedIn URL cleaned, or the same instance when nothing changed. */
    static String clean(String text) {
        if (text == null || !text.contains("http")) return text;
        Matcher matcher = URL.matcher(text);
        StringBuilder out = null;
        int last = 0;
        while (matcher.find()) {
            String url = matcher.group();
            String cleaned = cleanUrl(url);
            if (cleaned.equals(url)) continue;
            if (out == null) out = new StringBuilder(text.length());
            out.append(text, last, matcher.start()).append(cleaned);
            last = matcher.end();
        }
        if (out == null) return text;
        out.append(text, last, text.length());
        return out.toString();
    }

    static String cleanUrl(String url) {
        int schemeEnd = url.indexOf("://");
        int hostStart = schemeEnd + 3;
        int pathStart = indexOfAny(url, hostStart, '/', '?', '#');
        String host = url.substring(hostStart, pathStart < 0 ? url.length() : pathStart).toLowerCase(Locale.ROOT);
        if (!(host.equals("linkedin.com") || host.endsWith(".linkedin.com") || host.equals("lnkd.in"))) return url;

        int query = url.indexOf('?', hostStart);
        if (query < 0) return url;
        int fragment = url.indexOf('#', query);
        String base = url.substring(0, query);
        String params = url.substring(query + 1, fragment < 0 ? url.length() : fragment);
        String tail = fragment < 0 ? "" : url.substring(fragment);

        StringBuilder kept = new StringBuilder();
        for (String param : params.split("&")) {
            if (param.isEmpty()) continue;
            int eq = param.indexOf('=');
            String key = (eq < 0 ? param : param.substring(0, eq)).toLowerCase(Locale.ROOT);
            if (TRACKING_PARAMS.contains(key)) continue;
            if (kept.length() > 0) kept.append('&');
            kept.append(param);
        }
        return kept.length() == 0 ? base + tail : base + "?" + kept + tail;
    }

    private static int indexOfAny(String s, int from, char... chars) {
        for (int i = from; i < s.length(); i++) {
            for (char c : chars) if (s.charAt(i) == c) return i;
        }
        return -1;
    }
}
