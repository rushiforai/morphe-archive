package com.google.protobuf;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes3.dex */
public final class s extends t {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f34962d;

    /* renamed from: e, reason: collision with root package name */
    public final int f34963e;

    /* renamed from: f, reason: collision with root package name */
    public int f34964f;

    /* renamed from: g, reason: collision with root package name */
    public final OutputStream f34965g;

    public s(OutputStream outputStream, int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException("bufferSize must be >= 0");
        }
        int iMax = Math.max(i5, 20);
        this.f34962d = new byte[iMax];
        this.f34963e = iMax;
        if (outputStream == null) {
            throw new NullPointerException("out");
        }
        this.f34965g = outputStream;
    }

    @Override // com.google.protobuf.g
    public final void C(int i5, int i11, byte[] bArr) throws IOException {
        o0(bArr, i5, i11);
    }

    @Override // com.google.protobuf.t
    public final void K(byte b11) throws IOException {
        if (this.f34964f == this.f34963e) {
            l0();
        }
        int i5 = this.f34964f;
        this.f34964f = i5 + 1;
        this.f34962d[i5] = b11;
    }

    @Override // com.google.protobuf.t
    public final void L(int i5, boolean z11) throws IOException {
        n0(11);
        i0(i5, 0);
        byte b11 = z11 ? (byte) 1 : (byte) 0;
        int i11 = this.f34964f;
        this.f34964f = i11 + 1;
        this.f34962d[i11] = b11;
    }

    @Override // com.google.protobuf.t
    public final void M(int i5, byte[] bArr) throws IOException {
        d0(i5);
        o0(bArr, 0, i5);
    }

    @Override // com.google.protobuf.t
    public final void N(int i5, l lVar) {
        b0(i5, 2);
        O(lVar);
    }

    @Override // com.google.protobuf.t
    public final void O(l lVar) {
        d0(lVar.size());
        lVar.p(this);
    }

    @Override // com.google.protobuf.t
    public final void P(int i5, int i11) throws IOException {
        n0(14);
        i0(i5, 5);
        g0(i11);
    }

    @Override // com.google.protobuf.t
    public final void Q(int i5) throws IOException {
        n0(4);
        g0(i5);
    }

    @Override // com.google.protobuf.t
    public final void R(int i5, long j11) throws IOException {
        n0(18);
        i0(i5, 1);
        h0(j11);
    }

    @Override // com.google.protobuf.t
    public final void S(long j11) throws IOException {
        n0(8);
        h0(j11);
    }

    @Override // com.google.protobuf.t
    public final void T(int i5, int i11) throws IOException {
        n0(20);
        i0(i5, 0);
        if (i11 >= 0) {
            j0(i11);
        } else {
            k0(i11);
        }
    }

    @Override // com.google.protobuf.t
    public final void U(int i5) throws IOException {
        if (i5 >= 0) {
            d0(i5);
        } else {
            f0(i5);
        }
    }

    @Override // com.google.protobuf.t
    public final void V(int i5, o1 o1Var, b2 b2Var) {
        b0(i5, 2);
        d0(((c) o1Var).getSerializedSize(b2Var));
        b2Var.e(o1Var, this.f34972a);
    }

    @Override // com.google.protobuf.t
    public final void W(o1 o1Var) {
        d0(o1Var.getSerializedSize());
        o1Var.writeTo(this);
    }

    @Override // com.google.protobuf.t
    public final void X(int i5, o1 o1Var) throws IOException {
        b0(1, 3);
        c0(2, i5);
        b0(3, 2);
        W(o1Var);
        b0(1, 4);
    }

    @Override // com.google.protobuf.t
    public final void Y(int i5, l lVar) throws IOException {
        b0(1, 3);
        c0(2, i5);
        N(3, lVar);
        b0(1, 4);
    }

    @Override // com.google.protobuf.t
    public final void Z(int i5, String str) throws IOException {
        b0(i5, 2);
        a0(str);
    }

    @Override // com.google.protobuf.t
    public final void a0(String str) throws IOException {
        try {
            int length = str.length() * 3;
            int iH = t.H(length);
            int i5 = iH + length;
            int i11 = this.f34963e;
            if (i5 > i11) {
                byte[] bArr = new byte[length];
                int iB = o2.b(str, bArr, 0, length);
                d0(iB);
                o0(bArr, 0, iB);
                return;
            }
            if (i5 > i11 - this.f34964f) {
                l0();
            }
            int iH2 = t.H(str.length());
            int i12 = this.f34964f;
            byte[] bArr2 = this.f34962d;
            try {
                if (iH2 == iH) {
                    int i13 = i12 + iH2;
                    this.f34964f = i13;
                    int iB2 = o2.b(str, bArr2, i13, i11 - i13);
                    this.f34964f = i12;
                    j0((iB2 - i12) - iH2);
                    this.f34964f = iB2;
                } else {
                    int iC = o2.c(str);
                    j0(iC);
                    this.f34964f = o2.b(str, bArr2, this.f34964f, iC);
                }
            } catch (n2 e3) {
                this.f34964f = i12;
                throw e3;
            } catch (ArrayIndexOutOfBoundsException e11) {
                throw new CodedOutputStream$OutOfSpaceException(e11);
            }
        } catch (n2 e12) {
            J(str, e12);
        }
    }

    @Override // com.google.protobuf.t
    public final void b0(int i5, int i11) {
        d0((i5 << 3) | i11);
    }

    @Override // com.google.protobuf.t
    public final void c0(int i5, int i11) throws IOException {
        n0(20);
        i0(i5, 0);
        j0(i11);
    }

    @Override // com.google.protobuf.t
    public final void d0(int i5) {
        n0(5);
        j0(i5);
    }

    @Override // com.google.protobuf.t
    public final void e0(int i5, long j11) throws IOException {
        n0(20);
        i0(i5, 0);
        k0(j11);
    }

    @Override // com.google.protobuf.t
    public final void f0(long j11) throws IOException {
        n0(10);
        k0(j11);
    }

    public final void g0(int i5) {
        int i11 = this.f34964f;
        int i12 = i11 + 1;
        this.f34964f = i12;
        byte[] bArr = this.f34962d;
        bArr[i11] = (byte) (i5 & 255);
        int i13 = i11 + 2;
        this.f34964f = i13;
        bArr[i12] = (byte) ((i5 >> 8) & 255);
        int i14 = i11 + 3;
        this.f34964f = i14;
        bArr[i13] = (byte) ((i5 >> 16) & 255);
        this.f34964f = i11 + 4;
        bArr[i14] = (byte) ((i5 >> 24) & 255);
    }

    public final void h0(long j11) {
        int i5 = this.f34964f;
        int i11 = i5 + 1;
        this.f34964f = i11;
        byte[] bArr = this.f34962d;
        bArr[i5] = (byte) (j11 & 255);
        int i12 = i5 + 2;
        this.f34964f = i12;
        bArr[i11] = (byte) ((j11 >> 8) & 255);
        int i13 = i5 + 3;
        this.f34964f = i13;
        bArr[i12] = (byte) ((j11 >> 16) & 255);
        int i14 = i5 + 4;
        this.f34964f = i14;
        bArr[i13] = (byte) (255 & (j11 >> 24));
        int i15 = i5 + 5;
        this.f34964f = i15;
        bArr[i14] = (byte) (((int) (j11 >> 32)) & 255);
        int i16 = i5 + 6;
        this.f34964f = i16;
        bArr[i15] = (byte) (((int) (j11 >> 40)) & 255);
        int i17 = i5 + 7;
        this.f34964f = i17;
        bArr[i16] = (byte) (((int) (j11 >> 48)) & 255);
        this.f34964f = i5 + 8;
        bArr[i17] = (byte) (((int) (j11 >> 56)) & 255);
    }

    public final void i0(int i5, int i11) {
        j0((i5 << 3) | i11);
    }

    public final void j0(int i5) {
        boolean z11 = t.f34971c;
        byte[] bArr = this.f34962d;
        if (z11) {
            while ((i5 & (-128)) != 0) {
                int i11 = this.f34964f;
                this.f34964f = i11 + 1;
                m2.i(bArr, i11, (byte) ((i5 | 128) & 255));
                i5 >>>= 7;
            }
            int i12 = this.f34964f;
            this.f34964f = i12 + 1;
            m2.i(bArr, i12, (byte) i5);
            return;
        }
        while ((i5 & (-128)) != 0) {
            int i13 = this.f34964f;
            this.f34964f = i13 + 1;
            bArr[i13] = (byte) ((i5 | 128) & 255);
            i5 >>>= 7;
        }
        int i14 = this.f34964f;
        this.f34964f = i14 + 1;
        bArr[i14] = (byte) i5;
    }

    public final void k0(long j11) {
        boolean z11 = t.f34971c;
        byte[] bArr = this.f34962d;
        if (z11) {
            while ((j11 & (-128)) != 0) {
                int i5 = this.f34964f;
                this.f34964f = i5 + 1;
                m2.i(bArr, i5, (byte) ((((int) j11) | 128) & 255));
                j11 >>>= 7;
            }
            int i11 = this.f34964f;
            this.f34964f = i11 + 1;
            m2.i(bArr, i11, (byte) j11);
            return;
        }
        while ((j11 & (-128)) != 0) {
            int i12 = this.f34964f;
            this.f34964f = i12 + 1;
            bArr[i12] = (byte) ((((int) j11) | 128) & 255);
            j11 >>>= 7;
        }
        int i13 = this.f34964f;
        this.f34964f = i13 + 1;
        bArr[i13] = (byte) j11;
    }

    public final void l0() throws IOException {
        this.f34965g.write(this.f34962d, 0, this.f34964f);
        this.f34964f = 0;
    }

    public final void m0() {
        if (this.f34964f > 0) {
            l0();
        }
    }

    public final void n0(int i5) throws IOException {
        if (this.f34963e - this.f34964f < i5) {
            l0();
        }
    }

    public final void o0(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f34964f;
        int i13 = this.f34963e;
        int i14 = i13 - i12;
        byte[] bArr2 = this.f34962d;
        if (i14 >= i11) {
            System.arraycopy(bArr, i5, bArr2, i12, i11);
            this.f34964f += i11;
            return;
        }
        System.arraycopy(bArr, i5, bArr2, i12, i14);
        int i15 = i5 + i14;
        int i16 = i11 - i14;
        this.f34964f = i13;
        l0();
        if (i16 > i13) {
            this.f34965g.write(bArr, i15, i16);
        } else {
            System.arraycopy(bArr, i15, bArr2, 0, i16);
            this.f34964f = i16;
        }
    }
}
