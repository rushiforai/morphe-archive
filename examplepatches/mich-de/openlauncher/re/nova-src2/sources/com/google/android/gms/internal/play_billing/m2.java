package com.google.android.gms.internal.play_billing;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class m2 extends l2 {

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f33454c;

    public m2(byte[] bArr) {
        bArr.getClass();
        this.f33454c = bArr;
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final byte c(int i5) {
        return this.f33454c[i5];
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final byte d(int i5) {
        return this.f33454c[i5];
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final int e(int i5, int i11) {
        return e3.a(i5, this.f33454c, 0, i11);
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final int f() {
        return this.f33454c.length;
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final l2 g(int i5, int i11) {
        byte[] bArr = this.f33454c;
        int iK = l2.k(0, i11, bArr.length);
        return iK == 0 ? l2.f33446b : new k2(bArr, 0, iK);
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final void h(n2 n2Var) {
        byte[] bArr = this.f33454c;
        n2Var.p0(0, bArr.length, bArr);
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final boolean j(l2 l2Var) {
        boolean z11 = l2Var instanceof m2;
        byte[] bArr = this.f33454c;
        if (z11) {
            return Arrays.equals(bArr, ((m2) l2Var).f33454c);
        }
        boolean z12 = l2Var instanceof k2;
        if (!z12) {
            return l2Var.j(this);
        }
        k2 k2Var = (k2) l2Var;
        int i5 = k2Var.f33438e;
        int length = bArr.length;
        if (length <= i5) {
            if (length <= i5) {
                return z11 ? l2.n(bArr, 0, ((m2) l2Var).f33454c, 0, length) : z12 ? l2.n(bArr, 0, k2Var.f33436c, k2Var.f33437d, length) : l2Var.g(0, length).equals(g(0, length));
            }
            throw new IllegalArgumentException(b.c0.g(length, i5, "Ran off end of other: 0, ", ", "));
        }
        throw new IllegalArgumentException("Length too large: " + length + length);
    }
}
