package com.facebook.ads.redexgen.X;

import java.util.concurrent.Executor;

/* renamed from: com.facebook.ads.redexgen.X.Qj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1175Qj implements XN {
    public final /* synthetic */ InterfaceC1072Ly A00;
    public final /* synthetic */ Executor A01;

    public C1175Qj(Executor executor, InterfaceC1072Ly interfaceC1072Ly) {
        this.A01 = executor;
        this.A00 = interfaceC1072Ly;
    }

    @Override // com.facebook.ads.redexgen.X.XN
    public final void AIp() {
        this.A00.A3V(this.A01);
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        this.A01.execute(runnable);
    }
}
