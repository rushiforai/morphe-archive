package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.uU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2666uU implements Runnable {
    public final /* synthetic */ C06805y A00;

    public RunnableC2666uU(C06805y c06805y) {
        this.A00 = c06805y;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0H = true;
            this.A00.A0p.AH3(true);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
