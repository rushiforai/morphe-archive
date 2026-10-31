package com.fyber.inneractive.sdk.activities;

import android.webkit.WebChromeClient;
import android.webkit.WebView;

/* loaded from: classes3.dex */
public final class f extends WebChromeClient {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveInternalBrowserActivity f27592a;

    public f(InneractiveInternalBrowserActivity inneractiveInternalBrowserActivity) {
        this.f27592a = inneractiveInternalBrowserActivity;
    }

    @Override // android.webkit.WebChromeClient
    public final void onProgressChanged(WebView webView, int i5) {
        this.f27592a.setTitle("Page is Loading...");
        this.f27592a.setProgress(i5 * 100);
        if (i5 == 100) {
            this.f27592a.setTitle(webView.getUrl());
        }
    }
}
