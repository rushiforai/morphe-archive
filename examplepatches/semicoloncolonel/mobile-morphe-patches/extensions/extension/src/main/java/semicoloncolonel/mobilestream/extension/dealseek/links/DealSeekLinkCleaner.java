package semicoloncolonel.mobilestream.extension.dealseek.links;

import android.net.Uri;
import android.util.Log;

import java.util.Locale;

/**
 * DealSeek: opens deals at the store's own URL, without affiliate or tracking hops.
 *
 * DealSeek 1.64.0 opens a deal through one of two native calls, and both pass
 * the URL through {@link #clean} first:
 *
 *   IntentModule.openURL(url)  — React Native's Linking.openURL. Amazon, and
 *                                every store that goes through DealSeek's own
 *                                redirect (Walmart, eBay, Wayfair, Target).
 *   openBrowserAsync(url)      — expo-web-browser's custom tab. Best Buy.
 *
 * The link shapes, as captured on 1.64.0:
 *
 *   api.dealseek.com/deeplink/redirect?asin=…&platform=…&destination_url=…&posthog_user_id=…
 *       DealSeek logs the click with the user's PostHog ID, then redirects to
 *       an affiliate network (Sovrn for Wayfair, Impact for Walmart, an
 *       ncls1.com / affinity.net chain for Target). destination_url is the
 *       plain store URL. Walmart links carry only the item ID in asin.
 *   goto.walmart.com/c/…?u=…           Impact. u is the store URL.
 *   sovrn.co/?key=…&u=…                Sovrn. u is the store URL.
 *   ncls1.com/irk?…&d=…                d is the store URL.
 *   amazon.com/dp/…?…&tag=dealseekapp-20
 *       Opened in the Amazon app (com.amazon.mobile.shopping.web scheme).
 *       The Associates tag is dropped and the product parameters are kept.
 *   www.ojrq.net/p/?return=…  →  bestbuycreators.7tiv.net/c/…?u=…  →  bestbuy.com
 *       Best Buy, opened in a custom tab. return is the Impact link, whose u
 *       is the store URL.
 *
 * Any URL that does not match passes through unchanged. Everything is decided
 * on the device; this class makes no network requests.
 */
@SuppressWarnings("unused")
public final class DealSeekLinkCleaner {
    private static final String TAG = "MSP-DEALSEEK";

    /** Redirectors whose query names the destination: {host, parameter}. */
    private static final String[][] REDIRECTORS = {
            {"goto.walmart.com", "u"}, // Impact
            {"7tiv.net", "u"}, // Impact (Best Buy Creators)
            {"ojrq.net", "return"}, // Impact cookie sync in front of a 7tiv.net link
            {"sjv.io", "u"}, // Impact
            {"pxf.io", "u"}, // Impact
            {"sovrn.co", "u"}, // Sovrn Commerce
            {"redirect.viglink.com", "u"}, // Sovrn Commerce
            {"ncls1.com", "d"},
            {"go.skimresources.com", "url"}, // Skimlinks
    };

    /** Amazon Associates parameters, dropped on Amazon hosts only. */
    private static final String[] AMAZON_PARAMS = {
            "tag", "ascsubtag", "linkCode", "linkId", "creative", "creativeASIN", "camp",
    };

    /** Affiliate and tracking parameters dropped from every final store URL. */
    private static final String[] STRIPPED_PARAMS = {
            // Impact
            "irclickid", "irgwc", "clickid", "sharedid", "subId1", "subId2", "subId3",
            "veh", "affiliates_ad_id", "wmlspartner",
            // eBay Partner Network
            "mkcid", "mkrid", "mkevt", "campid", "toolid", "customid",
            // Rakuten and CJ
            "ranMID", "ranEAID", "ranSiteID", "cjevent",
    };

    private DealSeekLinkCleaner() {
    }

    /** Returns the URL to open in place of {@code url}. Never throws. */
    public static String clean(String url) {
        if (url == null || url.isEmpty()) {
            return url;
        }
        try {
            Uri cleaned = clean(Uri.parse(url), 0);
            String result = cleaned.toString();
            if (!result.equals(url)) {
                Log.i(TAG, "opening " + result + " instead of " + url);
            }
            return result;
        } catch (Throwable t) {
            Log.w(TAG, "clean failed: " + t);
            return url;
        }
    }

    /** Drop-in for Uri.parse(String) in expo-web-browser's openBrowserAsync. */
    public static Uri parse(String url) {
        return Uri.parse(clean(url));
    }

    private static Uri clean(Uri uri, int depth) {
        String host = uri.getHost();
        if (host == null || depth > 4) {
            return uri;
        }
        host = host.toLowerCase(Locale.US);

        if (host.equals("api.dealseek.com") && "/deeplink/redirect".equals(uri.getPath())) {
            Uri destination = dealSeekDestination(uri);
            return destination == null ? uri : clean(destination, depth + 1);
        }

        for (String[] redirector : REDIRECTORS) {
            if (!matches(host, redirector[0])) {
                continue;
            }
            String destination = query(uri, redirector[1]);
            if (destination == null) {
                Log.i(TAG, "redirector without a destination: " + uri);
                return uri;
            }
            return clean(Uri.parse(destination), depth + 1);
        }

        return stripParams(uri, host.equals("amazon.com") || host.contains(".amazon.")
                || host.startsWith("amazon."));
    }

    private static Uri dealSeekDestination(Uri uri) {
        String destination = query(uri, "destination_url");
        if (destination != null) {
            return Uri.parse(destination);
        }
        String asin = query(uri, "asin");
        if (asin != null && "walmart".equals(query(uri, "platform"))) {
            return Uri.parse("https://www.walmart.com/ip/" + Uri.encode(asin));
        }
        Log.i(TAG, "unknown DealSeek redirect: " + uri);
        return null;
    }

    private static Uri stripParams(Uri uri, boolean amazon) {
        if (uri.isOpaque() || uri.getEncodedQuery() == null) {
            return uri;
        }
        boolean changed = false;
        Uri.Builder builder = uri.buildUpon().clearQuery();
        for (String name : uri.getQueryParameterNames()) {
            if (isStripped(name) || (amazon && contains(AMAZON_PARAMS, name))) {
                changed = true;
                continue;
            }
            for (String value : uri.getQueryParameters(name)) {
                builder.appendQueryParameter(name, value);
            }
        }
        return changed ? builder.build() : uri;
    }

    private static boolean isStripped(String name) {
        if (name.startsWith("utm_")) {
            return true;
        }
        return contains(STRIPPED_PARAMS, name);
    }

    private static boolean contains(String[] names, String name) {
        for (String candidate : names) {
            if (candidate.equalsIgnoreCase(name)) {
                return true;
            }
        }
        return false;
    }

    private static String query(Uri uri, String name) {
        if (uri.isOpaque()) {
            return null;
        }
        String value = uri.getQueryParameter(name);
        return value == null || value.isEmpty() ? null : value;
    }

    private static boolean matches(String host, String domain) {
        return host.equals(domain) || host.endsWith("." + domain);
    }
}
