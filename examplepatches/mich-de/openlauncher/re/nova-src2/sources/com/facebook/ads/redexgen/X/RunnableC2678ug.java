package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.ug, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2678ug implements Runnable {
    public final /* synthetic */ C0879Eg A00;

    public RunnableC2678ug(C0879Eg c0879Eg) {
        this.A00 = c0879Eg;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A05 = true;
            if (((AbstractC2685un) this.A00).A08.A0D() != null) {
                ((AbstractC2685un) this.A00).A08.A0D().AH3(true);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
