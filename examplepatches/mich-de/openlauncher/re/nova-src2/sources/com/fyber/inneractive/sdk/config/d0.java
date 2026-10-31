package com.fyber.inneractive.sdk.config;

import android.content.Context;

/* loaded from: classes.dex */
public final class d0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e0 f27790a;

    public d0(e0 e0Var) {
        this.f27790a = e0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f27790a.f27798a.L = new com.fyber.inneractive.sdk.measurement.e();
        e0 e0Var = this.f27790a;
        com.fyber.inneractive.sdk.measurement.e eVar = e0Var.f27798a.L;
        Context context = e0Var.f27799b;
        if (eVar.f28502a) {
            return;
        }
        eVar.f28502a = true;
        com.fyber.inneractive.sdk.util.r.f31216b.post(new com.fyber.inneractive.sdk.measurement.d(eVar, context));
    }
}
