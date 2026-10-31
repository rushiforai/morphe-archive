package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.jN, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC1987jN implements Runnable {
    public final /* synthetic */ C1988jO A00;

    public RunnableC1987jN(C1988jO c1988jO) {
        this.A00 = c1988jO;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A05 = 0L;
            this.A00.A06 = false;
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
