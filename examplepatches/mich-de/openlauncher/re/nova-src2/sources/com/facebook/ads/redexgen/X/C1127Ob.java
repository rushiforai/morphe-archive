package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Ob, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1127Ob {
    public int A00;
    public int A01;
    public PO A02;
    public boolean A03;

    public C1127Ob() {
    }

    public final void A03(int i5) {
        this.A01 += i5;
    }

    public final void A04(int i5) {
        if (this.A03 && this.A00 != 4) {
            AbstractC1062Ln.A07(i5 == 4);
        } else {
            this.A03 = true;
            this.A00 = i5;
        }
    }

    public final void A05(PO po) {
        this.A02 = po;
        this.A01 = 0;
        this.A03 = false;
    }

    public final boolean A06(PO po) {
        return po != this.A02 || this.A01 > 0 || this.A03;
    }
}
