package com.vungle.ads.internal.ui;

import android.webkit.WebView;
import android.webkit.WebViewRenderProcess;
import android.webkit.WebViewRenderProcessClient;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o extends WebViewRenderProcessClient {

    /* renamed from: a, reason: collision with root package name */
    public com.vungle.ads.internal.ui.view.o f47583a;

    public o(com.vungle.ads.internal.ui.view.o oVar) {
        this.f47583a = oVar;
    }

    public final void onRenderProcessResponsive(WebView webView, WebViewRenderProcess webViewRenderProcess) {
        Intrinsics.g(webView, "webView");
    }

    public final void onRenderProcessUnresponsive(WebView webView, WebViewRenderProcess webViewRenderProcess) {
        Intrinsics.g(webView, "webView");
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("VungleWebClient", new n(webView, webViewRenderProcess));
        com.vungle.ads.internal.ui.view.o oVar = this.f47583a;
        if (oVar != null) {
            ((com.vungle.ads.internal.presenter.r) oVar).f();
        }
    }
}
