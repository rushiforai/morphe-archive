/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.ather;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/**
 * Opens Ather web links inside the app instead of bouncing to an external browser.
 */
public final class MorpheWebActivity extends android.app.Activity {
    public static final String EXTRA_URL = "url";

    private WebView webView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        webView = new WebView(this);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.setWebViewClient(new WebViewClient());
        setContentView(webView);
        String url = getIntent().getStringExtra(EXTRA_URL);
        if (url == null || url.length() == 0) {
            finish();
            return;
        }
        webView.loadUrl(url);
    }

    @Override
    public void onBackPressed() {
        if (webView != null && webView.canGoBack()) {
            webView.goBack();
            return;
        }
        super.onBackPressed();
    }
}
