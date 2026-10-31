package com.facebook.ads.redexgen.X;

import android.webkit.RenderProcessGoneDetail;
import android.webkit.WebView;
import android.webkit.WebViewClient;

/* renamed from: com.facebook.ads.redexgen.X.mK, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2166mK extends WebViewClient {
    public final /* synthetic */ CallableC2167mL A00;

    public C2166mK(CallableC2167mL callableC2167mL) {
        this.A00 = callableC2167mL;
    }

    @Override // android.webkit.WebViewClient
    public final boolean onRenderProcessGone(WebView webView, RenderProcessGoneDetail renderProcessGoneDetail) {
        AbstractC2607tX.A0D(AbstractC2126lf.A2j);
        return true;
    }
}
