package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.w8, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class RunnableC2768w8 implements Runnable {
    public final /* synthetic */ C06805y A00;

    public RunnableC2768w8(C06805y c06805y) {
        this.A00 = c06805y;
    }

    @Override // java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A00.A0A != null && this.A00.getResources().getConfiguration().orientation == 1) {
                this.A00.A0A.A0A();
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
