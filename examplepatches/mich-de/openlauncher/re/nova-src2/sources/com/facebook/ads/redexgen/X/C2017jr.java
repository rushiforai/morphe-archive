package com.facebook.ads.redexgen.X;

import com.facebook.ads.CacheFlag;
import com.facebook.ads.InterstitialAd;
import com.facebook.ads.InterstitialAdExtendedListener;
import com.facebook.ads.InterstitialAdListener;
import com.facebook.ads.RewardData;
import com.facebook.ads.RewardedAdListener;
import java.util.EnumSet;

/* renamed from: com.facebook.ads.redexgen.X.jr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2017jr implements InterstitialAd.InterstitialAdLoadConfigBuilder, InterstitialAd.InterstitialLoadAdConfig {
    public C2016jq A00;
    public String A01;
    public EnumSet<CacheFlag> A02;

    public C2017jr(C2016jq c2016jq) {
        this.A00 = c2016jq;
    }

    public final void A00() {
        if (this.A02 == null) {
            this.A02 = CacheFlag.ALL;
        }
        this.A00.A05(this.A02, this.A01);
    }

    @Override // com.facebook.ads.InterstitialAd.InterstitialAdLoadConfigBuilder, com.facebook.ads.Ad.LoadConfigBuilder
    public final InterstitialAd.InterstitialLoadAdConfig build() {
        return this;
    }

    @Override // com.facebook.ads.InterstitialAd.InterstitialAdLoadConfigBuilder
    public final InterstitialAd.InterstitialAdLoadConfigBuilder withAdListener(InterstitialAdListener interstitialAdListener) {
        this.A00.A02(interstitialAdListener);
        if (interstitialAdListener instanceof InterstitialAdExtendedListener) {
            this.A00.A04((InterstitialAdExtendedListener) interstitialAdListener);
        }
        return this;
    }

    @Override // com.facebook.ads.InterstitialAd.InterstitialAdLoadConfigBuilder, com.facebook.ads.Ad.LoadConfigBuilder
    public final InterstitialAd.InterstitialAdLoadConfigBuilder withBid(String str) {
        this.A01 = str;
        return this;
    }

    @Override // com.facebook.ads.InterstitialAd.InterstitialAdLoadConfigBuilder
    public final InterstitialAd.InterstitialAdLoadConfigBuilder withCacheFlags(EnumSet<CacheFlag> cacheFlags) {
        this.A02 = cacheFlags;
        return this;
    }

    @Override // com.facebook.ads.InterstitialAd.InterstitialAdLoadConfigBuilder
    public final InterstitialAd.InterstitialAdLoadConfigBuilder withRewardData(RewardData rewardData) {
        this.A00.A03(rewardData);
        return this;
    }

    @Override // com.facebook.ads.InterstitialAd.InterstitialAdLoadConfigBuilder
    public final InterstitialAd.InterstitialAdLoadConfigBuilder withRewardedAdListener(RewardedAdListener rewardedAdListener) {
        this.A00.A04(rewardedAdListener);
        return this;
    }
}
