package semicoloncolonel.mobilestream.extension.whitehouse;

import android.util.Log;

import java.net.URL;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Locale;
import java.util.Set;

/**
 * "Hide social feeds" for the White House app.
 *
 * The app loads each social feed from whitehouse.gov's own API, under
 * /wp-json/whitehouse/v1/social/{feed}, plus the Wire from /wire and the
 * YouTube videos from /live, which the Live tab also shows. Requests for the feeds chosen in the
 * patch options are sent to an unreachable address instead, so the feed
 * never loads. Everything else passes through unchanged.
 */
@SuppressWarnings("unused")
public final class FeedFilter {
    private static final String TAG = "MSP-WH";
    private static final String API_PATH = "/wp-json/whitehouse/v1/";
    private static final String SOCIAL_PATH = API_PATH + "social/";
    private static final String BLOCKED_URL = "http://127.0.0.1:9/";

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());
    private static Set<String> hidden;

    private FeedFilter() {
    }

    /** The feeds to hide, comma-separated. The patch replaces this method's body. */
    private static String hiddenFeeds() {
        return "";
    }

    private static Set<String> hidden() {
        if (hidden == null) {
            hidden = new HashSet<>(Arrays.asList(hiddenFeeds().toLowerCase(Locale.US).split(",")));
        }
        return hidden;
    }

    private static boolean isHidden(String url) {
        if (url == null) {
            return false;
        }

        String feed;
        if (url.contains(API_PATH + "wire")) {
            feed = "wire";
        } else if (url.contains(API_PATH + "live")) {
            feed = "youtube"; // The YouTube tab and the Live tab's videos share this feed.
        } else {
            feed = socialFeed(url);
        }
        if (feed == null || !hidden().contains(feed)) {
            return false;
        }
        if (logged.add(feed)) {
            Log.i(TAG, "hid the " + feed + " feed");
        }
        return true;
    }

    private static String socialFeed(String url) {
        int index = url.indexOf(SOCIAL_PATH);
        if (index < 0) {
            return null;
        }
        String rest = url.substring(index + SOCIAL_PATH.length());
        int end = 0;
        while (end < rest.length() && Character.isLetterOrDigit(rest.charAt(end))) {
            end++;
        }
        return rest.substring(0, end).toLowerCase(Locale.US);
    }

    public static String filterJsRequestUrl(String url) {
        return isHidden(url) ? BLOCKED_URL : url;
    }

    public static URL filterJsRequestUrl(URL url) {
        try {
            return url != null && isHidden(url.toString()) ? new URL(BLOCKED_URL) : url;
        } catch (Exception e) {
            return url;
        }
    }
}
