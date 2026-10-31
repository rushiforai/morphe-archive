package com.google.android.gms.internal.play_billing;

/* loaded from: classes3.dex */
public final class k2 extends l2 {

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f33436c;

    /* renamed from: d, reason: collision with root package name */
    public final int f33437d;

    /* renamed from: e, reason: collision with root package name */
    public final int f33438e;

    public k2(byte[] bArr, int i5, int i11) {
        l2.k(i5, i5 + i11, bArr.length);
        this.f33436c = bArr;
        this.f33437d = i5;
        this.f33438e = i11;
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final byte c(int i5) {
        int i11 = this.f33438e;
        if (((i11 - (i5 + 1)) | i5) >= 0) {
            return this.f33436c[this.f33437d + i5];
        }
        if (i5 < 0) {
            throw new ArrayIndexOutOfBoundsException(b.c0.h(i5, "Index < 0: "));
        }
        throw new ArrayIndexOutOfBoundsException(b.c0.g(i5, i11, "Index > length: ", ", "));
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final byte d(int i5) {
        return this.f33436c[this.f33437d + i5];
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final int e(int i5, int i11) {
        return e3.a(i5, this.f33436c, this.f33437d, i11);
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final int f() {
        return this.f33438e;
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final l2 g(int i5, int i11) {
        int iK = l2.k(i5, i11, this.f33438e);
        if (iK == 0) {
            return l2.f33446b;
        }
        return new k2(this.f33436c, this.f33437d + i5, iK);
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final void h(n2 n2Var) {
        n2Var.p0(this.f33437d, this.f33438e, this.f33436c);
    }

    @Override // com.google.android.gms.internal.play_billing.l2
    public final boolean j(l2 l2Var) {
        boolean z11 = l2Var instanceof m2;
        if (!z11 && !(l2Var instanceof k2)) {
            return l2Var.j(this);
        }
        int iF = l2Var.f();
        int i5 = this.f33438e;
        if (i5 > iF) {
            throw new IllegalArgumentException("Length too large: " + i5 + i5);
        }
        if (i5 > l2Var.f()) {
            throw new IllegalArgumentException(b.c0.g(i5, l2Var.f(), "Ran off end of other: 0, ", ", "));
        }
        byte[] bArr = this.f33436c;
        int i11 = this.f33437d;
        if (z11) {
            return l2.n(bArr, i11, ((m2) l2Var).f33454c, 0, i5);
        }
        if (!(l2Var instanceof k2)) {
            return l2Var.g(0, i5).equals(g(i11, i5 + i11));
        }
        k2 k2Var = (k2) l2Var;
        return l2.n(bArr, i11, k2Var.f33436c, k2Var.f33437d, i5);
    }
}
