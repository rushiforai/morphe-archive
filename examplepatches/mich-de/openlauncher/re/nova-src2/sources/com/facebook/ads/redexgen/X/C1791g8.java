package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;
import com.facebook.ads.InterstitialAdListener;

/* renamed from: com.facebook.ads.redexgen.X.g8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1791g8 implements InterstitialAdListener {
    public final /* synthetic */ LA A00;
    public final /* synthetic */ K1 A01;

    public C1791g8(K1 k12, LA la2) {
        this.A01 = k12;
        this.A00 = la2;
    }

    @Override // com.facebook.ads.AdListener
    public final void onAdClicked(com.facebook.ads.Ad ad) {
    }

    @Override // com.facebook.ads.AdListener
    public final void onAdLoaded(com.facebook.ads.Ad ad) {
        this.A01.A00.A07.onAdLoaded(this.A01.A00.A08.A7K());
    }

    @Override // com.facebook.ads.AdListener
    public final void onError(com.facebook.ads.Ad ad, AdError adError) {
        this.A01.A00.A01 = null;
        this.A00.A3C(false);
        this.A01.A00.A07.onAdLoaded(this.A01.A00.A08.A7K());
    }

    @Override // com.facebook.ads.InterstitialAdListener
    public final void onInterstitialDismissed(com.facebook.ads.Ad ad) {
        this.A01.A00.A04 = false;
        if (this.A01.A00.A03 != null) {
            this.A01.A00.A03.A0R(new K3(this));
            this.A01.A00.A03.A0M();
            this.A01.A00.A03.A0J();
            this.A01.A00.A03 = null;
        }
        this.A01.A00.A07.onInterstitialDismissed(this.A01.A00.A08.A7K());
    }

    @Override // com.facebook.ads.InterstitialAdListener
    public final void onInterstitialDisplayed(com.facebook.ads.Ad ad) {
    }

    @Override // com.facebook.ads.AdListener
    public final void onLoggingImpression(com.facebook.ads.Ad ad) {
    }
}
