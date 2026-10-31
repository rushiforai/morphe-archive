package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.rl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2497rl implements Runnable {
    public final /* synthetic */ C0831Ck A00;

    public RunnableC2497rl(C0831Ck c0831Ck) {
        this.A00 = c0831Ck;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A00.A0J(EnumC2231nN.A0b);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
