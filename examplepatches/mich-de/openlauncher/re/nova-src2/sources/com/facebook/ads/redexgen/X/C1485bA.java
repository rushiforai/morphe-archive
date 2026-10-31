package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.bA, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1485bA {
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final long A04;
    public final long A05;
    public final long A06;
    public final VC A07;
    public final long[] A08;
    public final long[] A09;
    public final C1486bB[] A0A;

    public C1485bA(int i5, int i11, long j11, long j12, long j13, VC vc, int i12, C1486bB[] c1486bBArr, int i13, long[] jArr, long[] jArr2) {
        this.A00 = i5;
        this.A03 = i11;
        this.A06 = j11;
        this.A05 = j12;
        this.A04 = j13;
        this.A07 = vc;
        this.A02 = i12;
        this.A0A = c1486bBArr;
        this.A01 = i13;
        this.A08 = jArr;
        this.A09 = jArr2;
    }

    public final C1486bB A00(int i5) {
        if (this.A0A == null) {
            return null;
        }
        return this.A0A[i5];
    }
}
