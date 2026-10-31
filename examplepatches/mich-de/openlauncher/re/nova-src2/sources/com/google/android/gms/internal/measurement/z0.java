package com.google.android.gms.internal.measurement;

import java.util.Locale;

/* loaded from: classes3.dex */
public final class z0 extends c1 {

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f33271e;

    /* renamed from: f, reason: collision with root package name */
    public final int f33272f;

    /* renamed from: g, reason: collision with root package name */
    public int f33273g;

    public z0(byte[] bArr, int i5) {
        int length = bArr.length;
        if (((length - i5) | i5) < 0) {
            Locale locale = Locale.US;
            throw new IllegalArgumentException(b.c0.g(length, i5, "Array range is invalid. Buffer.length=", ", offset=0, length="));
        }
        this.f33271e = bArr;
        this.f33273g = 0;
        this.f33272f = i5;
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void A(v0 v0Var) throws zzacy {
        F(v0Var.d());
        v0Var.g(this);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void B(int i5, byte[] bArr) throws zzacy {
        F(i5);
        K(0, i5, bArr);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void C(n0 n0Var) throws zzacy {
        o1 o1Var = (o1) n0Var;
        F(o1Var.n());
        o1Var.f(this);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void D(byte b11) throws zzacy {
        int i5 = this.f33273g;
        try {
            int i11 = i5 + 1;
            try {
                this.f33271e[i5] = b11;
                this.f33273g = i11;
            } catch (IndexOutOfBoundsException e3) {
                e = e3;
                i5 = i11;
                throw new zzacy(i5, this.f33272f, 1, e);
            }
        } catch (IndexOutOfBoundsException e11) {
            e = e11;
        }
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void E(int i5) throws zzacy {
        if (i5 >= 0) {
            F(i5);
        } else {
            H(i5);
        }
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void F(int i5) throws zzacy {
        int i11;
        int i12 = this.f33273g;
        while (true) {
            int i13 = i5 & (-128);
            byte[] bArr = this.f33271e;
            if (i13 == 0) {
                i11 = i12 + 1;
                bArr[i12] = (byte) i5;
                this.f33273g = i11;
                return;
            } else {
                i11 = i12 + 1;
                try {
                    bArr[i12] = (byte) (i5 | 128);
                    i5 >>>= 7;
                    i12 = i11;
                } catch (IndexOutOfBoundsException e3) {
                    throw new zzacy(i11, this.f33272f, 1, e3);
                }
            }
            throw new zzacy(i11, this.f33272f, 1, e3);
        }
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void G(int i5) throws zzacy {
        int i11 = this.f33273g;
        try {
            byte[] bArr = this.f33271e;
            bArr[i11] = (byte) i5;
            bArr[i11 + 1] = (byte) (i5 >> 8);
            bArr[i11 + 2] = (byte) (i5 >> 16);
            bArr[i11 + 3] = (byte) (i5 >> 24);
            this.f33273g = i11 + 4;
        } catch (IndexOutOfBoundsException e3) {
            throw new zzacy(i11, this.f33272f, 4, e3);
        }
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void H(long j11) throws zzacy {
        int i5;
        int i11 = this.f33273g;
        int i12 = this.f33272f;
        byte[] bArr = this.f33271e;
        if (!c1.f32417d || i12 - i11 < 10) {
            long j12 = j11;
            while ((j12 & (-128)) != 0) {
                int i13 = i11 + 1;
                try {
                    bArr[i11] = (byte) (((int) j12) | 128);
                    j12 >>>= 7;
                    i11 = i13;
                } catch (IndexOutOfBoundsException e3) {
                    e = e3;
                    i5 = i13;
                    throw new zzacy(i5, i12, 1, e);
                }
            }
            i5 = i11 + 1;
            try {
                bArr[i11] = (byte) j12;
            } catch (IndexOutOfBoundsException e11) {
                e = e11;
                throw new zzacy(i5, i12, 1, e);
            }
        } else {
            long j13 = j11;
            while ((j13 & (-128)) != 0) {
                d3.k(bArr, i11, (byte) (((int) j13) | 128));
                j13 >>>= 7;
                i11++;
            }
            i5 = i11 + 1;
            d3.k(bArr, i11, (byte) j13);
        }
        this.f33273g = i5;
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void I(long j11) throws zzacy {
        int i5 = this.f33273g;
        try {
            byte[] bArr = this.f33271e;
            bArr[i5] = (byte) j11;
            bArr[i5 + 1] = (byte) (j11 >> 8);
            bArr[i5 + 2] = (byte) (j11 >> 16);
            bArr[i5 + 3] = (byte) (j11 >> 24);
            bArr[i5 + 4] = (byte) (j11 >> 32);
            bArr[i5 + 5] = (byte) (j11 >> 40);
            bArr[i5 + 6] = (byte) (j11 >> 48);
            bArr[i5 + 7] = (byte) (j11 >> 56);
            this.f33273g = i5 + 8;
        } catch (IndexOutOfBoundsException e3) {
            throw new zzacy(i5, this.f33272f, 8, e3);
        }
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void J(String str) throws zzacy {
        int i5 = this.f33273g;
        try {
            int iP = c1.p(str.length() * 3);
            int iP2 = c1.p(str.length());
            byte[] bArr = this.f33271e;
            if (iP2 != iP) {
                F(f3.b(str));
                int i11 = this.f33273g;
                this.f33273g = f3.c(str, bArr, i11, bArr.length - i11);
            } else {
                int i12 = i5 + iP2;
                this.f33273g = i12;
                int iC = f3.c(str, bArr, i12, bArr.length - i12);
                this.f33273g = i5;
                F((iC - i5) - iP2);
                this.f33273g = iC;
            }
        } catch (IndexOutOfBoundsException e3) {
            throw new zzacy(e3);
        }
    }

    public final void K(int i5, int i11, byte[] bArr) throws zzacy {
        try {
            System.arraycopy(bArr, i5, this.f33271e, this.f33273g, i11);
            this.f33273g += i11;
        } catch (IndexOutOfBoundsException e3) {
            throw new zzacy(this.f33273g, this.f33272f, i11, e3);
        }
    }

    public final int L() {
        return this.f33272f - this.f33273g;
    }

    @Override // com.google.android.gms.internal.measurement.gh
    public final void d(byte[] bArr, int i5, int i11) throws zzacy {
        K(i5, i11, bArr);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void r(int i5, int i11) throws zzacy {
        F((i5 << 3) | i11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void s(int i5, int i11) throws zzacy {
        F(i5 << 3);
        E(i11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void t(int i5, int i11) throws zzacy {
        F(i5 << 3);
        F(i11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void u(int i5, int i11) throws zzacy {
        F((i5 << 3) | 5);
        G(i11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void v(int i5, long j11) throws zzacy {
        F(i5 << 3);
        H(j11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void w(int i5, long j11) throws zzacy {
        F((i5 << 3) | 1);
        I(j11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void x(int i5, boolean z11) throws zzacy {
        F(i5 << 3);
        D(z11 ? (byte) 1 : (byte) 0);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void y(int i5, String str) throws zzacy {
        F((i5 << 3) | 2);
        J(str);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void z(int i5, v0 v0Var) throws zzacy {
        F((i5 << 3) | 2);
        A(v0Var);
    }
}
