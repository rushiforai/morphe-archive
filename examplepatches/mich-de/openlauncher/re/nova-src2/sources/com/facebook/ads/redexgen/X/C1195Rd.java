package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Rd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1195Rd implements InterfaceC1326Wl {
    public long A00;
    public long A01;
    public C1195Rd A02;
    public C1325Wk A03;

    public C1195Rd(long j11, int i5) {
        A02(j11, i5);
    }

    public final int A00(long j11) {
        return ((int) (j11 - this.A01)) + this.A03.A00;
    }

    public final C1195Rd A01() {
        this.A03 = null;
        C1195Rd c1195Rd = this.A02;
        this.A02 = null;
        return c1195Rd;
    }

    public final void A02(long j11, int i5) {
        AbstractC1062Ln.A08(this.A03 == null);
        this.A01 = j11;
        this.A00 = i5 + j11;
    }

    public final void A03(C1325Wk c1325Wk, C1195Rd c1195Rd) {
        this.A03 = c1325Wk;
        this.A02 = c1195Rd;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1326Wl
    public final C1325Wk A7U() {
        return (C1325Wk) AbstractC1062Ln.A01(this.A03);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1326Wl
    public final C1195Rd ADT() {
        if (this.A02 == null || this.A02.A03 == null) {
            return null;
        }
        return this.A02;
    }
}
