package com.fyber.inneractive.sdk.config;

import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/* loaded from: classes.dex */
public final class c0 extends WebViewClient {
    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        if (iAConfigManager.M == webView) {
            iAConfigManager.M = null;
        }
        if (webView == null) {
            return true;
        }
        com.fyber.inneractive.sdk.util.v.a(webView);
        webView.destroy();
        return true;
    }
}
