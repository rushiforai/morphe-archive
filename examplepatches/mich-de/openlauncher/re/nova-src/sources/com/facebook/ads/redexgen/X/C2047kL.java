package com.facebook.ads.redexgen.X;

import com.facebook.ads.RewardedVideoAd;

/* renamed from: com.facebook.ads.redexgen.X.kL, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2047kL implements RewardedVideoAd.RewardedVideoAdShowConfigBuilder, RewardedVideoAd.RewardedVideoShowAdConfig {
    public int A00 = -1;
    public long A01;

    public final int A00() {
        return this.A00;
    }

    public final long A01() {
        return this.A01;
    }

    public final C2047kL A02(long j11) {
        this.A01 = j11;
        return this;
    }

    @Override // com.facebook.ads.RewardedVideoAd.RewardedVideoAdShowConfigBuilder, com.facebook.ads.FullScreenAd.ShowConfigBuilder
    public final RewardedVideoAd.RewardedVideoShowAdConfig build() {
        return this;
    }

    @Override // com.facebook.ads.RewardedVideoAd.RewardedVideoAdShowConfigBuilder
    public final RewardedVideoAd.RewardedVideoAdShowConfigBuilder withAppOrientation(int i5) {
        this.A00 = i5;
        return this;
    }
}
