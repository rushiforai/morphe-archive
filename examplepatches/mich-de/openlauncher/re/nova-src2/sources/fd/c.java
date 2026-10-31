package fd;

import ads_mobile_sdk.xo1;
import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import b.i8;
import com.facebook.ads.Ad;
import com.facebook.ads.AdError;
import com.facebook.ads.AdExperienceType;
import com.facebook.ads.ExtraHints;
import com.facebook.ads.RewardedVideoAd;
import com.facebook.ads.RewardedVideoAdExtendedListener;
import com.google.ads.mediation.facebook.FacebookMediationAdapter;
import eg.f;
import eg.u;
import eg.v;
import eg.w;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes3.dex */
public class c implements u, RewardedVideoAdExtendedListener {

    /* renamed from: a, reason: collision with root package name */
    public final f f54664a;

    /* renamed from: b, reason: collision with root package name */
    public RewardedVideoAd f54665b;

    /* renamed from: d, reason: collision with root package name */
    public v f54667d;

    /* renamed from: f, reason: collision with root package name */
    public final i8 f54669f;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicBoolean f54666c = new AtomicBoolean();

    /* renamed from: e, reason: collision with root package name */
    public final AtomicBoolean f54668e = new AtomicBoolean();

    public c(f fVar, i8 i8Var) {
        this.f54664a = fVar;
        this.f54669f = i8Var;
    }

    public AdExperienceType a() {
        return AdExperienceType.AD_EXPERIENCE_TYPE_REWARDED;
    }

    public final void b(w wVar) {
        Context context = wVar.f52741b;
        String str = wVar.f52747h;
        String placementId = FacebookMediationAdapter.getPlacementId(wVar.f52743d);
        if (TextUtils.isEmpty(placementId)) {
            bg.a aVar = new bg.a(101, "Failed to request ad. PlacementID is null or empty.", FacebookMediationAdapter.ERROR_DOMAIN);
            Log.e(FacebookMediationAdapter.TAG, "Failed to request ad. PlacementID is null or empty.");
            this.f54664a.onFailure(aVar);
            return;
        }
        FacebookMediationAdapter.setMixedAudience(wVar);
        this.f54669f.getClass();
        this.f54665b = new RewardedVideoAd(context, placementId);
        if (!TextUtils.isEmpty(str)) {
            this.f54665b.setExtraHints(new ExtraHints.Builder().mediationData(str).build());
        }
        RewardedVideoAd rewardedVideoAd = this.f54665b;
        rewardedVideoAd.loadAd(rewardedVideoAd.buildLoadAdConfig().withAdListener(this).withBid(wVar.f52742c).withAdExperience(a()).build());
    }

    @Override // com.facebook.ads.AdListener
    public final void onAdClicked(Ad ad) {
        v vVar = this.f54667d;
        if (vVar != null) {
            ((xo1) vVar).reportAdClicked();
        }
    }

    @Override // com.facebook.ads.AdListener
    public final void onAdLoaded(Ad ad) {
        f fVar = this.f54664a;
        if (fVar != null) {
            this.f54667d = (v) fVar.onSuccess(this);
        }
    }

    @Override // com.facebook.ads.AdListener
    public final void onError(Ad ad, AdError adError) {
        bg.a adError2 = FacebookMediationAdapter.getAdError(adError);
        Log.w(FacebookMediationAdapter.TAG, adError2.f17862b);
        if (this.f54666c.get()) {
            v vVar = this.f54667d;
            if (vVar != null) {
                ((xo1) vVar).f11791a.a(adError2);
            }
        } else {
            f fVar = this.f54664a;
            if (fVar != null) {
                fVar.onFailure(adError2);
            }
        }
        this.f54665b.destroy();
    }

    @Override // com.facebook.ads.AdListener
    public final void onLoggingImpression(Ad ad) {
        v vVar = this.f54667d;
        if (vVar != null) {
            ((xo1) vVar).reportAdImpression();
        }
    }

    @Override // com.facebook.ads.RewardedVideoAdExtendedListener
    public final void onRewardedVideoActivityDestroyed() {
        v vVar;
        if (!this.f54668e.getAndSet(true) && (vVar = this.f54667d) != null) {
            ((xo1) vVar).onAdClosed();
        }
        RewardedVideoAd rewardedVideoAd = this.f54665b;
        if (rewardedVideoAd != null) {
            rewardedVideoAd.destroy();
        }
    }

    @Override // com.facebook.ads.RewardedVideoAdListener
    public final void onRewardedVideoClosed() {
        v vVar;
        if (!this.f54668e.getAndSet(true) && (vVar = this.f54667d) != null) {
            ((xo1) vVar).onAdClosed();
        }
        RewardedVideoAd rewardedVideoAd = this.f54665b;
        if (rewardedVideoAd != null) {
            rewardedVideoAd.destroy();
        }
    }

    @Override // com.facebook.ads.RewardedVideoAdListener
    public final void onRewardedVideoCompleted() {
        ((xo1) this.f54667d).f11791a.f();
        ((xo1) this.f54667d).onUserEarnedReward();
    }

    @Override // eg.u
    public final void showAd(Context context) {
        this.f54666c.set(true);
        if (this.f54665b.show()) {
            v vVar = this.f54667d;
            if (vVar != null) {
                ((xo1) vVar).f11791a.a();
                ((xo1) this.f54667d).onAdOpened();
                return;
            }
            return;
        }
        bg.a aVar = new bg.a(110, "Failed to present rewarded ad.", FacebookMediationAdapter.ERROR_DOMAIN);
        Log.w(FacebookMediationAdapter.TAG, "Failed to present rewarded ad.");
        v vVar2 = this.f54667d;
        if (vVar2 != null) {
            ((xo1) vVar2).f11791a.a(aVar);
        }
        this.f54665b.destroy();
    }
}
