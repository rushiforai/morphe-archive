package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.tr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2627tr implements Runnable {
    public final /* synthetic */ AbstractC0891Es A00;

    public RunnableC2627tr(AbstractC0891Es abstractC0891Es) {
        this.A00 = abstractC0891Es;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0r();
            this.A00.A0v(1000L);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
