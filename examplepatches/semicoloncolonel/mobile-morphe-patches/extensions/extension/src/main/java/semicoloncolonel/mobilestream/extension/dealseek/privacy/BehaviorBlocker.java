package semicoloncolonel.mobilestream.extension.dealseek.privacy;

import android.util.Log;

import java.net.URL;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * DealSeek — "Stop behavioral tracking" (opt-in) runtime filter.
 *
 * DealSeek reports what you look at to its own backend, separately from the
 * third-party analytics that {@code TrackerBlocker} handles. The app queues
 * each deal you see ({@code queueSeenDeal}) and flushes those impressions
 * ({@code _flushSeenDealImpressions}), and it posts your clicks as deal
 * interactions. The server turns that stream into affinity/recommendation
 * models (the {@code *_affinity_lgbm_*} scores) and into your viewed-deal
 * history. Blocking the reporting stops the app learning from your behavior
 * and stops new history from accumulating server-side.
 *
 * These endpoints are first-party, on DealSeek's own API hosts, so they cannot
 * be blocked by host. Each request runs through the app's JavaScript, so it is
 * filtered by path at the same two seams as the analytics patch: Expo's
 * expo/fetch and React Native's NetworkingModule. A blocked request is swapped
 * for a closed local port, so the JavaScript gets its usual network error and
 * the reporting is simply dropped; the SDK is fire-and-forget, so playback and
 * browsing are unaffected.
 *
 * Not touched: the deal feed, deal detail, search, sign-in, images, support,
 * push, and the history/recently-viewed read endpoints (so the app's own
 * history screen still works and you can clear it there). This filter only
 * drops the outbound behavior reports.
 *
 * Everything is decided on-device; nothing is sent anywhere by this class.
 */
@SuppressWarnings("unused")
public final class BehaviorBlocker {
    private static final String TAG = "MSP-PRIVACY";

    /** A closed local port: a request sent here fails the way an offline one does. */
    private static final String BLOCKED_URL = "http://127.0.0.1:9/";

    /** DealSeek's own API hosts all end in this. */
    private static final String API_SUFFIX = "dealseek.com";

    /**
     * Path fragments of the first-party behavior reports. Matched as substrings
     * so a version prefix or query string does not matter:
     *   /deal-impressions/seen          deals you were shown
     *   /deal-impressions/search-depth   how far you scrolled a search
     *   /deal-interactions               deals you clicked
     */
    private static final String[] BLOCKED_PATHS = {
            "/deal-impressions",
            "/deal-interactions",
    };

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private BehaviorBlocker() {
    }

    private static boolean isBlocked(String host, String path) {
        if (host == null || path == null) {
            return false;
        }
        String h = host.toLowerCase();
        if (!(h.equals(API_SUFFIX) || h.endsWith("." + API_SUFFIX))) {
            return false;
        }
        for (String fragment : BLOCKED_PATHS) {
            if (path.contains(fragment)) {
                return true;
            }
        }
        return false;
    }

    private static boolean isBlockedJsRequest(URL url) {
        if (!isBlocked(url.getHost(), url.getPath())) {
            return false;
        }
        if (logged.add(url.getPath())) {
            Log.i(TAG, "blocked behavior report -> " + url.getPath());
        }
        return true;
    }

    /**
     * Called with the URL of each JavaScript request (React Native's
     * NetworkingModule). A blocked URL is swapped for {@link #BLOCKED_URL}.
     */
    public static String filterJsRequestUrl(String url) {
        try {
            if (url != null && isBlockedJsRequest(new URL(url))) {
                return BLOCKED_URL;
            }
        } catch (Throwable ignored) {
            // Not an http(s) URL (blob:, data:): React Native handles those itself.
        }
        return url;
    }

    /** {@link #filterJsRequestUrl(String)} for expo/fetch, which passes a java.net.URL. */
    public static URL filterJsRequestUrl(URL url) {
        try {
            if (url != null && isBlockedJsRequest(url)) {
                return new URL(BLOCKED_URL);
            }
        } catch (Throwable ignored) {
            // Leave the request as it is.
        }
        return url;
    }
}
