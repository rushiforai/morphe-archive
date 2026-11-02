package semicoloncolonel.mobilestream.extension.shared.misc;

import android.util.Log;

/**
 * "Hide sponsored listings" for the shopping apps.
 *
 * Asks the store's own services for results without sponsored products, using the switches
 * those services already have. Everything is decided on-device; nothing is sent anywhere by
 * this class.
 */
@SuppressWarnings("unused")
public final class ShoppingAdsFilter {
    private static final String TAG = "MSP-ADS";

    private static boolean logged;

    private ShoppingAdsFilter() {
    }

    /**
     * Amazon draws search results and product pages as web pages. Sponsored products there are
     * marked by Amazon's own markup: the ad holder and sponsored-label classes in search
     * results, the sponsored-products and ad-placement sections on product pages, and the
     * ad frames used for sponsored brands and video.
     */
    private static final String[] AMAZON_SPONSORED = {
            // Search results
            ".s-result-item.AdHolder",
            ".s-result-item:has(.puis-sponsored-label-text)",
            ".s-result-item:has([data-component-type=\"sp-sponsored-result\"])",
            ".s-result-item:has(.sbv-ad-content-container)",
            ".s-result-item:has([data-ad-feedback])",
            ".sbv-video-single-product",
            // Product pages
            "#sponsoredProducts_feature_div",
            "#sponsoredProducts2_feature_div",
            "[id^=\"sp_detail\"]",
            ".sponsored-products-detail-mobile",
            "[cel_widget_id*=\"sp_atf\"]",
            "[cel_widget_id*=\"sp_btf\"]",
            "[cel_widget_id*=\"adplacements\"]",
            // Carousels and ad frames anywhere
            ".a-carousel-card:has(.p13n-sc-sponsored-label)",
            ".a-carousel-card:has([data-ad-placement-metadata])",
            "[data-ad-id]",
            ".amzn-safe-frame-container",
            "[id^=\"ape_\"]",
    };

    private static final String HIDE_AMAZON_SPONSORED = "(function () {\n"
            + "  if (document.getElementById('msp-hide-sponsored')) { return; }\n"
            + "  var style = document.createElement('style');\n"
            + "  style.id = 'msp-hide-sponsored';\n"
            + "  style.textContent = " + jsString(android.text.TextUtils.join(",", AMAZON_SPONSORED)) + "\n"
            + "    + '{display:none !important}';\n"
            + "  (document.head || document.documentElement).appendChild(style);\n"
            + "})();";

    private static String jsString(String value) {
        return "'" + value.replace("\\", "\\\\").replace("'", "\\'") + "'";
    }

    /** Amazon: hides sponsored products on the page the app's web view is showing. */
    public static void hideAmazonSponsored(android.webkit.WebView webView) {
        try {
            if (webView != null) {
                webView.evaluateJavascript(HIDE_AMAZON_SPONSORED, null);
            }
        } catch (Throwable t) {
            Log.w(TAG, "hide Amazon sponsored products failed: " + t);
        }
    }

    /**
     * Target: called with each search parameter's name and value as the request is built.
     * include_sponsored is answered with false; every other parameter keeps its value.
     */
    public static String targetSearchParameter(String name, String value) {
        if (!"include_sponsored".equals(name)) {
            return value;
        }
        if (!logged) {
            logged = true;
            Log.i(TAG, "search without sponsored products");
        }
        return "false";
    }
}
