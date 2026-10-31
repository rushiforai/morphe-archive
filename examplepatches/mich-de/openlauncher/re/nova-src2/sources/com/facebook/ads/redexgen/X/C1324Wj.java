package com.facebook.ads.redexgen.X;

/* renamed from: com.facebook.ads.redexgen.X.Wj, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1324Wj {
    public final int A00;
    public final C1266Tx A01;
    public final Object A02;
    public final C1154Ph[] A03;
    public final RA[] A04;

    public C1324Wj(C1154Ph[] c1154PhArr, RA[] raArr, C1266Tx c1266Tx, Object obj) {
        this.A03 = c1154PhArr;
        this.A04 = (RA[]) raArr.clone();
        this.A01 = c1266Tx;
        this.A02 = obj;
        this.A00 = c1154PhArr.length;
    }

    public final boolean A00(int i5) {
        return this.A03[i5] != null;
    }

    public final boolean A01(C1324Wj c1324Wj, int i5) {
        return c1324Wj != null && N1.A1E(this.A03[i5], c1324Wj.A03[i5]) && N1.A1E(this.A04[i5], c1324Wj.A04[i5]);
    }
}
