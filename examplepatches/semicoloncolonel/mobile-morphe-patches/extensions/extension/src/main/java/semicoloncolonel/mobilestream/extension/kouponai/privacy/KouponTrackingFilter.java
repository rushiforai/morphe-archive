package semicoloncolonel.mobilestream.extension.kouponai.privacy;

import android.util.Log;

import java.net.URL;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import semicoloncolonel.mobilestream.extension.shared.privacy.TrackerBlocker;

/**
 * Koupon — "Block analytics & tracking" filter for the app's JavaScript requests.
 *
 * Each request from React Native's NetworkingModule passes through
 * {@link #filterJsRequestUrl(String)}. The shared {@link TrackerBlocker} list
 * goes first (AppsFlyer and the other SDK hosts). On top of it, two of Koupon's
 * own reports are dropped:
 *
 *   kpalb-*.elb.amazonaws.com   the recommendation service's user-profile
 *                               endpoint (/kouponai/rec_offline/...).
 *   /api/user/ad-linking        links the account to its ad and install
 *                               attribution.
 *
 * A blocked request goes to a closed local port, so the JavaScript gets its
 * usual network error. Deals, search, sign-in, rewards, and push are left alone.
 */
@SuppressWarnings("unused")
public final class KouponTrackingFilter {
    private static final String TAG = "MSP-PRIVACY";
    private static final String BLOCKED_URL = "http://127.0.0.1:9/";

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private KouponTrackingFilter() {
    }

    static boolean isKouponReport(URL url) {
        String host = url.getHost() == null ? "" : url.getHost().toLowerCase();
        String path = url.getPath() == null ? "" : url.getPath();
        if (host.startsWith("kpalb-") && host.endsWith(".elb.amazonaws.com")) {
            return true;
        }
        return (host.equals("koupon.ai") || host.endsWith(".koupon.ai")) && path.contains("/user/ad-linking");
    }

    public static String filterJsRequestUrl(String url) {
        String filtered = TrackerBlocker.filterJsRequestUrl(url);
        if (filtered != null && !filtered.equals(url)) {
            return filtered;
        }
        try {
            if (url != null) {
                URL parsed = new URL(url);
                if (isKouponReport(parsed)) {
                    if (logged.add(parsed.getHost() + parsed.getPath())) {
                        Log.i(TAG, "blocked Koupon report -> " + parsed.getHost() + parsed.getPath());
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
            if (url != null && !url.toString().equals(filterJsRequestUrl(url.toString()))) {
                return new URL(BLOCKED_URL);
            }
        } catch (Throwable ignored) {
            // Leave the request as it is.
        }
        return url;
    }
}
