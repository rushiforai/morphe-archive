package nd;

import ads_mobile_sdk.vo1;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import com.google.ads.mediation.vungle.VungleMediationAdapter;
import com.google.android.libraries.ads.mobile.sdk.nativead.NativeAdAssetNames;
import com.vungle.ads.BaseAd;
import com.vungle.ads.NativeAd;
import com.vungle.ads.NativeAdListener;
import com.vungle.ads.VungleError;
import com.vungle.ads.internal.ui.view.MediaView;
import eg.s;
import eg.z;
import java.util.ArrayList;
import java.util.Map;
import kd.j;
import ni.o;

/* loaded from: classes3.dex */
public final class e extends z implements NativeAdListener {

    /* renamed from: m, reason: collision with root package name */
    public final eg.f f78207m;
    public vo1 n;
    public NativeAd o;

    /* renamed from: p, reason: collision with root package name */
    public MediaView f78208p;

    /* renamed from: q, reason: collision with root package name */
    public String f78209q;

    /* renamed from: r, reason: collision with root package name */
    public final ld.a f78210r;

    public e(eg.f fVar, ld.a aVar) {
        this.f78207m = fVar;
        this.f78210r = aVar;
    }

    @Override // eg.z
    public final void a(o oVar, Map map) {
        if (this.o == null) {
            return;
        }
        View childAt = oVar.getChildAt(oVar.getChildCount() - 1);
        if (childAt instanceof FrameLayout) {
            ArrayList arrayList = new ArrayList();
            KeyEvent.Callback callback = null;
            for (Map.Entry entry : map.entrySet()) {
                arrayList.add((View) entry.getValue());
                if (((String) entry.getKey()).equals(NativeAdAssetNames.ASSET_ICON)) {
                    callback = (View) entry.getValue();
                } else if (((String) entry.getKey()).equals(NativeAdAssetNames.ASSET_MEDIA_CONTENT)) {
                    arrayList.add(this.f78208p);
                }
            }
            this.o.registerViewForInteraction((FrameLayout) childAt, this.f78208p, callback instanceof ImageView ? (ImageView) callback : null, arrayList);
        }
    }

    @Override // eg.z
    public final void b(o oVar) {
        NativeAd nativeAd = this.o;
        if (nativeAd == null) {
            return;
        }
        nativeAd.unregisterView();
    }

    public final void c(s sVar) {
        int i5;
        int i11;
        Bundle bundle = sVar.f52735d;
        hg.b bVar = sVar.f52740i;
        bg.g gVar = bVar.f59854b;
        Context context = sVar.f52733b;
        String string = bundle.getString("appid");
        boolean zIsEmpty = TextUtils.isEmpty(string);
        eg.f fVar = this.f78207m;
        if (zIsEmpty) {
            fVar.onFailure(new bg.a(101, "Failed to load bidding native ad from Liftoff Monetize. Missing or invalid app ID configured for this ad source instance in the AdMob or Ad Manager UI.", VungleMediationAdapter.ERROR_DOMAIN));
            return;
        }
        String string2 = bundle.getString("placementID");
        if (TextUtils.isEmpty(string2)) {
            fVar.onFailure(new bg.a(101, "Failed to load bidding native ad from Liftoff Monetize. Missing or Invalid placement ID configured for this ad source instance in the AdMob or Ad Manager UI.", VungleMediationAdapter.ERROR_DOMAIN));
            return;
        }
        this.f78209q = sVar.f52734c;
        int i12 = bVar.f59853a;
        if (i12 != 0) {
            i5 = 3;
            if (i12 != 2) {
                if (i12 != 3) {
                    i5 = 1;
                } else {
                    i11 = 2;
                }
            }
            ld.c.f74856c.a(string, context, new d(this, context, string2, i11, gVar, sVar.f52739h));
        }
        i5 = 0;
        i11 = i5;
        ld.c.f74856c.a(string, context, new d(this, context, string2, i11, gVar, sVar.f52739h));
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdClicked(BaseAd baseAd) {
        vo1 vo1Var = this.n;
        if (vo1Var != null) {
            vo1Var.reportAdClicked();
            this.n.onAdOpened();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdEnd(BaseAd baseAd) {
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToLoad(BaseAd baseAd, VungleError vungleError) {
        this.f78207m.onFailure(VungleMediationAdapter.getAdError(vungleError));
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdFailedToPlay(BaseAd baseAd, VungleError vungleError) {
        Log.w(VungleMediationAdapter.TAG, VungleMediationAdapter.getAdError(vungleError).toString());
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdImpression(BaseAd baseAd) {
        vo1 vo1Var = this.n;
        if (vo1Var != null) {
            vo1Var.reportAdImpression();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLeftApplication(BaseAd baseAd) {
        vo1 vo1Var = this.n;
        if (vo1Var != null) {
            vo1Var.onAdLeftApplication();
        }
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdLoaded(BaseAd baseAd) {
        this.f52761a = this.o.getAdTitle();
        this.f52762b = this.o.getAdBodyText();
        this.f52764d = this.o.getAdCallToActionText();
        this.o.getAdStarRating();
        this.f52765e = this.o.getAdSponsoredText();
        this.f52766f = this.o.hasVideoContent();
        MediaView mediaView = this.f78208p;
        this.f52768h = mediaView;
        mediaView.setNativeVideoListener(new je.f(this, 21));
        String appIcon = this.o.getAppIcon();
        if (!TextUtils.isEmpty(appIcon) && appIcon.startsWith("file://")) {
            Uri uri = Uri.parse(appIcon);
            j jVar = new j();
            jVar.f71359f = uri;
            this.f52763c = jVar;
        }
        this.f52772l = this.o.getMediaAspectRatio();
        if (VungleMediationAdapter.runtimeGmaSdkListensToAdapterReportedImpressions()) {
            this.f52770j = true;
        }
        this.f52771k = true;
        this.n = (vo1) this.f78207m.onSuccess(this);
    }

    @Override // com.vungle.ads.BaseAdListener
    public final void onAdStart(BaseAd baseAd) {
    }
}
