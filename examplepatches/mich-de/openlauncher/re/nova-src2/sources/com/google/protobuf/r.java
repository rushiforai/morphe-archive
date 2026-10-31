package com.google.protobuf;

/* loaded from: classes.dex */
public final class r extends t {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f34944d;

    /* renamed from: e, reason: collision with root package name */
    public final int f34945e;

    /* renamed from: f, reason: collision with root package name */
    public int f34946f;

    public r(byte[] bArr, int i5) {
        if (((bArr.length - i5) | i5) < 0) {
            throw new IllegalArgumentException(String.format("Array range is invalid. Buffer.length=%d, offset=%d, length=%d", Integer.valueOf(bArr.length), 0, Integer.valueOf(i5)));
        }
        this.f34944d = bArr;
        this.f34946f = 0;
        this.f34945e = i5;
    }

    @Override // com.google.protobuf.g
    public final void C(int i5, int i11, byte[] bArr) throws CodedOutputStream$OutOfSpaceException {
        h0(bArr, i5, i11);
    }

    @Override // com.google.protobuf.t
    public final void K(byte b11) throws CodedOutputStream$OutOfSpaceException {
        try {
            byte[] bArr = this.f34944d;
            int i5 = this.f34946f;
            this.f34946f = i5 + 1;
            bArr[i5] = b11;
        } catch (IndexOutOfBoundsException e3) {
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f34946f), Integer.valueOf(this.f34945e), 1), e3);
        }
    }

    @Override // com.google.protobuf.t
    public final void L(int i5, boolean z11) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 0);
        K(z11 ? (byte) 1 : (byte) 0);
    }

    @Override // com.google.protobuf.t
    public final void M(int i5, byte[] bArr) throws CodedOutputStream$OutOfSpaceException {
        d0(i5);
        h0(bArr, 0, i5);
    }

    @Override // com.google.protobuf.t
    public final void N(int i5, l lVar) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 2);
        O(lVar);
    }

    @Override // com.google.protobuf.t
    public final void O(l lVar) throws CodedOutputStream$OutOfSpaceException {
        d0(lVar.size());
        lVar.p(this);
    }

    @Override // com.google.protobuf.t
    public final void P(int i5, int i11) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 5);
        Q(i11);
    }

    @Override // com.google.protobuf.t
    public final void Q(int i5) throws CodedOutputStream$OutOfSpaceException {
        try {
            byte[] bArr = this.f34944d;
            int i11 = this.f34946f;
            int i12 = i11 + 1;
            this.f34946f = i12;
            bArr[i11] = (byte) (i5 & 255);
            int i13 = i11 + 2;
            this.f34946f = i13;
            bArr[i12] = (byte) ((i5 >> 8) & 255);
            int i14 = i11 + 3;
            this.f34946f = i14;
            bArr[i13] = (byte) ((i5 >> 16) & 255);
            this.f34946f = i11 + 4;
            bArr[i14] = (byte) ((i5 >> 24) & 255);
        } catch (IndexOutOfBoundsException e3) {
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f34946f), Integer.valueOf(this.f34945e), 1), e3);
        }
    }

    @Override // com.google.protobuf.t
    public final void R(int i5, long j11) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 1);
        S(j11);
    }

    @Override // com.google.protobuf.t
    public final void S(long j11) throws CodedOutputStream$OutOfSpaceException {
        try {
            byte[] bArr = this.f34944d;
            int i5 = this.f34946f;
            int i11 = i5 + 1;
            this.f34946f = i11;
            bArr[i5] = (byte) (((int) j11) & 255);
            int i12 = i5 + 2;
            this.f34946f = i12;
            bArr[i11] = (byte) (((int) (j11 >> 8)) & 255);
            int i13 = i5 + 3;
            this.f34946f = i13;
            bArr[i12] = (byte) (((int) (j11 >> 16)) & 255);
            int i14 = i5 + 4;
            this.f34946f = i14;
            bArr[i13] = (byte) (((int) (j11 >> 24)) & 255);
            int i15 = i5 + 5;
            this.f34946f = i15;
            bArr[i14] = (byte) (((int) (j11 >> 32)) & 255);
            int i16 = i5 + 6;
            this.f34946f = i16;
            bArr[i15] = (byte) (((int) (j11 >> 40)) & 255);
            int i17 = i5 + 7;
            this.f34946f = i17;
            bArr[i16] = (byte) (((int) (j11 >> 48)) & 255);
            this.f34946f = i5 + 8;
            bArr[i17] = (byte) (((int) (j11 >> 56)) & 255);
        } catch (IndexOutOfBoundsException e3) {
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f34946f), Integer.valueOf(this.f34945e), 1), e3);
        }
    }

    @Override // com.google.protobuf.t
    public final void T(int i5, int i11) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 0);
        U(i11);
    }

    @Override // com.google.protobuf.t
    public final void U(int i5) throws CodedOutputStream$OutOfSpaceException {
        if (i5 >= 0) {
            d0(i5);
        } else {
            f0(i5);
        }
    }

    @Override // com.google.protobuf.t
    public final void V(int i5, o1 o1Var, b2 b2Var) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 2);
        d0(((c) o1Var).getSerializedSize(b2Var));
        b2Var.e(o1Var, this.f34972a);
    }

    @Override // com.google.protobuf.t
    public final void W(o1 o1Var) throws CodedOutputStream$OutOfSpaceException {
        d0(o1Var.getSerializedSize());
        o1Var.writeTo(this);
    }

    @Override // com.google.protobuf.t
    public final void X(int i5, o1 o1Var) throws CodedOutputStream$OutOfSpaceException {
        b0(1, 3);
        c0(2, i5);
        b0(3, 2);
        W(o1Var);
        b0(1, 4);
    }

    @Override // com.google.protobuf.t
    public final void Y(int i5, l lVar) throws CodedOutputStream$OutOfSpaceException {
        b0(1, 3);
        c0(2, i5);
        N(3, lVar);
        b0(1, 4);
    }

    @Override // com.google.protobuf.t
    public final void Z(int i5, String str) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 2);
        a0(str);
    }

    @Override // com.google.protobuf.t
    public final void a0(String str) throws CodedOutputStream$OutOfSpaceException {
        int i5 = this.f34946f;
        try {
            int iH = t.H(str.length() * 3);
            int iH2 = t.H(str.length());
            byte[] bArr = this.f34944d;
            if (iH2 != iH) {
                d0(o2.c(str));
                this.f34946f = o2.b(str, bArr, this.f34946f, g0());
                return;
            }
            int i11 = i5 + iH2;
            this.f34946f = i11;
            int iB = o2.b(str, bArr, i11, g0());
            this.f34946f = i5;
            d0((iB - i5) - iH2);
            this.f34946f = iB;
        } catch (n2 e3) {
            this.f34946f = i5;
            J(str, e3);
        } catch (IndexOutOfBoundsException e11) {
            throw new CodedOutputStream$OutOfSpaceException(e11);
        }
    }

    @Override // com.google.protobuf.t
    public final void b0(int i5, int i11) throws CodedOutputStream$OutOfSpaceException {
        d0((i5 << 3) | i11);
    }

    @Override // com.google.protobuf.t
    public final void c0(int i5, int i11) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 0);
        d0(i11);
    }

    @Override // com.google.protobuf.t
    public final void d0(int i5) throws CodedOutputStream$OutOfSpaceException {
        while (true) {
            int i11 = i5 & (-128);
            byte[] bArr = this.f34944d;
            if (i11 == 0) {
                int i12 = this.f34946f;
                this.f34946f = i12 + 1;
                bArr[i12] = (byte) i5;
                return;
            } else {
                try {
                    int i13 = this.f34946f;
                    this.f34946f = i13 + 1;
                    bArr[i13] = (byte) ((i5 | 128) & 255);
                    i5 >>>= 7;
                } catch (IndexOutOfBoundsException e3) {
                    throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f34946f), Integer.valueOf(this.f34945e), 1), e3);
                }
            }
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f34946f), Integer.valueOf(this.f34945e), 1), e3);
        }
    }

    @Override // com.google.protobuf.t
    public final void e0(int i5, long j11) throws CodedOutputStream$OutOfSpaceException {
        b0(i5, 0);
        f0(j11);
    }

    @Override // com.google.protobuf.t
    public final void f0(long j11) throws CodedOutputStream$OutOfSpaceException {
        boolean z11 = t.f34971c;
        byte[] bArr = this.f34944d;
        if (z11 && g0() >= 10) {
            while ((j11 & (-128)) != 0) {
                int i5 = this.f34946f;
                this.f34946f = i5 + 1;
                m2.i(bArr, i5, (byte) ((((int) j11) | 128) & 255));
                j11 >>>= 7;
            }
            int i11 = this.f34946f;
            this.f34946f = i11 + 1;
            m2.i(bArr, i11, (byte) j11);
            return;
        }
        while ((j11 & (-128)) != 0) {
            try {
                int i12 = this.f34946f;
                this.f34946f = i12 + 1;
                bArr[i12] = (byte) ((((int) j11) | 128) & 255);
                j11 >>>= 7;
            } catch (IndexOutOfBoundsException e3) {
                throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f34946f), Integer.valueOf(this.f34945e), 1), e3);
            }
        }
        int i13 = this.f34946f;
        this.f34946f = i13 + 1;
        bArr[i13] = (byte) j11;
    }

    public final int g0() {
        return this.f34945e - this.f34946f;
    }

    public final void h0(byte[] bArr, int i5, int i11) throws CodedOutputStream$OutOfSpaceException {
        try {
            System.arraycopy(bArr, i5, this.f34944d, this.f34946f, i11);
            this.f34946f += i11;
        } catch (IndexOutOfBoundsException e3) {
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f34946f), Integer.valueOf(this.f34945e), Integer.valueOf(i11)), e3);
        }
    }
}
