package com.vungle.ads.internal.network;

/* loaded from: classes4.dex */
public final class x implements a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.vungle.ads.internal.w f47293a;

    public x(com.vungle.ads.internal.x xVar) {
        this.f47293a = xVar;
    }

    @Override // com.vungle.ads.internal.network.a
    public final void a(o oVar) {
        this.f47293a.onSuccess();
    }

    @Override // com.vungle.ads.internal.network.a
    public final void a(Throwable th2) {
        this.f47293a.a();
    }
}
