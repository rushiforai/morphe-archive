package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.tp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2625tp implements Runnable {
    public final /* synthetic */ AbstractC0891Es A00;

    public RunnableC2625tp(AbstractC0891Es abstractC0891Es) {
        this.A00 = abstractC0891Es;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A0J.getVisibility() == 0) {
                this.A00.A0t(8);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
