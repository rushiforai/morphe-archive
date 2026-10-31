package id;

import ads_mobile_sdk.to1;
import android.content.Context;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.publisher.AdLoad;
import com.moloco.sdk.publisher.InterstitialAd;
import com.moloco.sdk.publisher.InterstitialAdShowListener;
import com.moloco.sdk.publisher.MediationInfo;
import com.moloco.sdk.publisher.Moloco;
import com.moloco.sdk.publisher.MolocoAd;
import com.moloco.sdk.publisher.MolocoAdError;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class f implements eg.p, AdLoad.Listener, InterstitialAdShowListener {

    /* renamed from: a, reason: collision with root package name */
    public final eg.f f61530a;

    /* renamed from: b, reason: collision with root package name */
    public final String f61531b;

    /* renamed from: c, reason: collision with root package name */
    public final String f61532c;

    /* renamed from: d, reason: collision with root package name */
    public final String f61533d;

    /* renamed from: e, reason: collision with root package name */
    public InterstitialAd f61534e;

    /* renamed from: f, reason: collision with root package name */
    public to1 f61535f;

    public f(eg.f fVar, String str, String str2, String str3) {
        this.f61530a = fVar;
        this.f61531b = str;
        this.f61532c = str2;
        this.f61533d = str3;
    }

    public final void c() {
        Moloco.createInterstitial(new MediationInfo(MolocoMediationAdapter.MEDIATION_PLATFORM_NAME), this.f61531b, this.f61533d, new e(this));
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdClicked(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        to1 to1Var = this.f61535f;
        if (to1Var != null) {
            to1Var.reportAdClicked();
        }
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdHidden(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        to1 to1Var = this.f61535f;
        if (to1Var != null) {
            to1Var.onAdClosed();
        }
    }

    @Override // com.moloco.sdk.publisher.AdLoad.Listener
    public final void onAdLoadFailed(MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        this.f61530a.onFailure(new bg.a(molocoAdError.getErrorType().getErrorCode(), molocoAdError.getErrorType().getDescription(), "com.moloco.sdk"));
    }

    @Override // com.moloco.sdk.publisher.AdLoad.Listener
    public final void onAdLoadSuccess(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f61535f = (to1) this.f61530a.onSuccess(this);
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdShowFailed(MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        bg.a aVar = new bg.a(molocoAdError.getErrorType().getErrorCode(), molocoAdError.getErrorType().getDescription(), "com.moloco.sdk");
        to1 to1Var = this.f61535f;
        if (to1Var != null) {
            to1Var.f10019a.a(aVar);
        }
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdShowSuccess(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        to1 to1Var = this.f61535f;
        if (to1Var != null) {
            to1Var.onAdOpened();
            to1Var.reportAdImpression();
        }
    }

    @Override // eg.p
    public final void showAd(Context context) {
        InterstitialAd interstitialAd = this.f61534e;
        if (interstitialAd != null) {
            interstitialAd.show(this);
        } else {
            Intrinsics.m("molocoAd");
            throw null;
        }
    }
}
