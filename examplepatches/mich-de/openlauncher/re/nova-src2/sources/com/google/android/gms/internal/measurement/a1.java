package com.google.android.gms.internal.measurement;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes3.dex */
public final class a1 extends c1 {

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f32364e;

    /* renamed from: f, reason: collision with root package name */
    public final int f32365f;

    /* renamed from: g, reason: collision with root package name */
    public int f32366g;

    /* renamed from: h, reason: collision with root package name */
    public final OutputStream f32367h;

    public a1(OutputStream outputStream, int i5) {
        if (outputStream == null) {
            throw new NullPointerException("out");
        }
        this.f32367h = outputStream;
        if (i5 < 0) {
            throw new IllegalArgumentException("bufferSize must be >= 0");
        }
        byte[] bArr = new byte[Math.max(i5, 20)];
        this.f32364e = bArr;
        this.f32365f = bArr.length;
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void A(v0 v0Var) {
        F(v0Var.d());
        v0Var.g(this);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void B(int i5, byte[] bArr) throws IOException {
        F(i5);
        N(0, i5, bArr);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void C(n0 n0Var) {
        o1 o1Var = (o1) n0Var;
        F(o1Var.n());
        o1Var.f(this);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void D(byte b11) {
        if (this.f32366g == this.f32365f) {
            P();
        }
        int i5 = this.f32366g;
        this.f32364e[i5] = b11;
        this.f32366g = i5 + 1;
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void E(int i5) {
        if (i5 >= 0) {
            F(i5);
        } else {
            H(i5);
        }
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void F(int i5) {
        O(5);
        Q(i5);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void G(int i5) {
        O(4);
        L(i5);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void H(long j11) {
        O(10);
        K(j11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void I(long j11) {
        O(8);
        M(j11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void J(String str) throws e3, IOException {
        int length = str.length() * 3;
        int iP = c1.p(length);
        int i5 = iP + length;
        int i11 = this.f32365f;
        if (i5 > i11) {
            byte[] bArr = new byte[length];
            int iC = f3.c(str, bArr, 0, length);
            F(iC);
            N(0, iC, bArr);
            return;
        }
        if (i5 > i11 - this.f32366g) {
            P();
        }
        int iP2 = c1.p(str.length());
        int i12 = this.f32366g;
        byte[] bArr2 = this.f32364e;
        try {
            if (iP2 == iP) {
                int i13 = i12 + iP2;
                this.f32366g = i13;
                int iC2 = f3.c(str, bArr2, i13, i11 - i13);
                this.f32366g = i12;
                Q((iC2 - i12) - iP2);
                this.f32366g = iC2;
            } else {
                int iB = f3.b(str);
                Q(iB);
                this.f32366g = f3.c(str, bArr2, this.f32366g, iB);
            }
        } catch (ArrayIndexOutOfBoundsException e3) {
            throw new zzacy(e3);
        }
    }

    public final void K(long j11) {
        boolean z11 = c1.f32417d;
        byte[] bArr = this.f32364e;
        if (z11) {
            while (true) {
                int i5 = (int) j11;
                if ((j11 & (-128)) == 0) {
                    int i11 = this.f32366g;
                    this.f32366g = i11 + 1;
                    d3.k(bArr, i11, (byte) i5);
                    return;
                } else {
                    int i12 = this.f32366g;
                    this.f32366g = i12 + 1;
                    d3.k(bArr, i12, (byte) (i5 | 128));
                    j11 >>>= 7;
                }
            }
        } else {
            while (true) {
                int i13 = (int) j11;
                if ((j11 & (-128)) == 0) {
                    int i14 = this.f32366g;
                    this.f32366g = i14 + 1;
                    bArr[i14] = (byte) i13;
                    return;
                } else {
                    int i15 = this.f32366g;
                    this.f32366g = i15 + 1;
                    bArr[i15] = (byte) (i13 | 128);
                    j11 >>>= 7;
                }
            }
        }
    }

    public final void L(int i5) {
        int i11 = this.f32366g;
        byte[] bArr = this.f32364e;
        bArr[i11] = (byte) i5;
        bArr[i11 + 1] = (byte) (i5 >> 8);
        bArr[i11 + 2] = (byte) (i5 >> 16);
        bArr[i11 + 3] = (byte) (i5 >> 24);
        this.f32366g = i11 + 4;
    }

    public final void M(long j11) {
        int i5 = this.f32366g;
        byte[] bArr = this.f32364e;
        bArr[i5] = (byte) j11;
        bArr[i5 + 1] = (byte) (j11 >> 8);
        bArr[i5 + 2] = (byte) (j11 >> 16);
        bArr[i5 + 3] = (byte) (j11 >> 24);
        bArr[i5 + 4] = (byte) (j11 >> 32);
        bArr[i5 + 5] = (byte) (j11 >> 40);
        bArr[i5 + 6] = (byte) (j11 >> 48);
        bArr[i5 + 7] = (byte) (j11 >> 56);
        this.f32366g = i5 + 8;
    }

    public final void N(int i5, int i11, byte[] bArr) throws IOException {
        int i12 = this.f32366g;
        int i13 = this.f32365f;
        int i14 = i13 - i12;
        byte[] bArr2 = this.f32364e;
        if (i14 >= i11) {
            System.arraycopy(bArr, i5, bArr2, i12, i11);
            this.f32366g += i11;
            return;
        }
        System.arraycopy(bArr, i5, bArr2, i12, i14);
        int i15 = i5 + i14;
        this.f32366g = i13;
        P();
        int i16 = i11 - i14;
        if (i16 > i13) {
            this.f32367h.write(bArr, i15, i16);
        } else {
            System.arraycopy(bArr, i15, bArr2, 0, i16);
            this.f32366g = i16;
        }
    }

    public final void O(int i5) {
        if (this.f32365f - this.f32366g < i5) {
            P();
        }
    }

    public final void P() {
        this.f32367h.write(this.f32364e, 0, this.f32366g);
        this.f32366g = 0;
    }

    public final void Q(int i5) {
        boolean z11 = c1.f32417d;
        byte[] bArr = this.f32364e;
        if (z11) {
            while ((i5 & (-128)) != 0) {
                int i11 = this.f32366g;
                this.f32366g = i11 + 1;
                d3.k(bArr, i11, (byte) (i5 | 128));
                i5 >>>= 7;
            }
            int i12 = this.f32366g;
            this.f32366g = i12 + 1;
            d3.k(bArr, i12, (byte) i5);
            return;
        }
        while ((i5 & (-128)) != 0) {
            int i13 = this.f32366g;
            this.f32366g = i13 + 1;
            bArr[i13] = (byte) (i5 | 128);
            i5 >>>= 7;
        }
        int i14 = this.f32366g;
        this.f32366g = i14 + 1;
        bArr[i14] = (byte) i5;
    }

    @Override // com.google.android.gms.internal.measurement.gh
    public final void d(byte[] bArr, int i5, int i11) throws IOException {
        N(i5, i11, bArr);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void r(int i5, int i11) {
        F((i5 << 3) | i11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void s(int i5, int i11) {
        O(20);
        Q(i5 << 3);
        if (i11 >= 0) {
            Q(i11);
        } else {
            K(i11);
        }
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void t(int i5, int i11) {
        O(20);
        Q(i5 << 3);
        Q(i11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void u(int i5, int i11) {
        O(14);
        Q((i5 << 3) | 5);
        L(i11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void v(int i5, long j11) {
        O(20);
        Q(i5 << 3);
        K(j11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void w(int i5, long j11) {
        O(18);
        Q((i5 << 3) | 1);
        M(j11);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void x(int i5, boolean z11) {
        O(11);
        Q(i5 << 3);
        int i11 = this.f32366g;
        this.f32364e[i11] = z11 ? (byte) 1 : (byte) 0;
        this.f32366g = i11 + 1;
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void y(int i5, String str) throws e3, IOException {
        F((i5 << 3) | 2);
        J(str);
    }

    @Override // com.google.android.gms.internal.measurement.c1
    public final void z(int i5, v0 v0Var) {
        F((i5 << 3) | 2);
        A(v0Var);
    }
}
