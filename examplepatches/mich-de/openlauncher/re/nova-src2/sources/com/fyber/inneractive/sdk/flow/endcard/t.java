package com.fyber.inneractive.sdk.flow.endcard;

import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;

/* loaded from: classes3.dex */
public final class t implements com.fyber.inneractive.sdk.web.g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a f28127a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ u f28128b;

    public t(u uVar, com.fyber.inneractive.sdk.flow.endcard.loaders.listeners.a aVar) {
        this.f28128b = uVar;
        this.f28127a = aVar;
    }

    @Override // com.fyber.inneractive.sdk.web.g
    public final void a(com.fyber.inneractive.sdk.web.i iVar) {
        this.f28128b.f28134h.set(false);
        this.f28128b.f28135i.a(iVar);
        this.f28127a.a();
    }

    @Override // com.fyber.inneractive.sdk.web.g
    public final void a(com.fyber.inneractive.sdk.web.i iVar, InneractiveInfrastructureError inneractiveInfrastructureError) {
        this.f28128b.f28134h.set(false);
        this.f28128b.f28135i.a(iVar, inneractiveInfrastructureError);
        this.f28127a.a(inneractiveInfrastructureError.description());
    }
}
