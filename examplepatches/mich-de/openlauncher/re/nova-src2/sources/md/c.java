package md;

import ads_mobile_sdk.ro1;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import com.google.ads.mediation.vungle.VungleMediationAdapter;
import com.vungle.ads.BannerAdListener;
import com.vungle.ads.BaseAd;
import com.vungle.ads.VungleAdSize;
import com.vungle.ads.VungleBannerView;
import com.vungle.ads.VungleError;
import eg.f;
import eg.k;
import eg.l;
import java.util.Objects;

/* loaded from: classes3.dex */
public abstract class c implements k, BannerAdListener {

    /* renamed from: a, reason: collision with root package name */
    public final f f76220a;

    /* renamed from: b, reason: collision with root package name */
    public ro1 f76221b;

    /* renamed from: c, reason: collision with root package name */
    public VungleBannerView f76222c;

    /* renamed from: d, reason: collision with root package name */
    public final ld.a f76223d;

    public c(f fVar, ld.a aVar) {
        this.f76220a = fVar;
        this.f76223d = aVar;
    }

    public abstract void a(VungleBannerView vungleBannerView, l lVar);

    public final void b(l lVar) {
        Bundle bundle = lVar.f52718d;
        String string = bundle.getString("appid");
        boolean zIsEmpty = TextUtils.isEmpty(string);
        f fVar = this.f76220a;
        if (zIsEmpty) {
            bg.a aVar = new bg.a(101, "Failed to load bidding banner ad from Liftoff Monetize. Missing or invalid App ID configured for this ad source instance in the AdMob or Ad Manager UI.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.e(VungleMediationAdapter.TAG, "Failed to load bidding banner ad from Liftoff Monetize. Missing or invalid App ID configured for this ad source instance in the AdMob or Ad Manager UI.");
            fVar.onFailure(aVar);
            return;
        }
        String string2 = bundle.getString("placementID");
        if (TextUtils.isEmpty(string2)) {
            bg.a aVar2 = new bg.a(101, "Failed to load bidding banner ad from Liftoff Monetize. Missing or Invalid Placement ID configured for this ad source instance in the AdMob or Ad Manager UI.", VungleMediationAdapter.ERROR_DOMAIN);
            Log.e(VungleMediationAdapter.TAG, "Failed to load bidding banner ad from Liftoff Monetize. Missing or Invalid Placement ID configured for this ad source instance in the AdMob or Ad Manager UI.");
            fVar.onFailure(aVar2);
        } else {
            Context context = lVar.f52716b;
            bg.c cVar = lVar.f52722h;
            VungleAdSize validAdSizeFromSize = VungleAdSize.getValidAdSizeFromSize(cVar.f17875a, cVar.f17876b, string2);
            Objects.toString(validAdSizeFromSize);
            ld.c.f74856c.a(string, context, new a(this, context, string2, validAdSizeFromSize, lVar));
        }
    }

    @Override // eg.k
    public final View c() {
        return this.f76222c;
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdClicked(BaseAd baseAd) {
        ro1 ro1Var = this.f76221b;
        if (ro1Var != null) {
            ro1Var.reportAdClicked();
            this.f76221b.onAdOpened();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdEnd(BaseAd baseAd) {
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToLoad(BaseAd baseAd, VungleError vungleError) {
        bg.a adError = VungleMediationAdapter.getAdError(vungleError);
        Log.w(VungleMediationAdapter.TAG, adError.toString());
        this.f76220a.onFailure(adError);
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToPlay(BaseAd baseAd, VungleError vungleError) {
        Log.w(VungleMediationAdapter.TAG, VungleMediationAdapter.getAdError(vungleError).toString());
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdImpression(BaseAd baseAd) {
        ro1 ro1Var = this.f76221b;
        if (ro1Var != null) {
            ro1Var.reportAdImpression();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLeftApplication(BaseAd baseAd) {
        ro1 ro1Var = this.f76221b;
        if (ro1Var != null) {
            ro1Var.f9260a.a();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLoaded(BaseAd baseAd) {
        this.f76221b = (ro1) this.f76220a.onSuccess(this);
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdStart(BaseAd baseAd) {
    }
}
