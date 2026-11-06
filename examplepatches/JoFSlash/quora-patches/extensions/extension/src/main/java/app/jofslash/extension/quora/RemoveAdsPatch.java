package app.jofslash.extension.quora;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;

import java.io.ByteArrayInputStream;

@SuppressWarnings("unused")
public final class RemoveAdsPatch {

    private static final String TAG = "JoFSlashPatches";

    /**
     * Ad elements on quora.com. Taken from the EasyList and uBlock Origin rules for Quora,
     * keeping only the selectors that use Quora's stable class names.
     */
    private static final String AD_SELECTORS = String.join(",",
            "[class*=\"dom_annotate_ad_\"]",
            ".dom_annotate_multifeed_bundle_AdBundle",
            ".dom_annotate_google_ad",
            ".spacing_log_question_page_ad",
            ".AdBundle",
            ".AdStory",
            ".q-sticky:has(.dom_annotate_google_ad)",
            "[class^=\"q-box dom_annotate_question_answer_item_\"] .qu-borderTop:has(.dom_annotate_google_ad)"
    );

    private static final String STYLE_ID = "jofslash-remove-ads";

    // Adds the stylesheet once per document. The style also applies to content Quora loads later,
    // such as more feed items while scrolling.
    private static final String INJECT_SCRIPT = "(function(){"
            + "if(document.getElementById('" + STYLE_ID + "'))return;"
            + "var s=document.createElement('style');"
            + "s.id='" + STYLE_ID + "';"
            + "s.textContent='" + AD_SELECTORS.replace("'", "\\'")
            + "{display:none !important;}';"
            + "(document.head||document.documentElement).appendChild(s);"
            + "})();";

    private static final String[] AD_HOSTS = {
            "doubleclick.net",
            "googlesyndication.com",
            "googleadservices.com",
            "googletagservices.com",
            "adservice.google.com",
            "imasdk.googleapis.com",
            "amazon-adsystem.com",
            "adnxs.com",
            "adsrvr.org",
            "criteo.com",
            "criteo.net",
            "pubmatic.com",
            "rubiconproject.com",
            "openx.net",
            "casalemedia.com",
            "indexww.com",
            "3lift.com",
            "sharethrough.com",
            "taboola.com",
            "outbrain.com",
            "moatads.com",
            "scorecardresearch.com",
    };

    /**
     * Injection point: start of QWebViewClient.onPageFinished.
     */
    public static void onPageFinished(WebView webView) {
        if (webView == null) return;
        try {
            webView.evaluateJavascript(INJECT_SCRIPT, null);
        } catch (Exception ex) {
            Log.e(TAG, "Failed to inject ad stylesheet", ex);
        }
    }

    /**
     * Injection point: start of QWebViewClient.shouldInterceptRequest.
     *
     * @return An empty response for ad requests, or null to load the request normally.
     */
    public static WebResourceResponse blockAdRequest(WebResourceRequest request) {
        try {
            if (request == null || request.isForMainFrame()) return null;
            if (!isAdUrl(request.getUrl())) return null;
            return new WebResourceResponse("text/plain", "utf-8", new ByteArrayInputStream(new byte[0]));
        } catch (Exception ex) {
            Log.e(TAG, "Failed to check request", ex);
            return null;
        }
    }

    private static boolean isAdUrl(Uri uri) {
        if (uri == null) return false;
        String host = uri.getHost();
        if (host == null) return false;
        host = host.toLowerCase();

        for (String adHost : AD_HOSTS) {
            if (host.equals(adHost) || host.endsWith("." + adHost)) return true;
        }

        String path = uri.getPath();
        return (host.equals("quora.com") || host.endsWith(".quora.com"))
                && path != null && path.startsWith("/ads/");
    }
}
