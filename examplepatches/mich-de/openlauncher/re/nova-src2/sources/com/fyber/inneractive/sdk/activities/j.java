package com.fyber.inneractive.sdk.activities;

import android.view.View;
import android.webkit.WebView;

/* loaded from: classes3.dex */
public final class j implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveInternalBrowserActivity f27596a;

    public j(InneractiveInternalBrowserActivity inneractiveInternalBrowserActivity) {
        this.f27596a = inneractiveInternalBrowserActivity;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        WebView webView = this.f27596a.f27576e;
        if (webView == null || !webView.canGoBack()) {
            return;
        }
        this.f27596a.f27576e.goBack();
    }
}
