package id;

import ads_mobile_sdk.xo1;
import android.content.Context;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.publisher.AdLoad;
import com.moloco.sdk.publisher.MediationInfo;
import com.moloco.sdk.publisher.Moloco;
import com.moloco.sdk.publisher.MolocoAd;
import com.moloco.sdk.publisher.MolocoAdError;
import com.moloco.sdk.publisher.RewardedInterstitialAd;
import com.moloco.sdk.publisher.RewardedInterstitialAdShowListener;
import eg.u;
import eg.v;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class r implements u, AdLoad.Listener, RewardedInterstitialAdShowListener {

    /* renamed from: a, reason: collision with root package name */
    public final eg.f f61549a;

    /* renamed from: b, reason: collision with root package name */
    public final String f61550b;

    /* renamed from: c, reason: collision with root package name */
    public final String f61551c;

    /* renamed from: d, reason: collision with root package name */
    public final String f61552d;

    /* renamed from: e, reason: collision with root package name */
    public RewardedInterstitialAd f61553e;

    /* renamed from: f, reason: collision with root package name */
    public v f61554f;

    public r(eg.f fVar, String str, String str2, String str3) {
        this.f61549a = fVar;
        this.f61550b = str;
        this.f61551c = str2;
        this.f61552d = str3;
    }

    public final void c() {
        Moloco.createRewardedInterstitial(new MediationInfo(MolocoMediationAdapter.MEDIATION_PLATFORM_NAME), this.f61550b, this.f61552d, new q(this));
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdClicked(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        v vVar = this.f61554f;
        if (vVar != null) {
            ((xo1) vVar).reportAdClicked();
        }
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdHidden(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        v vVar = this.f61554f;
        if (vVar != null) {
            ((xo1) vVar).onAdClosed();
        }
    }

    @Override // com.moloco.sdk.publisher.AdLoad.Listener
    public final void onAdLoadFailed(MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        this.f61549a.onFailure(new bg.a(molocoAdError.getErrorType().getErrorCode(), molocoAdError.getErrorType().getDescription(), "com.moloco.sdk"));
    }

    @Override // com.moloco.sdk.publisher.AdLoad.Listener
    public final void onAdLoadSuccess(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f61554f = (v) this.f61549a.onSuccess(this);
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdShowFailed(MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        bg.a aVar = new bg.a(molocoAdError.getErrorType().getErrorCode(), molocoAdError.getErrorType().getDescription(), "com.moloco.sdk");
        v vVar = this.f61554f;
        if (vVar != null) {
            ((xo1) vVar).f11791a.a(aVar);
        }
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdShowSuccess(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        v vVar = this.f61554f;
        if (vVar != null) {
            xo1 xo1Var = (xo1) vVar;
            xo1Var.onAdOpened();
            xo1Var.reportAdImpression();
        }
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public final void onRewardedVideoCompleted(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        v vVar = this.f61554f;
        if (vVar != null) {
            ((xo1) vVar).f11791a.f();
        }
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public final void onRewardedVideoStarted(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        v vVar = this.f61554f;
        if (vVar != null) {
            ((xo1) vVar).f11791a.a();
        }
    }

    @Override // com.moloco.sdk.publisher.RewardedInterstitialAdShowListener
    public final void onUserRewarded(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        v vVar = this.f61554f;
        if (vVar != null) {
            ((xo1) vVar).onUserEarnedReward();
        }
    }

    @Override // eg.u
    public final void showAd(Context context) {
        RewardedInterstitialAd rewardedInterstitialAd = this.f61553e;
        if (rewardedInterstitialAd != null) {
            rewardedInterstitialAd.show(this);
        } else {
            Intrinsics.m("molocoAd");
            throw null;
        }
    }
}
