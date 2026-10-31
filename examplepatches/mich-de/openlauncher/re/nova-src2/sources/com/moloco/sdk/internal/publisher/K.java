package com.moloco.sdk.internal.publisher;

import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.publisher.MolocoAd;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.MolocoAdKt;
import com.moloco.sdk.publisher.RewardedInterstitialAdShowListener;
import java.util.Locale;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class K implements F {

    /* renamed from: j, reason: collision with root package name */
    public static final int f36909j = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final RewardedInterstitialAdShowListener f36910a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f36911b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Function0<Boolean> f36912c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f36913d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f36914e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final Function0<com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> f36915f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final MetricsRecorder f36916g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final String f36917h;

    /* renamed from: i, reason: collision with root package name */
    public boolean f36918i;

    /* JADX WARN: Multi-variable type inference failed */
    public K(@NotNull RewardedInterstitialAdShowListener listenerTracker, boolean z11, @NotNull Function0<Boolean> isAdForciblyClosed, @NotNull String adUnitId, boolean z12, @NotNull Function0<? extends com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j> getCreativeType, @NotNull MetricsRecorder metricsRecorder) {
        Intrinsics.g(listenerTracker, "listenerTracker");
        Intrinsics.g(isAdForciblyClosed, "isAdForciblyClosed");
        Intrinsics.g(adUnitId, "adUnitId");
        Intrinsics.g(getCreativeType, "getCreativeType");
        Intrinsics.g(metricsRecorder, "metricsRecorder");
        this.f36910a = listenerTracker;
        this.f36911b = z11;
        this.f36912c = isAdForciblyClosed;
        this.f36913d = adUnitId;
        this.f36914e = z12;
        this.f36915f = getCreativeType;
        this.f36916g = metricsRecorder;
        this.f36917h = "RewardedInterstitialAdShowListenerImpl";
    }

    public final void a(MolocoAd molocoAd) {
        String strName;
        if (this.f36918i) {
            MolocoLogger.debug$default(MolocoLogger.INSTANCE, this.f36917h, "issuing of reward is already handled", false, 4, null);
            return;
        }
        this.f36918i = true;
        if (!Intrinsics.b(this.f36912c.invoke(), Boolean.FALSE)) {
            MolocoLogger.debug$default(MolocoLogger.INSTANCE, this.f36917h, "reward can't be issued: ad was forcibly closed or ad was missing", false, 4, null);
            return;
        }
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j jVar = (com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.j) this.f36915f.invoke();
        MolocoLogger.debug$default(MolocoLogger.INSTANCE, this.f36917h, "issuing of reward... creativeType: " + jVar, false, 4, null);
        MetricsRecorder metricsRecorder = this.f36916g;
        CountEvent countEvent = new CountEvent(com.moloco.sdk.internal.client_metrics_data.b.X.c());
        String strC = com.moloco.sdk.internal.client_metrics_data.d.f36300h.c();
        String lowerCase = (jVar == null || (strName = jVar.name()) == null) ? "UNKNOWN".toLowerCase(Locale.ROOT) : strName.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        metricsRecorder.recordCountEvent(countEvent.withTag(strC, lowerCase));
        onUserRewarded(molocoAd);
    }

    @Override // com.moloco.sdk.internal.publisher.F
    public void b() {
        if (!this.f36914e) {
            MolocoLogger.info$default(MolocoLogger.INSTANCE, this.f36917h, "onCloseOrSkipButtonShown called - skip button shown but reward requires user click (feature flag disabled)", null, false, 12, null);
        } else {
            MolocoLogger.debug$default(MolocoLogger.INSTANCE, this.f36917h, "onCloseOrSkipButtonShown called - attempt issue reward as skip button is now available (feature flag enabled)", false, 4, null);
            a(MolocoAdKt.createAdInfo$default(this.f36913d, null, null, 6, null));
        }
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public void onAdClicked(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36910a.onAdClicked(molocoAd);
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public void onAdHidden(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        a(molocoAd);
        this.f36910a.onAdHidden(molocoAd);
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public void onAdShowFailed(@NotNull MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        this.f36910a.onAdShowFailed(molocoAdError);
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public void onAdShowSuccess(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36910a.onAdShowSuccess(molocoAd);
        if (this.f36911b) {
            onRewardedVideoStarted(molocoAd);
        }
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public void onRewardedVideoCompleted(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        a(molocoAd);
        this.f36910a.onRewardedVideoCompleted(molocoAd);
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public void onRewardedVideoStarted(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36910a.onRewardedVideoStarted(molocoAd);
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public void onUserRewarded(@NotNull MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f36910a.onUserRewarded(molocoAd);
    }

    @Override // com.moloco.sdk.internal.publisher.F
    public void a() {
        MolocoLogger.debug$default(MolocoLogger.INSTANCE, this.f36917h, "onIssueReward called - attempt issue reward as requested by the creative", false, 4, null);
        a(MolocoAdKt.createAdInfo$default(this.f36913d, null, null, 6, null));
    }
}
