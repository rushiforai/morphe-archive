package kd;

import android.content.Context;
import android.util.Log;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAd;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerRequest;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerSize;
import com.google.ads.mediation.pangle.PangleMediationAdapter;

/* loaded from: classes3.dex */
public final class e implements jd.b {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ eg.l f71339a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f71340b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ String f71341c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ String f71342d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ f f71343e;

    public e(f fVar, eg.l lVar, Context context, String str, String str2) {
        this.f71343e = fVar;
        this.f71339a = lVar;
        this.f71340b = context;
        this.f71341c = str;
        this.f71342d = str2;
    }

    @Override // jd.b
    public final void a(bg.a aVar) {
        Log.w(PangleMediationAdapter.TAG, aVar.toString());
        this.f71343e.f71344a.onFailure(aVar);
    }

    @Override // jd.b
    public final void b() {
        PAGBannerSize currentOrientationAnchoredAdaptiveBannerAdSize;
        eg.l lVar = this.f71339a;
        bg.c cVar = lVar.f52722h;
        Context context = this.f71340b;
        if (cVar != null) {
            int i5 = cVar.f17876b;
            int i11 = cVar.f17875a;
            currentOrientationAnchoredAdaptiveBannerAdSize = PAGBannerSize.BANNER_W_320_H_50;
            if (i11 != currentOrientationAnchoredAdaptiveBannerAdSize.getWidth() || i5 != currentOrientationAnchoredAdaptiveBannerAdSize.getHeight()) {
                currentOrientationAnchoredAdaptiveBannerAdSize = PAGBannerSize.BANNER_W_300_H_250;
                if (i11 != currentOrientationAnchoredAdaptiveBannerAdSize.getWidth() || i5 != currentOrientationAnchoredAdaptiveBannerAdSize.getHeight()) {
                    currentOrientationAnchoredAdaptiveBannerAdSize = PAGBannerSize.BANNER_W_728_H_90;
                    if (i11 != currentOrientationAnchoredAdaptiveBannerAdSize.getWidth() || i5 != currentOrientationAnchoredAdaptiveBannerAdSize.getHeight()) {
                        currentOrientationAnchoredAdaptiveBannerAdSize = PAGBannerSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(context, i11);
                        if (i11 != currentOrientationAnchoredAdaptiveBannerAdSize.getWidth() || i5 != currentOrientationAnchoredAdaptiveBannerAdSize.getHeight()) {
                            currentOrientationAnchoredAdaptiveBannerAdSize = PAGBannerSize.getInlineAdaptiveBannerAdSize(i11, i5);
                        }
                    }
                }
            }
        } else {
            currentOrientationAnchoredAdaptiveBannerAdSize = null;
        }
        f fVar = this.f71343e;
        if (currentOrientationAnchoredAdaptiveBannerAdSize == null) {
            bg.a aVar = new bg.a(102, "Failed to request banner ad from Pangle. Invalid banner size.", "com.google.ads.mediation.pangle");
            Log.w(PangleMediationAdapter.TAG, aVar.toString());
            fVar.f71344a.onFailure(aVar);
            return;
        }
        fVar.f71349f = new FrameLayout(context);
        fVar.f71347d.getClass();
        PAGBannerRequest pAGBannerRequest = new PAGBannerRequest(currentOrientationAnchoredAdaptiveBannerAdSize);
        String str = this.f71341c;
        pAGBannerRequest.setAdString(str);
        wh.f.Y(pAGBannerRequest, str, lVar);
        jd.e eVar = fVar.f71346c;
        d dVar = new d(this);
        eVar.getClass();
        PAGBannerAd.loadAd(this.f71342d, pAGBannerRequest, dVar);
    }
}
