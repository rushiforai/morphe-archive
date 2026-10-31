package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;
import com.facebook.ads.RewardedVideoAdListener;

/* renamed from: com.facebook.ads.redexgen.X.g9, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1792g9 implements RewardedVideoAdListener {
    public final /* synthetic */ C1023Jy A00;

    public C1792g9(C1023Jy c1023Jy) {
        this.A00 = c1023Jy;
    }

    @Override // com.facebook.ads.AdListener
    public final void onAdClicked(com.facebook.ads.Ad ad) {
    }

    @Override // com.facebook.ads.AdListener
    public final void onAdLoaded(com.facebook.ads.Ad ad) {
        this.A00.A00.A07.onAdLoaded(this.A00.A00.A08.A7K());
    }

    @Override // com.facebook.ads.AdListener
    public final void onError(com.facebook.ads.Ad ad, AdError adError) {
        this.A00.A00.A02 = null;
        ((LA) this.A00.A00.A03).A3C(false);
        this.A00.A00.A07.onAdLoaded(this.A00.A00.A08.A7K());
    }

    @Override // com.facebook.ads.AdListener
    public final void onLoggingImpression(com.facebook.ads.Ad ad) {
    }

    @Override // com.facebook.ads.RewardedVideoAdListener
    public final void onRewardedVideoClosed() {
        this.A00.A00.A07.onRewardedVideoClosed();
    }

    @Override // com.facebook.ads.RewardedVideoAdListener
    public final void onRewardedVideoCompleted() {
        this.A00.A00.A07.onRewardedVideoCompleted();
    }
}
