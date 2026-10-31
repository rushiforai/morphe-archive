package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.internal.y;
import com.moloco.sdk.publisher.AdShowListener;
import com.moloco.sdk.publisher.MolocoAd;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.RewardedInterstitialAdShowListener;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class L implements RewardedInterstitialAdShowListener, AdShowListener {

    /* renamed from: e, reason: collision with root package name */
    public static final int f36919e = 0;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AdShowListener f36920a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final RewardedInterstitialAdShowListener f36921b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Function0<com.moloco.sdk.internal.ortb.model.D> f36922c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.internal.y f36923d;

    public L(@Nullable RewardedInterstitialAdShowListener rewardedInterstitialAdShowListener, @NotNull Function0<com.moloco.sdk.internal.ortb.model.D> provideSdkEvents, @NotNull com.moloco.sdk.internal.y sdkEventUrlTracker) {
        Intrinsics.g(provideSdkEvents, "provideSdkEvents");
        Intrinsics.g(sdkEventUrlTracker, "sdkEventUrlTracker");
        this.f36920a = C2948j.a(rewardedInterstitialAdShowListener);
        this.f36921b = rewardedInterstitialAdShowListener;
        this.f36922c = provideSdkEvents;
        this.f36923d = sdkEventUrlTracker;
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public void onAdClicked(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36920a.onAdClicked(molocoAd);
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public void onAdHidden(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36920a.onAdHidden(molocoAd);
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public void onAdShowFailed(@NotNull MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        RewardedInterstitialAdShowListener rewardedInterstitialAdShowListener = this.f36921b;
        if (rewardedInterstitialAdShowListener != null) {
            rewardedInterstitialAdShowListener.onAdShowFailed(molocoAdError);
        }
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public void onAdShowSuccess(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36920a.onAdShowSuccess(molocoAd);
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public void onRewardedVideoCompleted(@NotNull MolocoAd molocoAd) {
        String onRewardedVideoCompleted;
        Intrinsics.g(molocoAd, "molocoAd");
        com.moloco.sdk.internal.ortb.model.D d5 = (com.moloco.sdk.internal.ortb.model.D) this.f36922c.invoke();
        if (d5 != null && (onRewardedVideoCompleted = d5.getOnRewardedVideoCompleted()) != null) {
            y.a.a(this.f36923d, onRewardedVideoCompleted, System.currentTimeMillis(), null, 4, null);
        }
        RewardedInterstitialAdShowListener rewardedInterstitialAdShowListener = this.f36921b;
        if (rewardedInterstitialAdShowListener != null) {
            rewardedInterstitialAdShowListener.onRewardedVideoCompleted(molocoAd);
        }
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public void onRewardedVideoStarted(@NotNull MolocoAd molocoAd) {
        String onRewardedVideoStarted;
        Intrinsics.g(molocoAd, "molocoAd");
        com.moloco.sdk.internal.ortb.model.D d5 = (com.moloco.sdk.internal.ortb.model.D) this.f36922c.invoke();
        if (d5 != null && (onRewardedVideoStarted = d5.getOnRewardedVideoStarted()) != null) {
            y.a.a(this.f36923d, onRewardedVideoStarted, System.currentTimeMillis(), null, 4, null);
        }
        RewardedInterstitialAdShowListener rewardedInterstitialAdShowListener = this.f36921b;
        if (rewardedInterstitialAdShowListener != null) {
            rewardedInterstitialAdShowListener.onRewardedVideoStarted(molocoAd);
        }
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public void onUserRewarded(@NotNull MolocoAd molocoAd) {
        String onUserRewarded;
        Intrinsics.g(molocoAd, "molocoAd");
        com.moloco.sdk.internal.ortb.model.D d5 = (com.moloco.sdk.internal.ortb.model.D) this.f36922c.invoke();
        if (d5 != null && (onUserRewarded = d5.getOnUserRewarded()) != null) {
            y.a.a(this.f36923d, onUserRewarded, System.currentTimeMillis(), null, 4, null);
        }
        RewardedInterstitialAdShowListener rewardedInterstitialAdShowListener = this.f36921b;
        if (rewardedInterstitialAdShowListener != null) {
            rewardedInterstitialAdShowListener.onUserRewarded(molocoAd);
        }
    }
}
