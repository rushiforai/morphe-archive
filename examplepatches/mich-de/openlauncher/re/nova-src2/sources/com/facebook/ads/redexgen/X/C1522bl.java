package com.facebook.ads.redexgen.X;

import android.util.SparseArray;

/* renamed from: com.facebook.ads.redexgen.X.bl, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1522bl {
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;
    public final int A06;
    public final int A07;
    public final int A08;
    public final SparseArray<C1523bm> A09;
    public final boolean A0A;

    public C1522bl(int i5, boolean z11, int i11, int i12, int i13, int i14, int i15, int i16, int i17, int i18, SparseArray<C1523bm> sparseArray) {
        this.A03 = i5;
        this.A0A = z11;
        this.A08 = i11;
        this.A02 = i12;
        this.A04 = i13;
        this.A01 = i14;
        this.A00 = i15;
        this.A07 = i16;
        this.A06 = i17;
        this.A05 = i18;
        this.A09 = sparseArray;
    }

    public final void A00(C1522bl c1522bl) {
        SparseArray<C1523bm> sparseArray = c1522bl.A09;
        for (int i5 = 0; i5 < sparseArray.size(); i5++) {
            SparseArray<C1523bm> sparseArray2 = this.A09;
            int i11 = sparseArray.keyAt(i5);
            sparseArray2.put(i11, sparseArray.valueAt(i5));
        }
    }
}
