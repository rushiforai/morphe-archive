package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.vi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2742vi implements Runnable {
    public final /* synthetic */ EE A00;

    public RunnableC2742vi(EE ee2) {
        this.A00 = ee2;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0K = true;
            if (this.A00.A0o.A0D() != null) {
                this.A00.A0o.A0D().AH3(true);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
