package app.afterglow.extension.navigation;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Locale;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Link rules of the iOS ytagSanitizedOpenURL (YTAfterglow.x:772-813), as plain string code
 * with no Android types, so it runs in JVM tests.
 *
 * <ul>
 *   <li>noLinkTracking: a Google redirect ({@code google.com/url?q=...} or {@code ?url=...})
 *       opens its target. Android YouTube sends its outgoing links through its own
 *       {@code youtube.com/redirect?q=...}, which is unwrapped the same way.</li>
 *   <li>noShareChunk: the {@code si} share identifier is dropped from youtube.com and
 *       youtu.be links; every other parameter stays, in order.</li>
 * </ul>
 */
public final class LinkCleaner {
    /** A link inside free text, without trailing punctuation (share texts end links with "." etc.). */
    private static final Pattern LINK = Pattern.compile("https?://\\S+(?<![.!?,;:)\\]-])");

    /** Guard against redirects that point at redirects forever. */
    private static final int MAX_REDIRECTS = 4;

    private LinkCleaner() {}

    /**
     * The target of a Google or YouTube redirect link, or {@code url} itself when it is not one.
     * Like iOS, the target is cleaned again, so a redirect to a redirect is unwrapped too.
     */
    public static String unwrapRedirect(String url) {
        String current = url;
        for (int i = 0; i < MAX_REDIRECTS && current != null; i++) {
            String target = redirectTarget(current);
            if (target == null) return current;
            current = target;
        }
        return current;
    }

    /** Removes the {@code si} parameter from every YouTube link in {@code text}. */
    public static String removeShareIdentifier(String text) {
        if (text == null || text.indexOf("si=") < 0) return text;
        Matcher matcher = LINK.matcher(text);
        StringBuilder out = null;
        int last = 0;
        while (matcher.find()) {
            String link = matcher.group();
            String clean = removeShareIdentifierFromLink(link);
            if (clean.equals(link)) continue;
            if (out == null) out = new StringBuilder(text.length());
            out.append(text, last, matcher.start()).append(clean);
            last = matcher.end();
        }
        if (out == null) return text;
        return out.append(text, last, text.length()).toString();
    }

    /** {@link #removeShareIdentifier} for one link. */
    static String removeShareIdentifierFromLink(String link) {
        ParsedLink parsed = ParsedLink.parse(link);
        if (parsed == null || parsed.query == null || !isYouTubeHost(parsed.host)) return link;
        StringBuilder query = new StringBuilder();
        boolean removed = false;
        for (String pair : parsed.query.split("&", -1)) {
            String name = pair.indexOf('=') >= 0 ? pair.substring(0, pair.indexOf('=')) : pair;
            if (name.equals("si")) {
                removed = true;
                continue;
            }
            if (pair.isEmpty()) continue;
            if (query.length() > 0) query.append('&');
            query.append(pair);
        }
        if (!removed) return link;
        return parsed.prefix + (query.length() > 0 ? "?" + query : "") + parsed.fragment;
    }

    private static String redirectTarget(String url) {
        ParsedLink parsed = ParsedLink.parse(url);
        if (parsed == null || parsed.query == null) return null;
        String host = parsed.host;
        String target;
        if (host.equals("www.google.com") || host.equals("google.com")) {
            // iOS reads q, then url, from any google.com link; only absolute links are followed,
            // so a search link (google.com/search?q=words) still opens as it is.
            target = queryValue(parsed.query, "q");
            if (!isAbsoluteWebLink(target)) target = queryValue(parsed.query, "url");
            return isAbsoluteWebLink(target) ? target : null;
        }
        if (isYouTubeHost(host) && "/redirect".equals(parsed.path)) {
            target = queryValue(parsed.query, "q");
            if (target == null || target.isEmpty()) return null;
            // Channel links can leave out the scheme (q=twitch.tv/name).
            return isAbsoluteWebLink(target) ? target : "http://" + target;
        }
        return null;
    }

    private static boolean isYouTubeHost(String host) {
        return host.equals("youtu.be") || host.equals("youtube.com") || host.endsWith(".youtube.com");
    }

    private static boolean isAbsoluteWebLink(String value) {
        if (value == null) return false;
        String lower = value.toLowerCase(Locale.ROOT);
        if (lower.startsWith("https://")) return lower.length() > "https://".length();
        if (lower.startsWith("http://")) return lower.length() > "http://".length();
        return false;
    }

    /** The decoded value of the first non-empty {@code name} parameter, or null. */
    static String queryValue(String query, String name) {
        for (String pair : query.split("&")) {
            int equals = pair.indexOf('=');
            if (equals <= 0 || !pair.substring(0, equals).equals(name)) continue;
            String value = decode(pair.substring(equals + 1));
            if (value != null && !value.isEmpty()) return value;
        }
        return null;
    }

    private static String decode(String value) {
        try {
            return URLDecoder.decode(value, "UTF-8");
        } catch (UnsupportedEncodingException | IllegalArgumentException error) {
            return null;
        }
    }

    /** A link split into what comes before the query, the query and the fragment. */
    private static final class ParsedLink {
        final String prefix;
        final String host;
        final String path;
        final String query;
        final String fragment;

        private ParsedLink(String prefix, String host, String path, String query, String fragment) {
            this.prefix = prefix;
            this.host = host;
            this.path = path;
            this.query = query;
            this.fragment = fragment;
        }

        static ParsedLink parse(String link) {
            if (link == null) return null;
            int scheme = link.indexOf("://");
            if (scheme <= 0) return null;
            String rest = link;
            String fragment = "";
            int hash = rest.indexOf('#');
            if (hash >= 0) {
                fragment = rest.substring(hash);
                rest = rest.substring(0, hash);
            }
            String query = null;
            int question = rest.indexOf('?');
            if (question >= 0) {
                query = rest.substring(question + 1);
                rest = rest.substring(0, question);
            }
            int hostStart = scheme + 3;
            int pathStart = rest.indexOf('/', hostStart);
            String authority = pathStart >= 0 ? rest.substring(hostStart, pathStart) : rest.substring(hostStart);
            String path = pathStart >= 0 ? rest.substring(pathStart) : "";
            int at = authority.lastIndexOf('@');
            if (at >= 0) authority = authority.substring(at + 1);
            int colon = authority.indexOf(':');
            String host = (colon >= 0 ? authority.substring(0, colon) : authority).toLowerCase(Locale.ROOT);
            if (host.isEmpty()) return null;
            return new ParsedLink(rest, host, path, query, fragment);
        }
    }
}
