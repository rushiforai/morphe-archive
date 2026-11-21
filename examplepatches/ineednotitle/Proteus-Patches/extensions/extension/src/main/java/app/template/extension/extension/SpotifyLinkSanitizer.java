package app.template.extension.extension;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Removes the {@code si} and {@code utm_source} tracking parameters from
 * shared and copied links.
 *
 * Parameter names ending with {@code *} are treated as prefixes; matching is
 * case-insensitive. Other query parameters, their order and the fragment are
 * kept, and untouched URLs keep their exact original string.
 */
@SuppressWarnings("unused")
public final class SpotifyLinkSanitizer {
    private static final Pattern URL = Pattern.compile("https?://\\S+", Pattern.CASE_INSENSITIVE);
    private static final SpotifyLinkSanitizer SANITIZER = new SpotifyLinkSanitizer("si", "utm_source");

    private final String[] exactNames;
    private final String[] prefixes;

    SpotifyLinkSanitizer(String... parameters) {
        int prefixCount = 0;
        for (String parameter : parameters) {
            if (parameter.endsWith("*")) prefixCount++;
        }
        exactNames = new String[parameters.length - prefixCount];
        prefixes = new String[prefixCount];
        int e = 0, p = 0;
        for (String parameter : parameters) {
            String name = parameter.toLowerCase(Locale.ROOT);
            if (name.endsWith("*")) {
                prefixes[p++] = name.substring(0, name.length() - 1);
            } else {
                exactNames[e++] = name;
            }
        }
    }

    private boolean isTracking(String parameter) {
        int equals = parameter.indexOf('=');
        String name = (equals < 0 ? parameter : parameter.substring(0, equals)).toLowerCase(Locale.ROOT);
        for (String exact : exactNames) {
            if (name.equals(exact)) return true;
        }
        for (String prefix : prefixes) {
            if (name.startsWith(prefix)) return true;
        }
        return false;
    }

    /**
     * Injection point: url parameter of the share sheet url formatter.
     *
     * @return The url without tracking parameters, or the original url if
     * nothing was removed.
     */
    public static String sanitizeUrl(String url) {
        return SANITIZER.stripTracking(url);
    }

    /**
     * Injection point: text of the clip copied by "Copy link".
     */
    public static String sanitizeText(String text) {
        return SANITIZER.stripTrackingInText(text);
    }

    public static CharSequence sanitizeText(CharSequence text) {
        if (text == null) return null;
        String original = text.toString();
        String sanitized = sanitizeText(original);
        return sanitized.equals(original) ? text : sanitized;
    }

    String stripTracking(String url) {
        if (url == null) return null;

        int queryStart = url.indexOf('?');
        if (queryStart < 0) return url;

        int fragmentStart = url.indexOf('#', queryStart);
        if (fragmentStart < 0) fragmentStart = url.length();

        StringBuilder query = new StringBuilder();
        boolean removed = false;
        for (String parameter : url.substring(queryStart + 1, fragmentStart).split("[&?]")) {
            if (parameter.isEmpty()) continue;
            if (isTracking(parameter)) {
                removed = true;
                continue;
            }
            if (query.length() > 0) query.append('&');
            query.append(parameter);
        }
        if (!removed) return url;

        StringBuilder result = new StringBuilder(url.length());
        result.append(url, 0, queryStart);
        if (query.length() > 0) result.append('?').append(query);
        result.append(url, fragmentStart, url.length());
        return result.toString();
    }

    /**
     * Sanitizes every http(s) URL found in a text, such as a share message.
     */
    String stripTrackingInText(String text) {
        if (text == null || text.indexOf("://") < 0) return text;

        Matcher matcher = URL.matcher(text);
        StringBuffer result = new StringBuffer(text.length());
        while (matcher.find()) {
            matcher.appendReplacement(result, Matcher.quoteReplacement(stripTracking(matcher.group())));
        }
        matcher.appendTail(result);
        return result.toString();
    }
}
