package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.km, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2073km extends Thread {
    public final long A00;

    public C2073km(long j11) {
        this.A00 = j11;
        start();
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        while (true) {
            try {
                try {
                    Thread.sleep(this.A00);
                } catch (Throwable th2) {
                    AbstractC2311oi.A00(th2, this);
                    return;
                }
            } catch (InterruptedException unused) {
            }
            C2071kk.A01();
        }
    }
}
