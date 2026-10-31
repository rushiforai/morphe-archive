package id;

import ads_mobile_sdk.ro1;
import android.content.Context;
import android.view.View;
import com.google.ads.mediation.moloco.MolocoMediationAdapter;
import com.moloco.sdk.publisher.AdLoad;
import com.moloco.sdk.publisher.Banner;
import com.moloco.sdk.publisher.BannerAdShowListener;
import com.moloco.sdk.publisher.BannerAdSize;
import com.moloco.sdk.publisher.MediationInfo;
import com.moloco.sdk.publisher.Moloco;
import com.moloco.sdk.publisher.MolocoAd;
import com.moloco.sdk.publisher.MolocoAdError;
import e10.z2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public final class c implements eg.k, AdLoad.Listener, BannerAdShowListener {

    /* renamed from: a, reason: collision with root package name */
    public final eg.f f61522a;

    /* renamed from: b, reason: collision with root package name */
    public final bg.c f61523b;

    /* renamed from: c, reason: collision with root package name */
    public final String f61524c;

    /* renamed from: d, reason: collision with root package name */
    public final String f61525d;

    /* renamed from: e, reason: collision with root package name */
    public final String f61526e;

    /* renamed from: f, reason: collision with root package name */
    public Banner f61527f;

    /* renamed from: g, reason: collision with root package name */
    public ro1 f61528g;

    public c(eg.f fVar, bg.c cVar, String str, String str2, String str3) {
        this.f61522a = fVar;
        this.f61523b = cVar;
        this.f61524c = str;
        this.f61525d = str2;
        this.f61526e = str3;
    }

    public final void a(Context context) {
        BannerAdSize inlineAdaptive;
        b bVar = new b(this);
        MediationInfo mediationInfo = new MediationInfo(MolocoMediationAdapter.MEDIATION_PLATFORM_NAME);
        bg.c adSize = this.f61523b;
        Intrinsics.g(adSize, "adSize");
        int i5 = adSize.f17875a;
        int i11 = adSize.f17876b;
        if (i11 == 0) {
            inlineAdaptive = new BannerAdSize.InlineAdaptive(Integer.valueOf(i5));
        } else if (adSize.equals(bg.c.f17872f)) {
            inlineAdaptive = BannerAdSize.Standard.INSTANCE;
        } else if (adSize.equals(bg.c.f17874h)) {
            inlineAdaptive = BannerAdSize.MREC.INSTANCE;
        } else if (adSize.equals(bg.c.f17873g)) {
            inlineAdaptive = BannerAdSize.Tablet.INSTANCE;
        } else {
            if (i11 != z2.y(context, i5, 0).f17876b && i11 != z2.y(context, i5, 1).f17876b) {
                if (i11 != z2.y(context, i5, 2).f17876b) {
                    inlineAdaptive = new BannerAdSize.InlineAdaptive(Integer.valueOf(i5));
                }
            }
            inlineAdaptive = new BannerAdSize.AnchoredAdaptive(Integer.valueOf(i5));
        }
        Moloco.createMolocoBanner(mediationInfo, this.f61524c, inlineAdaptive, this.f61526e, bVar);
    }

    @Override // eg.k
    public final View c() {
        Banner banner = this.f61527f;
        if (banner != null) {
            return banner;
        }
        Intrinsics.m("molocoAd");
        throw null;
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdClicked(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        ro1 ro1Var = this.f61528g;
        if (ro1Var != null) {
            ro1Var.reportAdClicked();
            ro1Var.onAdOpened();
            ro1Var.f9260a.a();
        }
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdHidden(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        ro1 ro1Var = this.f61528g;
        if (ro1Var != null) {
            ro1Var.f9260a.b();
        }
    }

    @Override // com.moloco.sdk.publisher.AdLoad.Listener
    public final void onAdLoadFailed(MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        this.f61522a.onFailure(new bg.a(molocoAdError.getErrorType().getErrorCode(), molocoAdError.getErrorType().getDescription(), "com.moloco.sdk"));
    }

    @Override // com.moloco.sdk.publisher.AdLoad.Listener
    public final void onAdLoadSuccess(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        this.f61528g = (ro1) this.f61522a.onSuccess(this);
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdShowFailed(MolocoAdError molocoAdError) {
        Intrinsics.g(molocoAdError, "molocoAdError");
        this.f61522a.onFailure(new bg.a(molocoAdError.getErrorType().getErrorCode(), molocoAdError.getErrorType().getDescription(), "com.moloco.sdk"));
    }

    @Override // com.moloco.sdk.publisher.AdShowListener
    public final void onAdShowSuccess(MolocoAd molocoAd) {
        Intrinsics.g(molocoAd, "molocoAd");
        ro1 ro1Var = this.f61528g;
        if (ro1Var != null) {
            ro1Var.reportAdImpression();
        }
    }
}
