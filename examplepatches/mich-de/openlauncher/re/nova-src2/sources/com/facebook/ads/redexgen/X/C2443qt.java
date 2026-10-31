package com.facebook.ads.redexgen.X;

import java.util.concurrent.Executor;

/* renamed from: com.facebook.ads.redexgen.X.qt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2443qt {
    public static C2443qt A02;
    public final C0923Fz A00;
    public final C2445qv A01;

    public C2443qt(C0958Hi c0958Hi, Executor executor, C2145ly c2145ly) {
        this.A01 = new C2445qv(c0958Hi);
        this.A00 = new C0923Fz(executor, c2145ly, c0958Hi);
    }

    private void A00() {
        this.A01.A03(this.A00);
    }

    public static void A01(C0958Hi c0958Hi, Executor executor, C2145ly c2145ly) {
        if (!C2203mv.A1c(c0958Hi)) {
            return;
        }
        if (A02 == null) {
            A02 = new C2443qt(c0958Hi, executor, c2145ly);
            A02.A00();
        } else {
            A02.A02(c2145ly);
        }
    }

    private void A02(C2145ly c2145ly) {
        this.A00.A07(c2145ly);
    }
}
