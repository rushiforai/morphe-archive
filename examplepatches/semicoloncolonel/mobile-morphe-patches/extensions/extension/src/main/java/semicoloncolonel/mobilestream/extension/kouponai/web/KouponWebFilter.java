package semicoloncolonel.mobilestream.extension.kouponai.web;

import android.net.Uri;
import android.util.Log;
import android.webkit.WebView;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;

import java.io.ByteArrayInputStream;
import java.nio.charset.StandardCharsets;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import semicoloncolonel.mobilestream.extension.shared.privacy.TrackerBlocker;

/**
 * Koupon: filter for the requests made by the app's web pages.
 *
 * A deal page in Koupon 3.1.6 is a web page (cross-end.koupon.ai/product/detail)
 * in React Native's web view, with the account's Firebase UID in its URL. The
 * page's own requests never reach React Native's networking, so the web view
 * client gets a shouldInterceptRequest that asks {@link #intercept} first.
 *
 * Four switches, each turned on by its own patch (their bodies are replaced
 * to return true):
 *
 *   {@link #blockTrackers()}   the shared tracker list, and Intercom's
 *                              messenger metrics.
 *   {@link #stopHistory()}     POST /api/browse-history/add-history, which
 *                              records each deal you open, with its categories
 *                              and title keywords, for your History and for
 *                              personalized ranking; and /api/recommend/...,
 *                              the page's personalized "Similar items".
 *   {@link #hideAi()}          /api/deal/ai-evaluation and
 *                              /api/deal/ai-evaluation-enabled, the AI
 *                              evaluation section of a deal page.
 *   {@link #hideTips()}        the deal page's GET /api/notification/status
 *                              ?id=app-walkthrough. Its answer decides whether
 *                              the page shows the "New to using promo codes on
 *                              Amazon?" and copy-code tips; when it fails, the
 *                              page shows neither. Only cross-end.koupon.ai is
 *                              filtered, so the app's own screens are not
 *                              affected.
 *
 * The client's onPageFinished and doUpdateVisitedHistory also call
 * {@link #onPage}. When {@link #showCodes()} is on ("Show promo codes"), that
 * adds a style rule to Koupon's pages: the deal page's Copy code button keeps
 * "Copy code" on its left half, and the promo code, which the page already
 * holds under the button, shows in full on the right.
 *
 * A blocked request gets an empty 404, which the page treats like a failed
 * request. Everything is decided on the device.
 */
@SuppressWarnings("unused")
public final class KouponWebFilter {
    private static final String TAG = "MSP-KOUPON";

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private KouponWebFilter() {
    }

    /** Overwritten to return true by "Block analytics & tracking". */
    public static boolean blockTrackers() {
        return false;
    }

    /** Overwritten to return true by "Stop behavioral tracking". */
    public static boolean stopHistory() {
        return false;
    }

    /** Overwritten to return true by "Disable AI". */
    public static boolean hideAi() {
        return false;
    }

    /** Overwritten to return true by "Hide pop-ups". */
    public static boolean hideTips() {
        return false;
    }

    /** Overwritten to return true by "Show promo codes". */
    public static boolean showCodes() {
        return false;
    }

    /** The Copy code button's own rules, with the dark panel cut to half width and its peel removed. */
    private static final String CODE_STYLE =
            ".kp-promoCode .copyButton-content{min-width:0 !important;width:50% !important;right:auto !important;"
                    + "clip-path:none !important;padding:6px !important}"
                    + ".kp-promoCode .copyButton-content::after{display:none !important}"
                    + ".kp-promoCode .copyButton-content .text,.kp-promoCode .copyButton-content .subtitle"
                    + "{white-space:nowrap;padding-right:0 !important;text-align:center}"
                    + ".kp-promoCode .code{box-sizing:border-box;padding-left:50% !important;"
                    + "justify-content:center !important}";

    private static final String SHOW_CODES_SCRIPT =
            "(function(){if(document.getElementById('msp-show-codes'))return;"
                    + "var s=document.createElement('style');s.id='msp-show-codes';s.textContent='" + CODE_STYLE + "';"
                    + "(document.head||document.documentElement).appendChild(s);})();";

    /** Called from the web view client's onPageFinished and doUpdateVisitedHistory. */
    public static void onPage(WebView view, String url) {
        try {
            if (!showCodes() || view == null || url == null) return;
            String host = Uri.parse(url).getHost();
            if (host == null || !isKoupon(host.toLowerCase())) return;
            view.evaluateJavascript(SHOW_CODES_SCRIPT, null);
        } catch (Throwable t) {
            Log.w(TAG, "could not show promo codes", t);
        }
    }

    private static boolean isKoupon(String host) {
        return host.equals("koupon.ai") || host.endsWith(".koupon.ai");
    }

    private static String reason(String host, String path, String query) {
        if (blockTrackers()) {
            if (TrackerBlocker.isBlocked(host, path)) return "tracker";
            if (host.endsWith("intercom.io") && path.startsWith("/messenger/web/metrics")) return "tracker";
        }
        if (isKoupon(host)) {
            if (stopHistory() && path.contains("/browse-history/")) return "history";
            if (stopHistory() && path.contains("/recommend")) return "recommendation";
            if (hideAi() && path.contains("/deal/ai-evaluation")) return "AI";
        }
        if (hideTips() && host.equals("cross-end.koupon.ai") && path.endsWith("/notification/status")
                && "app-walkthrough".equals(query)) {
            return "tip";
        }
        return null;
    }

    /** Called from the web view client's added shouldInterceptRequest. */
    public static WebResourceResponse intercept(WebResourceRequest request) {
        try {
            if (request == null || request.getUrl() == null) return null;
            Uri url = request.getUrl();
            String host = url.getHost() == null ? "" : url.getHost().toLowerCase();
            String path = url.getPath() == null ? "" : url.getPath();
            String reason = reason(host, path, url.getQueryParameter("id"));
            if (reason == null) return null;
            if (logged.add(host + path)) {
                Log.i(TAG, "blocked " + reason + " request -> " + host + path);
            }
            return new WebResourceResponse("application/json", StandardCharsets.UTF_8.name(), 404, "Not Found",
                    Collections.singletonMap("Access-Control-Allow-Origin", "*"),
                    new ByteArrayInputStream(new byte[0]));
        } catch (Throwable t) {
            return null;
        }
    }
}
