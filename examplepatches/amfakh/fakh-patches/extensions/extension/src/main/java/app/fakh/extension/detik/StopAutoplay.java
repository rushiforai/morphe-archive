package app.fakh.extension.detik;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Stops the 20detik players embedded in articles, videos and live streams, from starting on their own. The player page
 * turns its smart autoplay off when its URL carries smartautoplay=false, so each player URL in the article body gets it.
 */
@SuppressWarnings("unused")
public final class StopAutoplay {
    private static final Pattern EMBED = Pattern.compile("//(?:20|tv)\\.detik\\.com/(?:20detik/)?(?:embed|watch)/[^\"'\\s<>]*");

    private StopAutoplay() {
    }

    /** Called with the article body the app is about to render: returns it with every player URL rewritten. */
    public static String content(String body) {
        if (body == null) return null;
        Matcher matcher = EMBED.matcher(body);
        StringBuffer result = new StringBuffer();
        while (matcher.find()) {
            String url = matcher.group();
            url = url.contains("smartautoplay=")
                    ? url.replaceAll("smartautoplay=[^&]*", "smartautoplay=false")
                    : url + (url.indexOf('?') < 0 ? "?" : "&") + "smartautoplay=false";
            matcher.appendReplacement(result, Matcher.quoteReplacement(url));
        }
        matcher.appendTail(result);
        return result.toString();
    }
}
