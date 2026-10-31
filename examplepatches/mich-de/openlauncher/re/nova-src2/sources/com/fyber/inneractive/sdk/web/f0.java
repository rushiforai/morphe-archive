package com.fyber.inneractive.sdk.web;

import com.fyber.inneractive.sdk.ui.IAmraidWebViewController;

/* loaded from: classes3.dex */
public final class f0 implements f {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.mraid.e f31295a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ i0 f31296b;

    public f0(i0 i0Var, com.fyber.inneractive.sdk.mraid.e eVar) {
        this.f31296b = i0Var;
        this.f31295a = eVar;
    }

    @Override // com.fyber.inneractive.sdk.web.f
    public final String a() {
        return this.f31295a.c();
    }

    @Override // com.fyber.inneractive.sdk.web.f
    public final void b() {
        com.fyber.inneractive.sdk.mraid.e eVar = this.f31295a;
        if (eVar != null) {
            eVar.d();
        }
    }

    @Override // com.fyber.inneractive.sdk.web.f
    public final String c() {
        return this.f31295a.f28667a;
    }

    @Override // com.fyber.inneractive.sdk.web.f
    public final void d() {
        com.fyber.inneractive.sdk.measurement.tracker.e eVar = ((IAmraidWebViewController) this.f31296b).I;
        if (eVar != null) {
            eVar.a();
        }
        this.f31295a.a();
    }

    public final String toString() {
        return "action = " + this.f31295a.f28667a + " url = " + this.f31295a.c();
    }
}
