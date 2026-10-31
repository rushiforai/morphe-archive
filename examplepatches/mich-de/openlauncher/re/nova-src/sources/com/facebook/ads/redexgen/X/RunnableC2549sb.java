package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.sb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2549sb implements Runnable {
    public final /* synthetic */ C2551sd A00;

    public RunnableC2549sb(C2551sd c2551sd) {
        this.A00 = c2551sd;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A02.getVisibility() == 0) {
                this.A00.A07(8);
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
