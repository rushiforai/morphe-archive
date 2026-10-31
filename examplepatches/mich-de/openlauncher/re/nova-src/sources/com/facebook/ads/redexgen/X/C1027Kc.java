package com.facebook.ads.redexgen.X;

import android.util.SparseBooleanArray;

/* renamed from: com.facebook.ads.redexgen.X.Kc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1027Kc {
    public final SparseBooleanArray A00;

    public C1027Kc(SparseBooleanArray sparseBooleanArray) {
        this.A00 = sparseBooleanArray;
    }

    public final int A00() {
        return this.A00.size();
    }

    public final int A01(int i5) {
        AbstractC1062Ln.A00(i5, 0, A00());
        return this.A00.keyAt(i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C1027Kc)) {
            return false;
        }
        C1027Kc c1027Kc = (C1027Kc) obj;
        if (N1.A02 < 24) {
            if (A00() != c1027Kc.A00()) {
                return false;
            }
            for (int i5 = 0; i5 < A00(); i5++) {
                if (A01(i5) != c1027Kc.A01(i5)) {
                    return false;
                }
            }
            return true;
        }
        return this.A00.equals(c1027Kc.A00);
    }

    /* JADX WARN: Incorrect condition in loop: B:6:0x000f */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int hashCode() {
        if (N1.A02 < 24) {
            int i5 = A00();
            for (int i11 = 0; i11 < hashCode; i11++) {
                int hashCode = A01(i11);
                i5 = (i5 * 31) + hashCode;
            }
            return i5;
        }
        return this.A00.hashCode();
    }
}
