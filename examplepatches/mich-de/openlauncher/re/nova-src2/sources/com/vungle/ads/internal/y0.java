package com.vungle.ads.internal;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import com.vungle.ads.AdNotLoadedCantPlay;
import com.vungle.ads.BaseFullscreenAd;
import com.vungle.ads.VungleAdSize;
import com.vungle.ads.VungleError;
import com.vungle.ads.internal.model.j3;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.ref.WeakReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class y0 extends s {

    /* renamed from: q, reason: collision with root package name */
    public WeakReference f47739q;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public y0(Context context) {
        super(context);
        Intrinsics.g(context, "context");
    }

    @Override // com.vungle.ads.internal.s
    public final boolean a(VungleAdSize vungleAdSize) {
        return true;
    }

    @Override // com.vungle.ads.internal.s
    public final VungleAdSize b() {
        return null;
    }

    public com.vungle.ads.internal.presenter.z m() {
        return null;
    }

    public final void a(Context context, BaseFullscreenAd.AnonymousClass2 adPlayCallback) {
        com.vungle.ads.internal.util.s sVarE;
        Long lA;
        Long lA2;
        Intrinsics.g(adPlayCallback, "adPlayCallback");
        com.vungle.ads.internal.util.s sVarE2 = e();
        if ((sVarE2 != null && (lA2 = sVarE2.a()) != null && lA2.longValue() == 3) || ((sVarE = e()) != null && (lA = sVarE.a()) != null && lA.longValue() == 4)) {
            l();
        }
        g().e();
        this.f47739q = context != null ? new WeakReference(context) : null;
        VungleError vungleErrorA = a(true);
        if (vungleErrorA != null) {
            adPlayCallback.onFailure(vungleErrorA);
            if (a(vungleErrorA.getCom.tiktok.appevents.edp.TTEDPEventConstants.EDP_EVENT_PROPERTY_PAY_CODE java.lang.String())) {
                a(h.f46849g);
                return;
            }
            return;
        }
        com.vungle.ads.internal.model.i0 i0VarC = c();
        j3 j3VarF = f();
        if (i0VarC != null && j3VarF != null) {
            x0 x0Var = new x0(adPlayCallback, this);
            a();
            Handler handler = com.vungle.ads.internal.util.y.f47718a;
            com.vungle.ads.internal.util.y.a(new w0(this, x0Var, i0VarC, j3VarF));
            return;
        }
        adPlayCallback.onFailure(new AdNotLoadedCantPlay("Ad or Placement is null: pl=" + j3VarF + " adv=" + i0VarC).setLogEntry$vungle_ads_release(e()).logError$vungle_ads_release());
    }

    public static final void a(y0 y0Var, x0 x0Var, com.vungle.ads.internal.model.i0 i0Var, j3 j3Var) {
        Context contextD;
        WeakReference weakReference = y0Var.f47739q;
        if (weakReference == null || (contextD = (Context) weakReference.get()) == null) {
            contextD = y0Var.d();
        }
        Intrinsics.f(contextD, "playContext?.get() ?: context");
        com.vungle.ads.internal.presenter.a aVar = new com.vungle.ads.internal.presenter.a(x0Var, j3Var);
        v0 v0Var = new v0(i0Var, j3Var, y0Var.m());
        v0 v0Var2 = com.vungle.ads.internal.ui.l.f47572h;
        com.vungle.ads.internal.ui.a.a(v0Var);
        com.vungle.ads.internal.ui.a.a(aVar);
        Intent intentA = com.vungle.ads.internal.ui.a.a(contextD, j3Var.b(), i0Var.h());
        com.vungle.ads.internal.util.d dVar = com.vungle.ads.internal.util.d.f47677f;
        if (!com.vungle.ads.internal.util.a.a()) {
            boolean z11 = com.vungle.ads.internal.util.u.f47714a;
            com.vungle.ads.internal.util.t.a("FullscreenAdInternal", "The ad activity is in background on play, log AD_VISIBILITY_INVISIBLE.");
            intentA.putExtra("ad_invisible_logged", true);
            AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
            k2 k2Var = new k2(Sdk.SDKMetric.SDKMetricType.AD_VISIBILITY);
            k2Var.a((Long) 1L);
            AnalyticsClient.a(analyticsClient, k2Var, y0Var.e(), 4);
        }
        y0Var.g().d();
        AnalyticsClient.a(AnalyticsClient.INSTANCE, y0Var.g(), y0Var.e());
        y0Var.h().e();
        com.vungle.ads.internal.util.a.a(contextD, null, intentA, null);
    }
}
