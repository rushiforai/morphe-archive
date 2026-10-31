package com.vungle.ads.internal.ui;

import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class u extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ WebView f47589a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ RenderProcessGoneDetail f47590b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        super(0);
        this.f47589a = webView;
        this.f47590b = renderProcessGoneDetail;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onRenderProcessGone url: ");
        WebView webView = this.f47589a;
        sbA.append(webView != null ? webView.getUrl() : null);
        sbA.append(", did crash: ");
        RenderProcessGoneDetail renderProcessGoneDetail = this.f47590b;
        sbA.append(renderProcessGoneDetail != null ? Boolean.valueOf(renderProcessGoneDetail.didCrash()) : null);
        return sbA.toString();
    }
}
