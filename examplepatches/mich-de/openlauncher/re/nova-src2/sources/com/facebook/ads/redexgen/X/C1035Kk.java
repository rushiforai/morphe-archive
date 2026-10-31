package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Kk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1035Kk {
    public long A00 = Long.MIN_VALUE;
    public long A01;
    public boolean A02;
    public boolean A03;
    public boolean A04;

    public final C1035Kk A05(long j11) {
        AbstractC1062Ln.A07(j11 == Long.MIN_VALUE || j11 >= 0);
        this.A00 = j11;
        return this;
    }

    public final C1035Kk A06(long j11) {
        AbstractC1062Ln.A07(j11 >= 0);
        this.A01 = j11;
        return this;
    }

    public final C1035Kk A07(boolean z11) {
        this.A02 = z11;
        return this;
    }

    public final C1035Kk A08(boolean z11) {
        this.A03 = z11;
        return this;
    }

    public final C1035Kk A09(boolean z11) {
        this.A04 = z11;
        return this;
    }

    public final C9P A0A() {
        return A0B();
    }

    @Deprecated
    public final C9P A0B() {
        return new C9P(this);
    }
}
