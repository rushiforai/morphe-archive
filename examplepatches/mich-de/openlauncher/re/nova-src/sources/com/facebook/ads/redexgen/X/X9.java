package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class X9 implements Runnable {
    public final X8 A00;

    public X9(X8 x82) {
        this.A00 = x82;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.AFn();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
