package com.google.android.gms.internal.measurement;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class u0 extends t0 {

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f33100c;

    public u0(byte[] bArr) {
        bArr.getClass();
        this.f33100c = bArr;
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final byte c(int i5) {
        return this.f33100c[i5];
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final int d() {
        return this.f33100c.length;
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final t0 e(int i5, int i11) {
        byte[] bArr = this.f33100c;
        int iO = v0.o(0, i11, bArr.length);
        return iO == 0 ? v0.f33120b : new s0(bArr, 0, iO);
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final void f(int i5, byte[] bArr) {
        System.arraycopy(this.f33100c, 0, bArr, 0, i5);
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final void g(c1 c1Var) {
        byte[] bArr = this.f33100c;
        c1Var.d(bArr, 0, bArr.length);
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final boolean h(v0 v0Var) {
        boolean z11 = v0Var instanceof u0;
        byte[] bArr = this.f33100c;
        if (z11) {
            return Arrays.equals(bArr, ((u0) v0Var).f33100c);
        }
        boolean z12 = v0Var instanceof s0;
        if (!z12) {
            return v0Var.h(this);
        }
        s0 s0Var = (s0) v0Var;
        int i5 = s0Var.f33041e;
        int length = bArr.length;
        if (length > i5) {
            StringBuilder sb2 = new StringBuilder(String.valueOf(length).length() + 18 + String.valueOf(length).length());
            sb2.append("Length too large: ");
            sb2.append(length);
            sb2.append(length);
            throw new IllegalArgumentException(sb2.toString());
        }
        if (length <= i5) {
            return z11 ? v0.p(bArr, 0, ((u0) v0Var).f33100c, 0, length) : z12 ? v0.p(bArr, 0, s0Var.f33039c, s0Var.f33040d, length) : v0Var.e(0, length).equals(e(0, length));
        }
        StringBuilder sb3 = new StringBuilder(String.valueOf(length).length() + 27 + String.valueOf(i5).length());
        sb3.append("Ran off end of other: 0, ");
        sb3.append(length);
        sb3.append(", ");
        sb3.append(i5);
        throw new IllegalArgumentException(sb3.toString());
    }

    @Override // com.google.android.gms.internal.measurement.v0
    public final int j(int i5, int i11) {
        return w1.a(i5, this.f33100c, 0, i11);
    }
}
