package app.fakh.extension.kompas;

import android.webkit.WebView;
import android.webkit.WebViewClient;

/**
 * The ad filter for the kompas.com pages the app opens in a WebView (such as Harga Emas from Living Assistance), with the
 * site's sticky banner at the top, the fixed one at the bottom and the in-page boxes.
 */
@SuppressWarnings("unused")
public final class WebAds {
    private static final String AD_SLOTS = ",#js-banner-sticky,.boxBanner1,.banner1,.banner-300,.banner-row-15,"
            + "#sticky-mobile-r,#smartbanner,.pushdown-banner,.ads-parallax-expand,.banner-sticky-holder,.mostItem.ads";

    private WebAds() {
    }

    /** Called instead of the screen's setWebViewClient: wraps the app's client with the ad filter. */
    public static void setClient(WebView webView, WebViewClient client) {
        app.fakh.extension.shared.WebAds.setClient(webView, client, AD_SLOTS, "");
    }
}
