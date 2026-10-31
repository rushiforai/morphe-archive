package com.fyber.inneractive.sdk.activities;

import android.view.View;
import android.webkit.WebView;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class l implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveInternalBrowserActivity f27598a;

    public l(InneractiveInternalBrowserActivity inneractiveInternalBrowserActivity) {
        this.f27598a = inneractiveInternalBrowserActivity;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        WebView webView = this.f27598a.f27576e;
        if (webView != null) {
            webView.reload();
            int i5 = IAlog.f31163a;
            IAlog.d("%s %s", "AD_INTERNAL_BROWSER_REFRESH", this.f27598a.f27576e.getUrl());
        }
    }
}
