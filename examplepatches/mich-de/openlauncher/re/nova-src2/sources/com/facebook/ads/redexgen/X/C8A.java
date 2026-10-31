package com.facebook.ads.redexgen.X;

import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.8A, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C8A extends T1 implements InterfaceC1506bV {
    public long A00;
    public InterfaceC1506bV A01;

    @Override // com.facebook.ads.redexgen.X.T1
    public abstract void A0B();

    @Override // com.facebook.ads.redexgen.X.AbstractC1109Nj
    public final void A0A() {
        super.A0A();
        this.A01 = null;
    }

    public final void A0C(long j11, InterfaceC1506bV interfaceC1506bV, long j12) {
        super.A01 = j11;
        this.A01 = interfaceC1506bV;
        if (j12 == Long.MAX_VALUE) {
            j12 = super.A01;
        }
        this.A00 = j12;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final List<C1251Th> A88(long j11) {
        return ((InterfaceC1506bV) AbstractC1062Ln.A01(this.A01)).A88(j11 - this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final long A8e(int i5) {
        return ((InterfaceC1506bV) AbstractC1062Ln.A01(this.A01)).A8e(i5) + this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A8f() {
        return ((InterfaceC1506bV) AbstractC1062Ln.A01(this.A01)).A8f();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1506bV
    public final int A9D(long j11) {
        return ((InterfaceC1506bV) AbstractC1062Ln.A01(this.A01)).A9D(j11 - this.A00);
    }
}
