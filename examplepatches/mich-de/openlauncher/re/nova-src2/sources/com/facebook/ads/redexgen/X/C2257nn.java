package com.facebook.ads.redexgen.X;

import com.facebook.ads.NativeAdBase;
import com.facebook.ads.NativeAdListener;

/* renamed from: com.facebook.ads.redexgen.X.nn, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2257nn implements NativeAdBase.NativeAdLoadConfigBuilder, NativeAdBase.NativeLoadAdConfig {
    public NativeAdBase.MediaCacheFlag A02;
    public String A03;
    public boolean A04;
    public final NativeAdBase A05;
    public final GT A06;
    public int A01 = -1;
    public int A00 = -1;

    public C2257nn(GT gt2, NativeAdBase nativeAdBase) {
        this.A06 = gt2;
        this.A05 = nativeAdBase;
    }

    public final void A00() {
        if (this.A02 == null) {
            this.A02 = NativeAdBase.MediaCacheFlag.ALL;
        }
        this.A06.A1f(EnumC2246nc.A00(this.A02), this.A03, new l5(this.A04, this.A01, this.A00));
    }

    @Override // com.facebook.ads.NativeAdBase.NativeAdLoadConfigBuilder, com.facebook.ads.Ad.LoadConfigBuilder
    public final NativeAdBase.NativeLoadAdConfig build() {
        return this;
    }

    @Override // com.facebook.ads.NativeAdBase.NativeAdLoadConfigBuilder
    public final NativeAdBase.NativeAdLoadConfigBuilder withAdListener(NativeAdListener nativeAdListener) {
        this.A06.A1b(this.A05, nativeAdListener);
        return this;
    }

    @Override // com.facebook.ads.NativeAdBase.NativeAdLoadConfigBuilder, com.facebook.ads.Ad.LoadConfigBuilder
    public final NativeAdBase.NativeAdLoadConfigBuilder withBid(String str) {
        this.A03 = str;
        return this;
    }

    @Override // com.facebook.ads.NativeAdBase.NativeAdLoadConfigBuilder
    public final NativeAdBase.NativeAdLoadConfigBuilder withMediaCacheFlag(NativeAdBase.MediaCacheFlag mediaCacheFlag) {
        this.A02 = mediaCacheFlag;
        return this;
    }

    @Override // com.facebook.ads.NativeAdBase.NativeAdLoadConfigBuilder
    public final NativeAdBase.NativeAdLoadConfigBuilder withPreloadedIconView(int i5, int i11) {
        this.A04 = true;
        this.A01 = i5;
        this.A00 = i11;
        return this;
    }
}
