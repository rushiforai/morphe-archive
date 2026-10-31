package com.fyber.inneractive.sdk.flow.storepromo.controller.webview;

import com.fyber.inneractive.sdk.web.m;

/* loaded from: classes3.dex */
public final class a extends m {

    /* renamed from: h, reason: collision with root package name */
    public final b f28307h;

    public a(b bVar) {
        this.f28307h = bVar;
        setWebViewClient(bVar);
        getSettings().setJavaScriptEnabled(true);
        setHorizontalScrollBarEnabled(false);
        setHorizontalScrollbarOverlay(false);
        setVerticalScrollBarEnabled(false);
        setVerticalScrollbarOverlay(false);
        getSettings().setSupportZoom(false);
        setOverScrollMode(2);
    }

    @Override // com.fyber.inneractive.sdk.web.m, android.webkit.WebView
    public final void destroy() {
        b bVar = this.f28307h;
        bVar.f28309a = null;
        bVar.f28310b = null;
        super.destroy();
    }
}
