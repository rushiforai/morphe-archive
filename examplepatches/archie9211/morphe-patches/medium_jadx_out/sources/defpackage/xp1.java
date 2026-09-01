package defpackage;

import com.google.protobuf.CodedOutputStream$OutOfSpaceException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xp1 extends aq1 {
    public final byte[] d;
    public final int e;
    public int f;

    public xp1(byte[] bArr, int i) {
        if (((bArr.length - i) | i) < 0) {
            fm3.e("Array range is invalid. Buffer.length=%d, offset=%d, length=%d", new Object[]{Integer.valueOf(bArr.length), 0, Integer.valueOf(i)});
            throw null;
        }
        this.d = bArr;
        this.f = 0;
        this.e = i;
    }

    @Override // defpackage.aq1
    public final void A(int i, String str) throws CodedOutputStream$OutOfSpaceException {
        C(i, 2);
        B(str);
    }

    @Override // defpackage.aq1
    public final void B(String str) throws CodedOutputStream$OutOfSpaceException {
        int i = this.f;
        try {
            int iJ = aq1.j(str.length() * 3);
            int iJ2 = aq1.j(str.length());
            byte[] bArr = this.d;
            if (iJ2 != iJ) {
                E(toe.a(str));
                this.f = toe.a.p(str, bArr, this.f, H());
                return;
            }
            int i2 = i + iJ2;
            this.f = i2;
            int iP = toe.a.p(str, bArr, i2, H());
            this.f = i;
            E((iP - i) - iJ2);
            this.f = iP;
        } catch (IndexOutOfBoundsException e) {
            throw new CodedOutputStream$OutOfSpaceException(e);
        } catch (roe e2) {
            this.f = i;
            l(str, e2);
        }
    }

    @Override // defpackage.aq1
    public final void C(int i, int i2) throws CodedOutputStream$OutOfSpaceException {
        E((i << 3) | i2);
    }

    @Override // defpackage.aq1
    public final void D(int i, int i2) throws CodedOutputStream$OutOfSpaceException {
        C(i, 0);
        E(i2);
    }

    @Override // defpackage.aq1
    public final void E(int i) throws CodedOutputStream$OutOfSpaceException {
        while (true) {
            int i2 = i & (-128);
            int i3 = this.f;
            byte[] bArr = this.d;
            if (i2 == 0) {
                this.f = i3 + 1;
                bArr[i3] = (byte) i;
                return;
            } else {
                try {
                    this.f = i3 + 1;
                    bArr[i3] = (byte) ((i & 127) | 128);
                    i >>>= 7;
                } catch (IndexOutOfBoundsException e) {
                    throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f), Integer.valueOf(this.e), 1), e);
                }
            }
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f), Integer.valueOf(this.e), 1), e);
        }
    }

    @Override // defpackage.aq1
    public final void F(int i, long j) throws CodedOutputStream$OutOfSpaceException {
        C(i, 0);
        G(j);
    }

    @Override // defpackage.aq1
    public final void G(long j) throws CodedOutputStream$OutOfSpaceException {
        boolean z = aq1.c;
        byte[] bArr = this.d;
        if (!z || H() < 10) {
            while (true) {
                long j2 = j & (-128);
                int i = this.f;
                if (j2 == 0) {
                    this.f = i + 1;
                    bArr[i] = (byte) j;
                    return;
                } else {
                    try {
                        this.f = i + 1;
                        bArr[i] = (byte) ((((int) j) & 127) | 128);
                        j >>>= 7;
                    } catch (IndexOutOfBoundsException e) {
                        throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f), Integer.valueOf(this.e), 1), e);
                    }
                }
                throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f), Integer.valueOf(this.e), 1), e);
            }
        }
        while (true) {
            long j3 = j & (-128);
            int i2 = this.f;
            if (j3 == 0) {
                this.f = i2 + 1;
                r2e.l(bArr, i2, (byte) j);
                return;
            } else {
                this.f = i2 + 1;
                r2e.l(bArr, i2, (byte) ((((int) j) & 127) | 128));
                j >>>= 7;
            }
        }
    }

    public final int H() {
        return this.e - this.f;
    }

    public final void I(byte[] bArr, int i, int i2) throws CodedOutputStream$OutOfSpaceException {
        try {
            System.arraycopy(bArr, i, this.d, this.f, i2);
            this.f += i2;
        } catch (IndexOutOfBoundsException e) {
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f), Integer.valueOf(this.e), Integer.valueOf(i2)), e);
        }
    }

    @Override // defpackage.aq1
    public final void m(byte b) throws CodedOutputStream$OutOfSpaceException {
        try {
            byte[] bArr = this.d;
            int i = this.f;
            this.f = i + 1;
            bArr[i] = b;
        } catch (IndexOutOfBoundsException e) {
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f), Integer.valueOf(this.e), 1), e);
        }
    }

    @Override // defpackage.aq1
    public final void n(int i, boolean z) throws CodedOutputStream$OutOfSpaceException {
        C(i, 0);
        m(z ? (byte) 1 : (byte) 0);
    }

    @Override // defpackage.aq1
    public final void o(int i, byte[] bArr) throws CodedOutputStream$OutOfSpaceException {
        E(i);
        I(bArr, 0, i);
    }

    @Override // defpackage.aq1
    public final void p(int i, f21 f21Var) throws CodedOutputStream$OutOfSpaceException {
        C(i, 2);
        q(f21Var);
    }

    @Override // defpackage.aq1
    public final void q(f21 f21Var) throws CodedOutputStream$OutOfSpaceException {
        E(f21Var.size());
        f21Var.v(this);
    }

    @Override // defpackage.aq1
    public final void r(int i, int i2) throws CodedOutputStream$OutOfSpaceException {
        C(i, 5);
        s(i2);
    }

    @Override // defpackage.aq1
    public final void s(int i) throws CodedOutputStream$OutOfSpaceException {
        try {
            byte[] bArr = this.d;
            int i2 = this.f;
            int i3 = i2 + 1;
            this.f = i3;
            bArr[i2] = (byte) (i & 255);
            int i4 = i2 + 2;
            this.f = i4;
            bArr[i3] = (byte) ((i >> 8) & 255);
            int i5 = i2 + 3;
            this.f = i5;
            bArr[i4] = (byte) ((i >> 16) & 255);
            this.f = i2 + 4;
            bArr[i5] = (byte) ((i >> 24) & 255);
        } catch (IndexOutOfBoundsException e) {
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f), Integer.valueOf(this.e), 1), e);
        }
    }

    @Override // defpackage.aq1
    public final void t(int i, long j) throws CodedOutputStream$OutOfSpaceException {
        C(i, 1);
        u(j);
    }

    @Override // defpackage.aq1
    public final void u(long j) throws CodedOutputStream$OutOfSpaceException {
        try {
            byte[] bArr = this.d;
            int i = this.f;
            int i2 = i + 1;
            this.f = i2;
            bArr[i] = (byte) (((int) j) & 255);
            int i3 = i + 2;
            this.f = i3;
            bArr[i2] = (byte) (((int) (j >> 8)) & 255);
            int i4 = i + 3;
            this.f = i4;
            bArr[i3] = (byte) (((int) (j >> 16)) & 255);
            int i5 = i + 4;
            this.f = i5;
            bArr[i4] = (byte) (((int) (j >> 24)) & 255);
            int i6 = i + 5;
            this.f = i6;
            bArr[i5] = (byte) (((int) (j >> 32)) & 255);
            int i7 = i + 6;
            this.f = i7;
            bArr[i6] = (byte) (((int) (j >> 40)) & 255);
            int i8 = i + 7;
            this.f = i8;
            bArr[i7] = (byte) (((int) (j >> 48)) & 255);
            this.f = i + 8;
            bArr[i8] = (byte) (((int) (j >> 56)) & 255);
        } catch (IndexOutOfBoundsException e) {
            throw new CodedOutputStream$OutOfSpaceException(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f), Integer.valueOf(this.e), 1), e);
        }
    }

    @Override // defpackage.aq1
    public final void v(int i, int i2) throws CodedOutputStream$OutOfSpaceException {
        C(i, 0);
        w(i2);
    }

    @Override // defpackage.aq1
    public final void w(int i) throws CodedOutputStream$OutOfSpaceException {
        if (i >= 0) {
            E(i);
        } else {
            G(i);
        }
    }

    @Override // defpackage.aq1
    public final void x(byte[] bArr, int i, int i2) throws CodedOutputStream$OutOfSpaceException {
        I(bArr, i, i2);
    }

    @Override // defpackage.aq1
    public final void y(int i, cz7 cz7Var, brb brbVar) throws CodedOutputStream$OutOfSpaceException {
        C(i, 2);
        E(((r1) cz7Var).getSerializedSize(brbVar));
        brbVar.i(cz7Var, this.a);
    }

    @Override // defpackage.aq1
    public final void z(cz7 cz7Var) throws CodedOutputStream$OutOfSpaceException {
        E(cz7Var.getSerializedSize());
        cz7Var.writeTo(this);
    }
}
