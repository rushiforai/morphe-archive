package com.fyber.inneractive.sdk.web;

import org.json.JSONException;

/* loaded from: classes3.dex */
public final class p0 implements qc.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f31366a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f31367b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ v0 f31368c;

    public p0(v0 v0Var, String str, String str2) {
        this.f31368c = v0Var;
        this.f31366a = str;
        this.f31367b = str2;
    }

    @Override // qc.a
    public final void a() throws JSONException {
        v0 v0Var = this.f31368c;
        v0Var.f31386b.a(v0Var.f31387c, new com.fyber.inneractive.sdk.ignite.g(v0Var.f31390f, v0Var.f31388d, v0Var.f31392h.f28392a));
        this.f31368c.d("onShowInstallStarted();");
    }

    @Override // qc.a
    public final void a(String str) {
        v0 v0Var = this.f31368c;
        v0Var.f31386b.m();
        v0Var.d("onInstallationFailed();");
        v0 v0Var2 = this.f31368c;
        v0Var2.f31392h.a(com.fyber.inneractive.sdk.network.t.IGNITE_FLOW_FAILED_TO_INSTALL_APP, this.f31366a, this.f31367b, v0Var2.f31388d);
    }
}
