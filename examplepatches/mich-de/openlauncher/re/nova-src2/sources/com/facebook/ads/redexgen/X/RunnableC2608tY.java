package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.tY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2608tY implements Runnable {
    public final /* synthetic */ C2609tZ A00;
    public final /* synthetic */ InterfaceC2610ta A01;

    public RunnableC2608tY(C2609tZ c2609tZ, InterfaceC2610ta interfaceC2610ta) {
        this.A00 = c2609tZ;
        this.A01 = interfaceC2610ta;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A01.ADv();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
