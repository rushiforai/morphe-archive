package kd;

import ads_mobile_sdk.ro1;
import android.content.Context;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdInteractionListener;
import com.google.ads.mediation.pangle.PangleMediationAdapter;

/* loaded from: classes3.dex */
public final class f implements eg.k, PAGBannerAdInteractionListener {

    /* renamed from: a, reason: collision with root package name */
    public final eg.f f71344a;

    /* renamed from: b, reason: collision with root package name */
    public final jd.c f71345b;

    /* renamed from: c, reason: collision with root package name */
    public final jd.e f71346c;

    /* renamed from: d, reason: collision with root package name */
    public final jd.a f71347d;

    /* renamed from: e, reason: collision with root package name */
    public ro1 f71348e;

    /* renamed from: f, reason: collision with root package name */
    public FrameLayout f71349f;

    public f(eg.f fVar, jd.c cVar, jd.e eVar, jd.a aVar) {
        this.f71344a = fVar;
        this.f71345b = cVar;
        this.f71346c = eVar;
        this.f71347d = aVar;
    }

    public final void a(eg.l lVar) {
        Bundle bundle = lVar.f52718d;
        String string = bundle.getString("placementid");
        if (TextUtils.isEmpty(string)) {
            bg.a aVar = new bg.a(101, "Failed to load banner ad from Pangle. Missing or invalid Placement ID.", "com.google.ads.mediation.pangle");
            Log.e(PangleMediationAdapter.TAG, aVar.toString());
            this.f71344a.onFailure(aVar);
        } else {
            String str = lVar.f52717c;
            Context context = lVar.f52716b;
            this.f71345b.a(context, bundle.getString("appid"), new e(this, lVar, context, str, string));
        }
    }

    @Override // eg.k
    public final View c() {
        return this.f71349f;
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public final void onAdClicked() {
        ro1 ro1Var = this.f71348e;
        if (ro1Var != null) {
            ro1Var.reportAdClicked();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public final void onAdDismissed() {
    }

    @Override // com.bytedance.sdk.openadsdk.api.PAGAdListener
    public final void onAdShowed() {
        ro1 ro1Var = this.f71348e;
        if (ro1Var != null) {
            ro1Var.reportAdImpression();
        }
    }
}
