package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.tq, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2626tq implements Runnable {
    public final /* synthetic */ AbstractC0891Es A00;

    public RunnableC2626tq(AbstractC0891Es abstractC0891Es) {
        this.A00 = abstractC0891Es;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A01 = this.A00.A0U.A04();
            this.A00.A03 = AbstractC0891Es.A0I(this.A00.A0U.A04());
            this.A00.A0p();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
