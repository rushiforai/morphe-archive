package com.moloco.sdk.publisher;

import kotlin.Deprecated;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&J\u0010\u0010\u0006\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H'J\u0010\u0010\u0007\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H'¨\u0006\b"}, d2 = {"Lcom/moloco/sdk/publisher/RewardedInterstitialAdShowListener;", "Lcom/moloco/sdk/publisher/InterstitialAdShowListener;", "onUserRewarded", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "molocoAd", "Lcom/moloco/sdk/publisher/MolocoAd;", "onRewardedVideoStarted", "onRewardedVideoCompleted", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface RewardedInterstitialAdShowListener extends InterstitialAdShowListener {
    @Deprecated
    void onRewardedVideoCompleted(@NotNull MolocoAd molocoAd);

    @Deprecated
    void onRewardedVideoStarted(@NotNull MolocoAd molocoAd);

    void onUserRewarded(@NotNull MolocoAd molocoAd);
}
