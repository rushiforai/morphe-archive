package com.vungle.ads.internal.ui;

import android.webkit.WebView;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class t extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ WebView f47588a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public t(WebView webView) {
        super(0);
        this.f47588a = webView;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onRenderProcessGone url: ");
        WebView webView = this.f47588a;
        sbA.append(webView != null ? webView.getUrl() : null);
        return sbA.toString();
    }
}
