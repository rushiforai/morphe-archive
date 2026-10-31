package com.facebook.ads.redexgen.X;

import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.mJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2165mJ {
    public static C2165mJ A00 = new C2165mJ();

    public static C2165mJ A00() {
        return A00;
    }

    public final HD A01(C2095lA c2095lA, boolean z11) {
        return new HD(c2095lA, z11, new C2076kp());
    }

    public final Map<String, String> A02(C2095lA c2095lA) {
        try {
            return A01(c2095lA, false).A06();
        } catch (Throwable th2) {
            c2095lA.A08().A4j(th2);
            return C2157mB.A01(c2095lA);
        }
    }
}
