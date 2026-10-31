package com.vungle.ads.internal.presenter;

import com.vungle.ads.NetworkUnreachable;

/* loaded from: classes4.dex */
public final class h implements com.vungle.ads.internal.network.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ r f47380a;

    public h(r rVar) {
        this.f47380a = rVar;
    }

    @Override // com.vungle.ads.internal.network.a
    public final void a(com.vungle.ads.internal.network.o oVar) {
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("MRAIDPresenter", "send RI success");
    }

    @Override // com.vungle.ads.internal.network.a
    public final void a(Throwable th2) {
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("MRAIDPresenter", "send RI Failure");
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Error RI API calls: ");
        sbA.append(th2 != null ? th2.getLocalizedMessage() : null);
        new NetworkUnreachable(sbA.toString()).setLogEntry$vungle_ads_release(this.f47380a.b()).logErrorNoReturnValue$vungle_ads_release();
    }
}
