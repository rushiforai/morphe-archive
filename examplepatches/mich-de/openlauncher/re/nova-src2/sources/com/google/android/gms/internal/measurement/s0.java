package com.google.android.gms.internal.measurement;

/* loaded from: classes3.dex */
public final class s0 extends t0 {

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f33039c;

    /* renamed from: d, reason: collision with root package name */
    public final int f33040d;

    /* renamed from: e, reason: collision with root package name */
    public final int f33041e;

    public s0(byte[] bArr, int i5, int i11) {
        v0.o(i5, i5 + i11, bArr.length);
        this.f33039c = bArr;
        this.f33040d = i5;
        this.f33041e = i11;
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final byte c(int i5) {
        return this.f33039c[this.f33040d + i5];
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final int d() {
        return this.f33041e;
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final t0 e(int i5, int i11) {
        int iO = v0.o(i5, i11, this.f33041e);
        if (iO == 0) {
            return v0.f33120b;
        }
        return new s0(this.f33039c, this.f33040d + i5, iO);
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final void f(int i5, byte[] bArr) {
        System.arraycopy(this.f33039c, this.f33040d, bArr, 0, i5);
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final void g(c1 c1Var) {
        c1Var.d(this.f33039c, this.f33040d, this.f33041e);
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final boolean h(v0 v0Var) {
        boolean z11 = v0Var instanceof u0;
        if (!z11 && !(v0Var instanceof s0)) {
            return v0Var.h(this);
        }
        int iD = v0Var.d();
        int i5 = this.f33041e;
        if (i5 > iD) {
            StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + 18 + String.valueOf(i5).length());
            sb2.append("Length too large: ");
            sb2.append(i5);
            sb2.append(i5);
            throw new IllegalArgumentException(sb2.toString());
        }
        if (i5 <= v0Var.d()) {
            byte[] bArr = this.f33039c;
            int i11 = this.f33040d;
            if (z11) {
                return v0.p(bArr, i11, ((u0) v0Var).f33100c, 0, i5);
            }
            if (!(v0Var instanceof s0)) {
                return v0Var.e(0, i5).equals(e(i11, i5 + i11));
            }
            s0 s0Var = (s0) v0Var;
            return v0.p(bArr, i11, s0Var.f33039c, s0Var.f33040d, i5);
        }
        int iD2 = v0Var.d();
        StringBuilder sb3 = new StringBuilder(String.valueOf(i5).length() + 27 + String.valueOf(iD2).length());
        sb3.append("Ran off end of other: 0, ");
        sb3.append(i5);
        sb3.append(", ");
        sb3.append(iD2);
        throw new IllegalArgumentException(sb3.toString());
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final int j(int i5, int i11) {
        return w1.a(i5, this.f33039c, this.f33040d, i11);
    }
}
