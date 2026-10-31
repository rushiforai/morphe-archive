package com.vungle.ads.internal.network;

/* loaded from: classes4.dex */
public final class y implements a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.vungle.ads.internal.w f47294a;

    public y(com.vungle.ads.internal.y yVar) {
        this.f47294a = yVar;
    }

    @Override // com.vungle.ads.internal.network.a
    public final void a(o oVar) {
        this.f47294a.onSuccess();
    }

    @Override // com.vungle.ads.internal.network.a
    public final void a(Throwable th2) {
        this.f47294a.a();
    }
}
