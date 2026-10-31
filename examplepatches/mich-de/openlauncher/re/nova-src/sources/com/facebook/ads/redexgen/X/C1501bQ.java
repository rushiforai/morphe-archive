package com.facebook.ads.redexgen.X;

import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.bQ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1501bQ {
    public int A00;
    public int A01;
    public int A02;
    public InterfaceC1534bx A03;
    public Map<String, String> A04;
    public final int A05;
    public final int A06;

    public C1501bQ(int i5, int i11, int i12, int i13, int i14, Map<String, String> requestHeaders, InterfaceC1534bx interfaceC1534bx) {
        this.A06 = i5;
        this.A00 = i11;
        this.A02 = i12;
        this.A05 = i13;
        this.A01 = i14;
        this.A04 = requestHeaders;
        this.A03 = interfaceC1534bx;
    }

    public final int A00() {
        return this.A00;
    }

    public final int A01() {
        return this.A01;
    }

    public final int A02() {
        return this.A02;
    }

    public final int A03() {
        return this.A05;
    }

    public final int A04() {
        return this.A06;
    }

    public final InterfaceC1534bx A05() {
        return this.A03;
    }

    public final Map<String, String> A06() {
        return this.A04;
    }
}
