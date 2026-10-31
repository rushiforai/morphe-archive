package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Nu, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1120Nu extends Thread {
    public final /* synthetic */ T0 A00;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C1120Nu(T0 t02, String str) {
        super(str);
        this.A00 = t02;
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public final void run() throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            this.A00.A0R();
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }
}
