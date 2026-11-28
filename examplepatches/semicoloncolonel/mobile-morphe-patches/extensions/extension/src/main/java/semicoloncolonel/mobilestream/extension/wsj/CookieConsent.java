package semicoloncolonel.mobilestream.extension.wsj;

import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.webkit.WebView;

import androidx.webkit.WebViewCompat;
import androidx.webkit.WebViewFeature;

import java.util.Collections;

/**
 * Answers WSJ's cookie dialogs with their reject button ("I Do Not Agree",
 * "Reject All", "Decline"). The choice is saved through the dialog's own path.
 *
 * The app asks in two places:
 *   onShown — the Sourcepoint SDK's own dialog at first launch, a WebView the
 *     app's Sourcepoint client shows. It is kept invisible while a script clicks
 *     the reject button. If none is found, it is made visible again.
 *   onWebView — the wsj.com cookie banner inside the app's web pages (the store
 *     page a paywalled article shows). It runs in a Sourcepoint frame
 *     (privacy-mgmt.com), so a document-start script that runs only in that
 *     frame waits for the reject button and clicks it.
 */
public final class CookieConsent {

    private static final int TRIES = 10;
    private static final long INTERVAL_MS = 300;

    private static final String FIND_REJECT =
        "var re=/^\\s*(i\\s+do\\s+not\\s+agree|do\\s+not\\s+agree|reject(\\s+all)?|decline(\\s+all)?)\\s*$/i;"
            + "function clickReject(){"
            + "var els=document.querySelectorAll('button,[role=button],a');"
            + "for(var i=0;i<els.length;i++){"
            + "var t=(els[i].innerText||els[i].getAttribute('title')||'').trim();"
            + "if(re.test(t)){els[i].click();return true;}"
            + "}"
            + "return false;"
            + "}";

    private static final String CLICK_REJECT = "(function(){" + FIND_REJECT + "return clickReject();})()";

    private static final String FRAME_SCRIPT =
        "(function(){"
            + "if(!/(^|\\.)privacy-mgmt\\.com$/.test(location.hostname))return;"
            + FIND_REJECT
            + "var n=0;var timer=setInterval(function(){"
            + "if(clickReject()||++n>60)clearInterval(timer);"
            + "},250);"
            + "})();";

    private CookieConsent() {}

    public static void onShown(View view) {
        try {
            if (!(view instanceof WebView)) return;
            WebView webView = (WebView) view;
            webView.setAlpha(0f);
            tryReject(webView, new Handler(Looper.getMainLooper()), 0);
        } catch (Throwable ignored) {
            view.setAlpha(1f);
        }
    }

    public static void onWebView(WebView webView) {
        try {
            if (!WebViewFeature.isFeatureSupported(WebViewFeature.DOCUMENT_START_SCRIPT)) return;
            WebViewCompat.addDocumentStartJavaScript(webView, FRAME_SCRIPT, Collections.singleton("*"));
        } catch (Throwable ignored) {
            // Without the script, the banner shows as it would unpatched.
        }
    }

    private static void tryReject(WebView webView, Handler handler, int attempt) {
        webView.evaluateJavascript(CLICK_REJECT, result -> {
            if ("true".equals(result)) return;
            if (attempt + 1 >= TRIES) {
                webView.setAlpha(1f);
                return;
            }
            handler.postDelayed(() -> tryReject(webView, handler, attempt + 1), INTERVAL_MS);
        });
    }
}
