package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.vg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2740vg implements Runnable {
    public final /* synthetic */ EE A00;

    public RunnableC2740vg(EE ee2) {
        this.A00 = ee2;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A0E != null && this.A00.getResources().getConfiguration().orientation == 1) {
                this.A00.A0E.A0A();
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
