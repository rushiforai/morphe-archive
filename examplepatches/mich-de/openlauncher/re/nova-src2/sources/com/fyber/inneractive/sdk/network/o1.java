package com.fyber.inneractive.sdk.network;

/* loaded from: classes3.dex */
public final class o1 extends l {

    /* renamed from: g, reason: collision with root package name */
    public final x80.m0 f28759g;

    public o1(l lVar, x80.m0 m0Var) {
        this.f28759g = m0Var;
        this.f28736d = lVar.f28736d;
        this.f28735c = lVar.f28735c;
        this.f28737e = lVar.f28737e;
        this.f28733a = lVar.f28733a;
    }

    @Override // com.fyber.inneractive.sdk.network.l
    public final void a() {
        super.a();
        x80.m0 m0Var = this.f28759g;
        if (m0Var != null) {
            m0Var.close();
        }
    }
}
