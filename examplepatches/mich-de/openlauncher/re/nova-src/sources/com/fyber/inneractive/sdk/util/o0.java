package com.fyber.inneractive.sdk.util;

import android.webkit.WebView;

/* loaded from: classes3.dex */
public final class o0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ WebView f31211a;

    public o0(WebView webView) {
        this.f31211a = webView;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f31211a.getSettings().setDisplayZoomControls(false);
    }
}
