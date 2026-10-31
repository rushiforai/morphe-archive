package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.eR, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1687eR {
    public final long A00;
    public final long A01;

    public C1687eR(long j11, long j12) {
        this.A01 = j11;
        this.A00 = j12;
    }

    public final boolean A00(long j11, long j12) {
        return this.A00 == -1 ? j11 >= this.A01 : j12 != -1 && this.A01 <= j11 && j11 + j12 <= this.A01 + this.A00;
    }

    public final boolean A01(long j11, long j12) {
        return this.A01 <= j11 ? this.A00 == -1 || this.A01 + this.A00 > j11 : j12 == -1 || j11 + j12 > this.A01;
    }
}
