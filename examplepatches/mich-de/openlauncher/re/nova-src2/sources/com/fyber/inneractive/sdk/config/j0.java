package com.fyber.inneractive.sdk.config;

import android.content.Context;
import android.webkit.WebView;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class j0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f27859a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f27860b;

    public j0(String str, String str2) {
        this.f27859a = str;
        this.f27860b = str2;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Context context;
        WebView webView;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        if (iAConfigManager.M == null && (context = iAConfigManager.f27749g) != null) {
            try {
                webView = new WebView(context);
                webView.setWebViewClient(new c0());
            } catch (Throwable unused) {
                IAlog.a("failed to create a new webview", new Object[0]);
                webView = null;
            }
            iAConfigManager.M = webView;
        }
        WebView webView2 = iAConfigManager.M;
        String str = this.f27859a;
        String str2 = this.f27860b;
        if (webView2 != null) {
            if (str2 == null) {
                str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
            }
            webView2.loadDataWithBaseURL(str, str2, "text/html", "utf-8", null);
        }
        com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(IAConfigManager.S, TimeUnit.SECONDS.toMillis(10L));
    }
}
