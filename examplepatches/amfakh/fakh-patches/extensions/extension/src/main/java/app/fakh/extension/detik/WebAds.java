package app.fakh.extension.detik;

import android.webkit.WebView;
import android.webkit.WebViewClient;

/** The ad filter for the detik.com pages the app shows. Milidetik builds its ad cards from an #ads-template element. */
@SuppressWarnings("unused")
public final class WebAds {
    private WebAds() {
    }

    /** Called instead of the screen's setWebViewClient: wraps the app's client with the ad filter. */
    public static void setClient(WebView webView, WebViewClient client) {
        app.fakh.extension.shared.WebAds.setClient(webView, client, ",.holding-ads",
                "(function(){var t=document.getElementById('ads-template');if(t)t.innerHTML='';})();");
    }
}
