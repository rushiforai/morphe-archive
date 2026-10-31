package com.facebook.ads.redexgen.X;

import android.webkit.WebView;
import com.facebook.ads.AdError;

/* loaded from: assets/audience_network/classes.dex */
public class KS implements InterfaceC2078kr {
    public final C1758fb A00;
    public final InterfaceC1777fu A01;
    public final C2086kz A02;
    public final C0958Hi A03;
    public final boolean A04;

    public KS(C0958Hi c0958Hi, InterfaceC1777fu interfaceC1777fu, C2086kz c2086kz, C1758fb c1758fb, boolean z11) {
        this.A03 = c0958Hi;
        this.A01 = interfaceC1777fu;
        this.A02 = c2086kz;
        this.A00 = c1758fb;
        this.A04 = z11;
    }

    private final void A00() {
        WebView webView = new WebView(this.A03);
        webView.getSettings().setCacheMode(1);
        C1778fv playableWebViewClient = new C1778fv(this.A00, this.A01, this.A04);
        webView.setWebViewClient(playableWebViewClient);
        webView.loadUrl(this.A00.A0M());
        playableWebViewClient.A03();
    }

    private void A01(boolean z11) {
        if (this.A00.A0G() == EnumC1759fc.A05) {
            A00();
            return;
        }
        String strA0M = this.A00.A0M();
        if (z11) {
            C2086kz c2086kz = this.A02;
            String markupUrlResult = this.A00.A0M();
            strA0M = c2086kz.A0S(markupUrlResult);
        }
        this.A00.A0U(strA0M);
        this.A01.AGL();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEJ() {
        if (this.A04) {
            this.A01.AGK(AdError.CACHE_ERROR);
        } else {
            A01(false);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEU() {
        A01(true);
    }
}
