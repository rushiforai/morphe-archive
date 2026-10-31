package com.facebook.ads.redexgen.X;

import android.util.SparseArray;

/* renamed from: com.facebook.ads.redexgen.X.pg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2368pg {
    public final SparseArray<int[]> A00 = new SparseArray<>();

    public final void A00(int i5, int[] iArr) {
        this.A00.put(i5, iArr);
    }

    public final boolean A01(int i5) {
        return this.A00.indexOfKey(i5) >= 0;
    }

    public final int[] A02(int i5) {
        return this.A00.get(i5);
    }
}
