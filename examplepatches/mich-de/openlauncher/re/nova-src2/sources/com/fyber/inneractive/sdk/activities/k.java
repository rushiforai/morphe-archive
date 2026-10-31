package com.fyber.inneractive.sdk.activities;

import android.view.View;
import android.webkit.WebView;

/* loaded from: classes3.dex */
public final class k implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveInternalBrowserActivity f27597a;

    public k(InneractiveInternalBrowserActivity inneractiveInternalBrowserActivity) {
        this.f27597a = inneractiveInternalBrowserActivity;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        WebView webView = this.f27597a.f27576e;
        if (webView == null || !webView.canGoForward()) {
            return;
        }
        this.f27597a.f27576e.goForward();
    }
}
