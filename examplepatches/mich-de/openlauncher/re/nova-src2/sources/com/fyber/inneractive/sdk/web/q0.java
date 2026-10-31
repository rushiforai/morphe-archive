package com.fyber.inneractive.sdk.web;

import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class q0 implements qc.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v0 f31370a;

    public q0(v0 v0Var) {
        this.f31370a = v0Var;
    }

    @Override // qc.a
    public final void a() throws JSONException {
        IAlog.a("InternalStoreWebpageController: onCancelError: onReconnectSuccess", new Object[0]);
        v0 v0Var = this.f31370a;
        v0Var.f31386b.a(v0Var.f31387c, new com.fyber.inneractive.sdk.ignite.g(v0Var.f31390f, v0Var.f31388d, v0Var.f31392h.f28392a));
        this.f31370a.d("onShowInstallStarted();");
    }

    @Override // qc.a
    public final void a(String str) {
        IAlog.a("InternalStoreWebpageController: onCancelError: onReconnectFailed: error: %s", str);
    }
}
