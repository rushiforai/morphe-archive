package com.fyber.inneractive.sdk.renderers;

import com.fyber.inneractive.sdk.flow.w0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class a0 implements com.fyber.inneractive.sdk.ui.controller.c {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ c0 f30966a;

    public a0(c0 c0Var) {
        this.f30966a = c0Var;
    }

    @Override // com.fyber.inneractive.sdk.ui.controller.c
    public final void t() {
        c0 c0Var = this.f30966a;
        boolean z11 = c0Var.f30970m;
        if (z11) {
            return;
        }
        if (c0Var.f28031b != null && !z11) {
            c0Var.f30970m = true;
            IAlog.a("%sTracking impression", IAlog.a(c0Var));
            com.fyber.inneractive.sdk.flow.nativead.trackers.a aVar = new com.fyber.inneractive.sdk.flow.nativead.trackers.a((w0) c0Var.f28031b);
            c0Var.n = aVar;
            aVar.a(c0Var);
        }
        c0Var.E();
    }
}
