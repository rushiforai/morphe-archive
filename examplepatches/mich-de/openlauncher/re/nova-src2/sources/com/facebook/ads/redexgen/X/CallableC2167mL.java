package com.facebook.ads.redexgen.X;

import android.webkit.WebView;
import java.util.concurrent.Callable;

/* renamed from: com.facebook.ads.redexgen.X.mL, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class CallableC2167mL implements Callable<String> {
    public final /* synthetic */ C2095lA A00;

    public CallableC2167mL(C2095lA c2095lA) {
        this.A00 = c2095lA;
    }

    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.concurrent.Callable
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final String call() {
        String browserUserAgent = AbstractC2168mM.A03.get();
        if (browserUserAgent != null) {
            return browserUserAgent;
        }
        WebView webView = new WebView(this.A00.getApplicationContext());
        webView.setWebViewClient(new C2166mK(this));
        String userAgentString = webView.getSettings().getUserAgentString();
        webView.destroy();
        if (userAgentString != null) {
            AbstractC2168mM.A03.set(userAgentString);
        }
        return userAgentString;
    }
}
