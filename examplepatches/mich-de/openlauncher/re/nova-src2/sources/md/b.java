package md;

import ads_mobile_sdk.po1;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.google.ads.mediation.vungle.VungleMediationAdapter;
import com.vungle.ads.AdConfig;
import com.vungle.ads.BaseAd;
import com.vungle.ads.InterstitialAd;
import com.vungle.ads.InterstitialAdListener;
import com.vungle.ads.VungleError;
import com.vungle.ads.VungleMediationLogger;
import eg.f;
import eg.i;
import eg.j;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class b implements i, InterstitialAdListener {

    /* renamed from: a, reason: collision with root package name */
    public final f f76215a;

    /* renamed from: b, reason: collision with root package name */
    public final ld.a f76216b;

    /* renamed from: c, reason: collision with root package name */
    public InterstitialAd f76217c;

    /* renamed from: d, reason: collision with root package name */
    public po1 f76218d;

    /* renamed from: e, reason: collision with root package name */
    public String f76219e;

    public b(f mediationAdLoadCallback, ld.a vungleFactory) {
        Intrinsics.g(mediationAdLoadCallback, "mediationAdLoadCallback");
        Intrinsics.g(vungleFactory, "vungleFactory");
        this.f76215a = mediationAdLoadCallback;
        this.f76216b = vungleFactory;
    }

    public abstract String a(j jVar);

    public abstract void b(AdConfig adConfig, j jVar);

    public final void c(j mediationAppOpenAdConfiguration) {
        Intrinsics.g(mediationAppOpenAdConfiguration, "mediationAppOpenAdConfiguration");
        Bundle bundle = mediationAppOpenAdConfiguration.f52712e;
        Intrinsics.f(bundle, "getMediationExtras(...)");
        Bundle bundle2 = mediationAppOpenAdConfiguration.f52711d;
        Intrinsics.f(bundle2, "getServerParameters(...)");
        String string = bundle2.getString("appid");
        f fVar = this.f76215a;
        if (string == null || string.length() == 0) {
            bg.a aVar = new bg.a(101, "Failed to load app open ad from Liftoff Monetize. Missing or invalid App ID configured for this ad source instance in the AdMob or Ad Manager UI.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.w(VungleMediationAdapter.TAG, aVar.toString());
            fVar.onFailure(aVar);
            return;
        }
        String string2 = bundle2.getString("placementID");
        if (string2 == null || string2.length() == 0) {
            bg.a aVar2 = new bg.a(101, "Failed to load app open ad from Liftoff Monetize. Missing or Invalid Placement ID configured for this ad source instance in the AdMob or Ad Manager UI.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.w(VungleMediationAdapter.TAG, aVar2.toString());
            fVar.onFailure(aVar2);
        } else {
            this.f76219e = string2;
            Context context = mediationAppOpenAdConfiguration.f52709b;
            Intrinsics.f(context, "getContext(...)");
            ld.c.f74856c.a(string, context, new a(this, bundle, mediationAppOpenAdConfiguration, context, string2, 0));
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdClicked(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        po1 po1Var = this.f76218d;
        if (po1Var == null || po1Var == null) {
            return;
        }
        po1Var.reportAdClicked();
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdEnd(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        po1 po1Var = this.f76218d;
        if (po1Var != null) {
            po1Var.f8345a.b();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToLoad(BaseAd baseAd, VungleError adError) {
        Intrinsics.g(baseAd, "baseAd");
        Intrinsics.g(adError, "adError");
        bg.a adError2 = VungleMediationAdapter.getAdError(adError);
        Intrinsics.f(adError2, "getAdError(...)");
        Log.w(VungleMediationAdapter.TAG, adError2.toString());
        this.f76215a.onFailure(adError2);
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToPlay(BaseAd baseAd, VungleError adError) {
        Intrinsics.g(baseAd, "baseAd");
        Intrinsics.g(adError, "adError");
        bg.a adError2 = VungleMediationAdapter.getAdError(adError);
        Intrinsics.f(adError2, "getAdError(...)");
        Log.w(VungleMediationAdapter.TAG, adError2.toString());
        po1 po1Var = this.f76218d;
        if (po1Var != null) {
            po1Var.f8345a.a(adError2);
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdImpression(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        po1 po1Var = this.f76218d;
        if (po1Var == null || po1Var == null) {
            return;
        }
        po1Var.reportAdImpression();
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLeftApplication(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLoaded(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        this.f76218d = (po1) this.f76215a.onSuccess(this);
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdStart(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        po1 po1Var = this.f76218d;
        if (po1Var == null || po1Var == null) {
            return;
        }
        po1Var.onAdOpened();
    }

    @Override // eg.i
    public final void showAd(Context context) {
        InterstitialAd interstitialAd = this.f76217c;
        if (interstitialAd != null) {
            interstitialAd.play(context);
            return;
        }
        bg.a aVar = new bg.a(107, "Failed to show app open ad from Liftoff Monetize.", VungleMediationAdapter.ERROR_DOMAIN);
        Log.w(VungleMediationAdapter.TAG, aVar.toString());
        po1 po1Var = this.f76218d;
        if (po1Var != null) {
            po1Var.f8345a.a(aVar);
        }
        VungleMediationLogger.logError(null, "AppOpen ad instance is null: " + this.f76219e);
    }
}
