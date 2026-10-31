package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class j0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t0 f28729a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ l0 f28730b;

    public j0(l0 l0Var, t0 t0Var) {
        this.f28730b = l0Var;
        this.f28729a = t0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        IAlog.e("retryNetworkRequest pre-execute - %s", this.f28729a.getClass().getName());
        this.f28730b.a(this.f28729a);
    }
}
