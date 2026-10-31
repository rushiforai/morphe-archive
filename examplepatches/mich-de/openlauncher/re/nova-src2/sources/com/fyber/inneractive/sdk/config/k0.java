package com.fyber.inneractive.sdk.config;

import android.webkit.WebView;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes.dex */
public final class k0 implements Runnable {
    @Override // java.lang.Runnable
    public final void run() {
        WebView webView;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        WebView webView2 = iAConfigManager.M;
        if (webView2 == null || iAConfigManager.f27749g == null) {
            return;
        }
        webView2.destroy();
        try {
            webView = new WebView(iAConfigManager.f27749g);
            webView.setWebViewClient(new c0());
        } catch (Throwable unused) {
            IAlog.a("failed to create a new webview", new Object[0]);
            webView = null;
        }
        iAConfigManager.M = webView;
    }
}
