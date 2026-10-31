package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.vh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2741vh implements Runnable {
    public final /* synthetic */ EE A00;

    public RunnableC2741vh(EE ee2) {
        this.A00 = ee2;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A0L) {
                this.A00.A0P();
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
