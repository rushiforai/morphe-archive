package com.facebook.ads.redexgen.X;

import java.io.IOException;

/* renamed from: com.facebook.ads.redexgen.X.dA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1609dA {
    public final int A00;
    public final long A01;

    public C1609dA(int i5, long j11) {
        this.A00 = i5;
        this.A01 = j11;
    }

    public static C1609dA A00(Q9 q92, C1084Mk c1084Mk) throws IOException {
        q92.AI6(c1084Mk.A0l(), 0, 8);
        c1084Mk.A0f(0);
        int iA0C = c1084Mk.A0C();
        long size = c1084Mk.A0O();
        return new C1609dA(iA0C, size);
    }
}
