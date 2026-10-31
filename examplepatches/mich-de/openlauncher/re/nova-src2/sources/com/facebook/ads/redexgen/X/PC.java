package com.facebook.ads.redexgen.X;

/* loaded from: assets/audience_network/classes.dex */
public final class PC implements InterfaceC1458aj {
    public int A00;
    public int A01;
    public final int A02;
    public final int A03;
    public final C1084Mk A04;

    public PC(PE pe2) {
        this.A04 = pe2.A00;
        this.A04.A0f(12);
        this.A02 = this.A04.A0L() & 255;
        this.A03 = this.A04.A0L();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1458aj
    public final int A8l() {
        return -1;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1458aj
    public final int A9Y() {
        return this.A03;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1458aj
    public final int AIf() {
        if (this.A02 == 8) {
            return this.A04.A0I();
        }
        if (this.A02 == 16) {
            return this.A04.A0M();
        }
        int i5 = this.A01;
        this.A01 = i5 + 1;
        if (i5 % 2 == 0) {
            this.A00 = this.A04.A0I();
            return (this.A00 & 240) >> 4;
        }
        return this.A00 & 15;
    }
}
