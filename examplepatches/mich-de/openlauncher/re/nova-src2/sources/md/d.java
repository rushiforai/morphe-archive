package md;

import ads_mobile_sdk.to1;
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
import eg.p;
import eg.q;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes3.dex */
public abstract class d implements p, InterstitialAdListener {

    /* renamed from: a, reason: collision with root package name */
    public final f f76224a;

    /* renamed from: b, reason: collision with root package name */
    public final ld.a f76225b;

    /* renamed from: c, reason: collision with root package name */
    public InterstitialAd f76226c;

    /* renamed from: d, reason: collision with root package name */
    public to1 f76227d;

    /* renamed from: e, reason: collision with root package name */
    public String f76228e;

    public d(f mediationAdLoadCallback, ld.a vungleFactory) {
        Intrinsics.g(mediationAdLoadCallback, "mediationAdLoadCallback");
        Intrinsics.g(vungleFactory, "vungleFactory");
        this.f76224a = mediationAdLoadCallback;
        this.f76225b = vungleFactory;
    }

    public abstract String a(q qVar);

    public abstract void b(AdConfig adConfig, q qVar);

    public final void c(q mediationInterstitialAdConfiguration) {
        Intrinsics.g(mediationInterstitialAdConfiguration, "mediationInterstitialAdConfiguration");
        Bundle bundle = mediationInterstitialAdConfiguration.f52729e;
        Intrinsics.f(bundle, "getMediationExtras(...)");
        Bundle bundle2 = mediationInterstitialAdConfiguration.f52728d;
        Intrinsics.f(bundle2, "getServerParameters(...)");
        String string = bundle2.getString("appid");
        f fVar = this.f76224a;
        if (string == null || string.length() == 0) {
            bg.a aVar = new bg.a(101, "Failed to load interstitial ad from Liftoff Monetize. Missing or invalid App ID.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.w(VungleMediationAdapter.TAG, aVar.toString());
            fVar.onFailure(aVar);
            return;
        }
        String string2 = bundle2.getString("placementID");
        if (string2 == null || string2.length() == 0) {
            bg.a aVar2 = new bg.a(101, "Failed to load interstitial ad from Liftoff Monetize. Missing or Invalid Placement ID.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.w(VungleMediationAdapter.TAG, aVar2.toString());
            fVar.onFailure(aVar2);
        } else {
            this.f76228e = string2;
            Context context = mediationInterstitialAdConfiguration.f52726b;
            Intrinsics.f(context, "getContext(...)");
            ld.c.f74856c.a(string, context, new a(this, bundle, mediationInterstitialAdConfiguration, context, string2, 2));
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdClicked(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        to1 to1Var = this.f76227d;
        if (to1Var == null || to1Var == null) {
            return;
        }
        to1Var.reportAdClicked();
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdEnd(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        to1 to1Var = this.f76227d;
        if (to1Var == null || to1Var == null) {
            return;
        }
        to1Var.onAdClosed();
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToLoad(BaseAd baseAd, VungleError adError) {
        Intrinsics.g(baseAd, "baseAd");
        Intrinsics.g(adError, "adError");
        bg.a adError2 = VungleMediationAdapter.getAdError(adError);
        Intrinsics.f(adError2, "getAdError(...)");
        Log.w(VungleMediationAdapter.TAG, adError2.toString());
        this.f76224a.onFailure(adError2);
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToPlay(BaseAd baseAd, VungleError adError) {
        Intrinsics.g(baseAd, "baseAd");
        Intrinsics.g(adError, "adError");
        bg.a adError2 = VungleMediationAdapter.getAdError(adError);
        Intrinsics.f(adError2, "getAdError(...)");
        Log.w(VungleMediationAdapter.TAG, adError2.toString());
        to1 to1Var = this.f76227d;
        if (to1Var != null) {
            to1Var.f10019a.a(adError2);
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdImpression(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        to1 to1Var = this.f76227d;
        if (to1Var == null || to1Var == null) {
            return;
        }
        to1Var.reportAdImpression();
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLeftApplication(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        to1 to1Var = this.f76227d;
        if (to1Var != null) {
            to1Var.f10019a.a();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLoaded(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        this.f76227d = (to1) this.f76224a.onSuccess(this);
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdStart(BaseAd baseAd) {
        Intrinsics.g(baseAd, "baseAd");
        to1 to1Var = this.f76227d;
        if (to1Var == null || to1Var == null) {
            return;
        }
        to1Var.onAdOpened();
    }

    @Override // eg.p
    public final void showAd(Context context) {
        InterstitialAd interstitialAd = this.f76226c;
        if (interstitialAd != null) {
            interstitialAd.play(context);
            return;
        }
        bg.a aVar = new bg.a(107, "Failed to show interstitial ad from Liftoff Monetize.", VungleMediationAdapter.ERROR_DOMAIN);
        Log.w(VungleMediationAdapter.TAG, aVar.toString());
        to1 to1Var = this.f76227d;
        if (to1Var != null) {
            to1Var.f10019a.a(aVar);
        }
        VungleMediationLogger.logError(null, "Interstitial ad instance is null: " + this.f76228e);
    }
}
