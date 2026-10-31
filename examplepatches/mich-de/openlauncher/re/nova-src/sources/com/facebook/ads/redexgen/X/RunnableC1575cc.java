package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.cc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC1575cc implements Runnable {
    public final /* synthetic */ C1562cP A00;

    public RunnableC1575cc(C1562cP c1562cP) {
        this.A00 = c1562cP;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0A();
            this.A00.A01.removeCallbacks(this);
            this.A00.A01.postDelayed(this, 250L);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
