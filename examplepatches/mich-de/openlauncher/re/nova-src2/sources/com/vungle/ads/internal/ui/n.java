package com.vungle.ads.internal.ui;

import android.webkit.WebView;
import android.webkit.WebViewRenderProcess;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class n extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ WebView f47581a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ WebViewRenderProcess f47582b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(WebView webView, WebViewRenderProcess webViewRenderProcess) {
        super(0);
        this.f47581a = webView;
        this.f47582b = webViewRenderProcess;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("onRenderProcessUnresponsive(Title = ");
        sbA.append(this.f47581a.getTitle());
        sbA.append(", URL = ");
        sbA.append(this.f47581a.getOriginalUrl());
        sbA.append(", (webViewRenderProcess != null) = ");
        sbA.append(this.f47582b != null);
        return sbA.toString();
    }
}
