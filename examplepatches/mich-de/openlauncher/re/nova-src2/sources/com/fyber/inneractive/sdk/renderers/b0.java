package com.fyber.inneractive.sdk.renderers;

import com.fyber.inneractive.sdk.flow.w0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class b0 implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c0 f30968a;

    public b0(c0 c0Var) {
        this.f30968a = c0Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        c0 c0Var = this.f30968a;
        if (c0Var.f28031b != null && !c0Var.f30970m) {
            c0Var.f30970m = true;
            IAlog.a("%sTracking impression", IAlog.a(c0Var));
            com.fyber.inneractive.sdk.flow.nativead.trackers.a aVar = new com.fyber.inneractive.sdk.flow.nativead.trackers.a((w0) c0Var.f28031b);
            c0Var.n = aVar;
            aVar.a(c0Var);
        }
        c0Var.E();
    }
}
