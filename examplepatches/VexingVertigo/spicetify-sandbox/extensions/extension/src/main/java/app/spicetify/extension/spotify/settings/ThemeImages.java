package app.spicetify.extension.spotify.settings;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Deque;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Finds the background image a Marketplace theme shows on desktop: the default image of a
 * Galaxy-style script, or a raster image its CSS draws behind Spotify's whole window.
 */
final class ThemeImages {
    /** Galaxy writes {@code const defImage = `https://...`;}, Hazy the same with double quotes. */
    private static final Pattern DEF_IMAGE = Pattern.compile("\\bdefImage\\s*=\\s*[\"'`](https?://[^\"'`\\s]+)[\"'`]");
    /** Where the custom properties a var(--x) background can name are read from. */
    private static final Pattern ROOT = Pattern.compile(":root");
    /** Elements that fill Spotify's window, and their pseudo-elements. */
    private static final Pattern WINDOW =
            Pattern.compile("(\\.Root__top-container|\\.Root__main-view|\\.Root|body|html)(::?before|::?after)?");
    /** A url(...), double-quoted, single-quoted or bare, or a var(--x). */
    private static final Pattern URL_OR_VAR =
            Pattern.compile("url\\(\\s*(?:\"([^\"]*)\"|'([^']*)'|([^\"')\\s]*))\\s*\\)|var\\(\\s*(--[\\w-]+)");
    /** Only raster images count, so SVG noise overlays don't. */
    private static final Pattern RASTER_DATA = Pattern.compile("data:image/(png|jpe?g|gif|webp);base64,");
    private static final Pattern RASTER_URL = Pattern.compile("https?://[^?#]*\\.(?i:png|jpe?g|gif|webp)([?#].*)?");

    private ThemeImages() {}

    /** The default image a Galaxy-style script sets, or null. */
    static String fromJs(String js) {
        Matcher match = DEF_IMAGE.matcher(js);
        return match.find() && RASTER_URL.matcher(match.group(1)).matches() ? match.group(1) : null;
    }

    /**
     * The first raster image a background declaration on {@link #WINDOW} names, directly or through
     * a {@code :root} custom property, resolved against {@code cssUrl}; a data URI or an http(s) URL,
     * or null when there's none.
     */
    static String fromCss(String css, String cssUrl) {
        String text = withoutComments(css);
        Map<String, String> variables = new HashMap<>();
        List<String> backgrounds = new ArrayList<>();
        Deque<String> selectors = new ArrayDeque<>();
        int start = 0;
        int parens = 0;
        char quote = 0;
        // Splits blocks and declarations at braces and semicolons outside quotes and parentheses,
        // since a data URI holds a semicolon.
        for (int i = 0; i < text.length(); i++) {
            char c = text.charAt(i);
            if (quote != 0) {
                if (c == '\\') {
                    i++;
                } else if (c == quote || c == '\n') {
                    quote = 0;
                }
            } else if (c == '"' || c == '\'') {
                quote = c;
            } else if (c == '(') {
                parens++;
            } else if (c == ')') {
                parens = Math.max(0, parens - 1);
            } else if (parens == 0 && (c == '{' || c == ';' || c == '}')) {
                String segment = text.substring(start, i);
                start = i + 1;
                if (c == '{') {
                    selectors.push(segment);
                    continue;
                }
                int colon = segment.indexOf(':');
                String selector = selectors.peek();
                if (colon > 0 && selector != null) {
                    String property = segment.substring(0, colon).trim();
                    String value = segment.substring(colon + 1);
                    if (property.startsWith("--") && hasPart(selector, ROOT)) {
                        String url = firstUrl(value, Collections.emptyMap());
                        if (url != null) variables.put(property, url);
                    } else if ((property.equals("background") || property.equals("background-image"))
                            && hasPart(selector, WINDOW)) {
                        backgrounds.add(value);
                    }
                }
                if (c == '}') selectors.poll();
            }
        }
        for (String value : backgrounds) {
            String url = firstUrl(value, variables);
            if (url == null) continue;
            if (RASTER_DATA.matcher(url).lookingAt()) return url;
            String absolute = resolve(cssUrl, url);
            if (absolute != null && RASTER_URL.matcher(absolute).matches()) return absolute;
        }
        return null;
    }

    private static String withoutComments(String css) {
        StringBuilder text = new StringBuilder(css.length());
        int end = 0;
        for (int start; (start = css.indexOf("/*", end)) >= 0; ) {
            text.append(css, end, start);
            int close = css.indexOf("*/", start + 2);
            end = close < 0 ? css.length() : close + 2;
        }
        return text.append(css, end, css.length()).toString();
    }

    /** Whether one selector of a comma-separated list is exactly what {@code selector} matches. */
    private static boolean hasPart(String selectors, Pattern selector) {
        for (String part : selectors.split(",")) {
            if (selector.matcher(part.trim()).matches()) return true;
        }
        return false;
    }

    /** The first url(...) in a CSS value, or the url of the first var(--x) that {@code variables} has. */
    private static String firstUrl(String value, Map<String, String> variables) {
        Matcher match = URL_OR_VAR.matcher(value);
        while (match.find()) {
            String variable = match.group(4);
            if (variable == null) {
                return match.group(1) != null ? match.group(1) : match.group(2) != null ? match.group(2) : match.group(3);
            }
            if (variables.containsKey(variable)) return variables.get(variable);
        }
        return null;
    }

    /** {@code url} resolved against {@code base}, or null when either isn't a URI. */
    private static String resolve(String base, String url) {
        try {
            return new URI(base).resolve(new URI(url)).toString();
        } catch (URISyntaxException e) {
            return null;
        }
    }
}
