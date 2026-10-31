package com.vungle.ads.internal;

import com.vungle.ads.BaseFullscreenAd;
import com.vungle.ads.VungleError;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x0 extends com.vungle.ads.internal.presenter.c {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ y0 f47735b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public x0(BaseFullscreenAd.AnonymousClass2 anonymousClass2, y0 y0Var) {
        super(anonymousClass2);
        this.f47735b = y0Var;
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdEnd(String str) {
        this.f47735b.a(h.f46848f);
        this.f47358a.onAdEnd(str);
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdImpression(String str) {
        this.f47735b.a(h.f46847e);
        this.f47358a.onAdImpression(str);
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdStart(String str) throws Throwable {
        this.f47735b.a(h.f46846d);
        this.f47735b.f47471l.d();
        AnalyticsClient analyticsClient = AnalyticsClient.INSTANCE;
        y0 y0Var = this.f47735b;
        q1 q1Var = y0Var.f47471l;
        analyticsClient.a(q1Var, y0Var.f47472m, q1Var.f46813b);
        this.f47358a.onAdStart(str);
    }

    @Override // com.vungle.ads.internal.presenter.c, com.vungle.ads.internal.presenter.b
    public final void onFailure(VungleError error) {
        Intrinsics.g(error, "error");
        this.f47735b.a(h.f46849g);
        super.onFailure(error);
    }
}
