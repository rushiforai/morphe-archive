package semicoloncolonel.mobilestream.extension.kouponai.privacy;

import android.util.Log;

import java.net.URL;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * Koupon — "Stop behavioral tracking" filter for the app's own JavaScript
 * requests (React Native's NetworkingModule).
 *
 * The app asks POST /api/recommend for its "You might also like" lists (the
 * History screen and others), with the account ID in the request headers. The
 * server builds those lists from the account's recorded browsing. Dropping the
 * request stops that personalization; the lists come back empty.
 *
 * The deal pages' own recording and recommendation requests are handled in
 * the web view by KouponWebFilter.
 */
@SuppressWarnings("unused")
public final class KouponBehaviorFilter {
    private static final String TAG = "MSP-PRIVACY";
    private static final String BLOCKED_URL = "http://127.0.0.1:9/";

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private KouponBehaviorFilter() {
    }

    static boolean isRecommendation(URL url) {
        String host = url.getHost() == null ? "" : url.getHost().toLowerCase();
        String path = url.getPath() == null ? "" : url.getPath();
        return (host.equals("koupon.ai") || host.endsWith(".koupon.ai")) && path.contains("/recommend");
    }

    public static String filterJsRequestUrl(String url) {
        try {
            if (url != null) {
                URL parsed = new URL(url);
                if (isRecommendation(parsed)) {
                    if (logged.add(parsed.getPath())) {
                        Log.i(TAG, "blocked Koupon recommendations -> " + parsed.getHost() + parsed.getPath());
                    }
                    return BLOCKED_URL;
                }
            }
        } catch (Throwable ignored) {
            // Not an http(s) URL: React Native handles those itself.
        }
        return url;
    }

    /** expo/fetch is not in this app; kept for the shared hook's signature. */
    public static URL filterJsRequestUrl(URL url) {
        try {
            if (url != null && isRecommendation(url)) {
                return new URL(BLOCKED_URL);
            }
        } catch (Throwable ignored) {
            // Leave the request as it is.
        }
        return url;
    }
}
