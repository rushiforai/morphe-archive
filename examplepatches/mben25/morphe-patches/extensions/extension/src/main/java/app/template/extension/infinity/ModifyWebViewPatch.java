/*
 * Adapted from Patcheddit (https://github.com/wchill/patcheddit), Copyright 2026 wchill, GPLv3.
 */

package app.template.extension.infinity;

import android.annotation.SuppressLint;
import android.webkit.WebSettings;
import android.webkit.WebView;

import java.util.Collections;
import java.util.Map;

/**
 * Replaces Infinity's {@code WebView.loadUrl} calls. Reddit's login page rejects the stock
 * WebView user agent and needs JavaScript, so both are fixed up for login URLs only.
 */
@SuppressWarnings("unused")
public class ModifyWebViewPatch {
    @SuppressLint("SetJavaScriptEnabled")
    public static void loadUrl(WebView webView, String url, Map<String, String> additionalHeaders) {
        if (!url.contains("reddit.com/login") && !url.contains("reddit.com/api/v1/authorize")) {
            webView.loadUrl(url, additionalHeaders);
            return;
        }

        WebSettings webSettings = webView.getSettings();
        webSettings.setUserAgentString(
                "Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) " +
                        "Chrome/147.0.0.0 Mobile Safari/537.36"
        );
        webSettings.setJavaScriptEnabled(true);
        webView.loadUrl(url, additionalHeaders);
        // Dismisses the EU data-protection consent dialog that otherwise covers the form.
        webView.evaluateJavascript(
                "(function(){" +
                        "document.addEventListener('DOMContentLoaded',(e)=>{" +
                        "document.querySelector('#data-protection-consent-dialog > rpl-modal-card > button.button-secondary')" +
                        ".click()" +
                        "});" +
                        "})()",
                null
        );
    }

    public static void loadUrl(WebView webView, String url) {
        // Collections.emptyMap, not Map.of: the app's minSdk is 21 and Map.of needs API 30.
        loadUrl(webView, url, Collections.emptyMap());
    }
}
