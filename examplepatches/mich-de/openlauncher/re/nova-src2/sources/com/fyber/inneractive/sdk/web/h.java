package com.fyber.inneractive.sdk.web;

/* loaded from: classes3.dex */
public final class h implements f {

    /* renamed from: a, reason: collision with root package name */
    public final String f31299a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.util.g1 f31300b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ i f31301c;

    public h(i iVar, String str, com.fyber.inneractive.sdk.util.g1 g1Var) {
        this.f31301c = iVar;
        this.f31300b = g1Var;
        this.f31299a = str;
    }

    @Override // com.fyber.inneractive.sdk.web.f
    public final String a() {
        return null;
    }

    @Override // com.fyber.inneractive.sdk.web.f
    public final void b() {
    }

    @Override // com.fyber.inneractive.sdk.web.f
    public final String c() {
        return "open";
    }

    @Override // com.fyber.inneractive.sdk.web.f
    public final void d() {
        i iVar = this.f31301c;
        String str = this.f31299a;
        com.fyber.inneractive.sdk.util.g1 g1Var = this.f31300b;
        j1 j1Var = iVar.f31309g;
        if (j1Var != null) {
            com.fyber.inneractive.sdk.util.g0 g0Var = j1Var.a(str, g1Var).f31180a;
        }
    }

    public final String toString() {
        return "action: open url: " + this.f31299a;
    }
}
