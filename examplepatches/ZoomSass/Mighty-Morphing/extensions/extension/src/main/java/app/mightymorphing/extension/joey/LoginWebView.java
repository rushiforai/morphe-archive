package app.mightymorphing.extension.joey;

import android.annotation.SuppressLint;
import android.webkit.WebSettings;
import android.webkit.WebView;

/**
 * Makes Reddit's login and authorize pages work in Joey's old login WebView.
 * Same idea as Patcheddit's "Modify login WebView" patch.
 */
@SuppressWarnings("unused")
public final class LoginWebView {
    private static final String CHROME_USER_AGENT =
            "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) "
                    + "Chrome/147.0.0.0 Mobile Safari/537.36";

    private static final String DISMISS_CONSENT =
            "(function(){var b=document.querySelector("
                    + "'#data-protection-consent-dialog > rpl-modal-card > button.button-secondary');"
                    + "if(b){b.click();}})();";

    private LoginWebView() {
    }

    private static boolean isRedditLogin(String url) {
        return url != null && (url.contains("reddit.com/login") || url.contains("reddit.com/api/v1/authorize"));
    }

    @SuppressLint("SetJavaScriptEnabled")
    public static void load(WebView webView, String url) {
        if (isRedditLogin(url)) {
            WebSettings settings = webView.getSettings();
            settings.setUserAgentString(CHROME_USER_AGENT);
            settings.setJavaScriptEnabled(true);
        }
        webView.loadUrl(url);
    }

    /** Called from the login page's onPageFinished, once the consent dialog can exist. */
    public static void pageFinished(WebView webView, String url) {
        if (webView != null && isRedditLogin(url)) {
            webView.evaluateJavascript(DISMISS_CONSENT, null);
        }
    }
}
