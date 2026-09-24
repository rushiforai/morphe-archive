/*
 * Copyright 2026 pdscomp, KingOfPoptart, IMXEren.
 * https://github.com/wchill/patcheddit
 *
 * See the included NOTICE file for GPLv3 §7(b) and §7(c) terms that apply to this code.
 */

package app.mix.extension.syncforreddit;

import android.net.Uri;
import android.webkit.CookieManager;
import android.webkit.WebView;

/**
 * Preserves cookie consent when a failed native Redgifs request falls back to Sync's WebView.
 */
public final class RedgifsWebViewHelper {
    private static final String ACCEPT_JS =
            "(function(){var n=0,t=setInterval(function(){"
                    + "var b=document.querySelector('[data-cky-tag=\"accept-button\"]')"
                    + "||document.querySelector('.cky-btn-accept');"
                    + "if(b){b.click();clearInterval(t);}"
                    + "if(++n>20)clearInterval(t);},250);})();";

    private RedgifsWebViewHelper() {
    }

    public static void onPageFinished(WebView view, String url) {
        if (isRedgifs(url)) {
            view.evaluateJavascript(ACCEPT_JS, null);
        }
    }

    public static void removeAllCookieUnlessRedgifs(CookieManager cookieManager, String url) {
        if (!isRedgifs(url)) {
            cookieManager.removeAllCookie();
        }
    }

    private static boolean isRedgifs(String url) {
        if (url == null) return false;

        String host = Uri.parse(url).getHost();
        return host != null && (host.equals("redgifs.com") || host.endsWith(".redgifs.com"));
    }
}
