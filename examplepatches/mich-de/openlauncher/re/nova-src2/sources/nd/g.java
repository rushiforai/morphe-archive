package nd;

import ads_mobile_sdk.xo1;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import com.google.ads.mediation.vungle.VungleMediationAdapter;
import com.vungle.ads.AdConfig;
import com.vungle.ads.BaseAd;
import com.vungle.ads.RewardedAd;
import com.vungle.ads.RewardedAdListener;
import com.vungle.ads.VungleError;
import com.vungle.ads.VungleMediationLogger;
import eg.u;
import eg.v;
import eg.w;

/* loaded from: classes3.dex */
public final class g implements u, RewardedAdListener {

    /* renamed from: a, reason: collision with root package name */
    public final eg.f f78217a;

    /* renamed from: b, reason: collision with root package name */
    public v f78218b;

    /* renamed from: c, reason: collision with root package name */
    public RewardedAd f78219c;

    /* renamed from: d, reason: collision with root package name */
    public String f78220d;

    /* renamed from: e, reason: collision with root package name */
    public final ld.a f78221e;

    public g(eg.f fVar, ld.a aVar) {
        this.f78217a = fVar;
        this.f78221e = aVar;
    }

    public final void a(w wVar) {
        Bundle bundle = wVar.f52744e;
        Bundle bundle2 = wVar.f52743d;
        String string = bundle.getString("userId");
        String string2 = bundle2.getString("appid");
        boolean zIsEmpty = TextUtils.isEmpty(string2);
        eg.f fVar = this.f78217a;
        if (zIsEmpty) {
            bg.a aVar = new bg.a(101, "Failed to load bidding rewarded ad from Liftoff Monetize. Missing or invalid App ID configured for this ad source instance in the AdMob or Ad Manager UI.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.w(VungleMediationAdapter.TAG, aVar.toString());
            fVar.onFailure(aVar);
            return;
        }
        String string3 = bundle2.getString("placementID");
        if (TextUtils.isEmpty(string3)) {
            bg.a aVar2 = new bg.a(101, "Failed to load bidding rewarded ad from Liftoff Monetize. Missing or invalid Placement ID configured for this ad source instance in the AdMob or Ad Manager UI.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.w(VungleMediationAdapter.TAG, aVar2.toString());
            fVar.onFailure(aVar2);
            return;
        }
        this.f78220d = string3;
        String str = wVar.f52742c;
        this.f78221e.getClass();
        AdConfig adConfig = new AdConfig();
        if (bundle.containsKey("adOrientation")) {
            adConfig.setAdOrientation(bundle.getInt("adOrientation", 2));
        }
        String str2 = wVar.f52747h;
        if (!TextUtils.isEmpty(str2)) {
            adConfig.setWatermark(str2);
        }
        Context context = wVar.f52741b;
        ld.c.f74856c.a(string2, context, new f(this, context, string3, adConfig, string, str));
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdClicked(BaseAd baseAd) {
        v vVar = this.f78218b;
        if (vVar != null) {
            ((xo1) vVar).reportAdClicked();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdEnd(BaseAd baseAd) {
        v vVar = this.f78218b;
        if (vVar != null) {
            ((xo1) vVar).onAdClosed();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToLoad(BaseAd baseAd, VungleError vungleError) {
        bg.a adError = VungleMediationAdapter.getAdError(vungleError);
        Log.w(VungleMediationAdapter.TAG, adError.toString());
        this.f78217a.onFailure(adError);
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToPlay(BaseAd baseAd, VungleError vungleError) {
        bg.a adError = VungleMediationAdapter.getAdError(vungleError);
        Log.w(VungleMediationAdapter.TAG, adError.toString());
        v vVar = this.f78218b;
        if (vVar != null) {
            ((xo1) vVar).f11791a.a(adError);
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdImpression(BaseAd baseAd) {
        v vVar = this.f78218b;
        if (vVar != null) {
            ((xo1) vVar).f11791a.a();
            ((xo1) this.f78218b).reportAdImpression();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLeftApplication(BaseAd baseAd) {
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLoaded(BaseAd baseAd) {
        this.f78218b = (v) this.f78217a.onSuccess(this);
    }

    @Override // com.vungle.ads.RewardedAdListener
    public final void onAdRewarded(BaseAd baseAd) {
        v vVar = this.f78218b;
        if (vVar != null) {
            ((xo1) vVar).f11791a.f();
            ((xo1) this.f78218b).onUserEarnedReward();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdStart(BaseAd baseAd) {
        v vVar = this.f78218b;
        if (vVar != null) {
            ((xo1) vVar).onAdOpened();
        }
    }

    @Override // eg.u
    public final void showAd(Context context) {
        RewardedAd rewardedAd = this.f78219c;
        if (rewardedAd != null) {
            rewardedAd.play(context);
            return;
        }
        if (this.f78218b != null) {
            bg.a aVar = new bg.a(107, "Failed to show bidding rewardedad from Liftoff Monetize.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.w(VungleMediationAdapter.TAG, aVar.toString());
            ((xo1) this.f78218b).f11791a.a(aVar);
        }
        VungleMediationLogger.logError(null, "Rewarded ad instance is null: " + this.f78220d);
    }
}
