package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Zf, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC1393Zf implements Runnable {
    public final /* synthetic */ AI A00;

    public RunnableC1393Zf(AI ai2) {
        this.A00 = ai2;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            AI.A03(this.A00);
            throw null;
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
