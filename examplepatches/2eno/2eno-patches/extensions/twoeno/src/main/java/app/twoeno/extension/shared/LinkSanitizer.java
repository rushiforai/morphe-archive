package app.twoeno.extension.shared;

import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Removes tracking query parameters from URLs.
 * <p>
 * Parameter names ending with {@code *} are treated as prefixes, e.g. {@code utm_*}.
 * Matching is case-insensitive. Other query parameters, their order and the fragment are kept.
 */
public final class LinkSanitizer {
    private static final Pattern URL = Pattern.compile("https?://\\S+", Pattern.CASE_INSENSITIVE);

    private final String[] exactNames;
    private final String[] prefixes;

    public LinkSanitizer(String... parameters) {
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
     * @return The url without tracking parameters, or the original url if nothing was removed.
     */
    public String sanitizeUrl(String url) {
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
    public String sanitizeText(String text) {
        if (text == null || text.indexOf("://") < 0) return text;

        Matcher matcher = URL.matcher(text);
        StringBuffer result = new StringBuffer(text.length());
        while (matcher.find()) {
            matcher.appendReplacement(result, Matcher.quoteReplacement(sanitizeUrl(matcher.group())));
        }
        matcher.appendTail(result);
        return result.toString();
    }

    /**
     * Same as {@link #sanitizeText(String)}, but keeps the original instance if nothing changed.
     */
    public CharSequence sanitizeText(CharSequence text) {
        if (text == null) return null;
        String original = text.toString();
        String sanitized = sanitizeText(original);
        return sanitized.equals(original) ? text : sanitized;
    }
}
