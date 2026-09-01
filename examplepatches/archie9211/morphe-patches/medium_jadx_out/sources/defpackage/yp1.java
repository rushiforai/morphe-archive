package defpackage;

import com.google.protobuf.CodedOutputStream$OutOfSpaceException;
import java.io.IOException;
import java.io.OutputStream;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yp1 extends aq1 {
    public final byte[] d;
    public final int e;
    public int f;
    public final OutputStream g;

    public yp1(OutputStream outputStream, int i) {
        if (i < 0) {
            ay0.e("bufferSize must be >= 0");
            throw null;
        }
        int iMax = Math.max(i, 20);
        this.d = new byte[iMax];
        this.e = iMax;
        if (outputStream != null) {
            this.g = outputStream;
        } else {
            z72.c("out");
            throw null;
        }
    }

    @Override // defpackage.aq1
    public final void A(int i, String str) throws IOException {
        C(i, 2);
        B(str);
    }

    @Override // defpackage.aq1
    public final void B(String str) throws IOException {
        try {
            int length = str.length() * 3;
            int iJ = aq1.j(length);
            int i = iJ + length;
            int i2 = this.e;
            if (i > i2) {
                byte[] bArr = new byte[length];
                int iP = toe.a.p(str, bArr, 0, length);
                E(iP);
                O(bArr, 0, iP);
                return;
            }
            if (i > i2 - this.f) {
                M();
            }
            int iJ2 = aq1.j(str.length());
            int i3 = this.f;
            byte[] bArr2 = this.d;
            try {
                if (iJ2 == iJ) {
                    int i4 = i3 + iJ2;
                    this.f = i4;
                    int iP2 = toe.a.p(str, bArr2, i4, i2 - i4);
                    this.f = i3;
                    K((iP2 - i3) - iJ2);
                    this.f = iP2;
                } else {
                    int iA = toe.a(str);
                    K(iA);
                    this.f = toe.a.p(str, bArr2, this.f, iA);
                }
            } catch (ArrayIndexOutOfBoundsException e) {
                throw new CodedOutputStream$OutOfSpaceException(e);
            } catch (roe e2) {
                this.f = i3;
                throw e2;
            }
        } catch (roe e3) {
            l(str, e3);
        }
    }

    @Override // defpackage.aq1
    public final void C(int i, int i2) {
        E((i << 3) | i2);
    }

    @Override // defpackage.aq1
    public final void D(int i, int i2) {
        N(20);
        J(i, 0);
        K(i2);
    }

    @Override // defpackage.aq1
    public final void E(int i) {
        N(5);
        K(i);
    }

    @Override // defpackage.aq1
    public final void F(int i, long j) {
        N(20);
        J(i, 0);
        L(j);
    }

    @Override // defpackage.aq1
    public final void G(long j) {
        N(10);
        L(j);
    }

    public final void H(int i) {
        int i2 = this.f;
        int i3 = i2 + 1;
        this.f = i3;
        byte[] bArr = this.d;
        bArr[i2] = (byte) (i & 255);
        int i4 = i2 + 2;
        this.f = i4;
        bArr[i3] = (byte) ((i >> 8) & 255);
        int i5 = i2 + 3;
        this.f = i5;
        bArr[i4] = (byte) ((i >> 16) & 255);
        this.f = i2 + 4;
        bArr[i5] = (byte) ((i >> 24) & 255);
    }

    public final void I(long j) {
        int i = this.f;
        int i2 = i + 1;
        this.f = i2;
        byte[] bArr = this.d;
        bArr[i] = (byte) (j & 255);
        int i3 = i + 2;
        this.f = i3;
        bArr[i2] = (byte) ((j >> 8) & 255);
        int i4 = i + 3;
        this.f = i4;
        bArr[i3] = (byte) ((j >> 16) & 255);
        int i5 = i + 4;
        this.f = i5;
        bArr[i4] = (byte) (255 & (j >> 24));
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
    }

    public final void J(int i, int i2) {
        K((i << 3) | i2);
    }

    public final void K(int i) {
        boolean z = aq1.c;
        byte[] bArr = this.d;
        if (z) {
            while (true) {
                int i2 = i & (-128);
                int i3 = this.f;
                if (i2 == 0) {
                    this.f = i3 + 1;
                    r2e.l(bArr, i3, (byte) i);
                    return;
                } else {
                    this.f = i3 + 1;
                    r2e.l(bArr, i3, (byte) ((i & 127) | 128));
                    i >>>= 7;
                }
            }
        } else {
            while (true) {
                int i4 = i & (-128);
                int i5 = this.f;
                if (i4 == 0) {
                    this.f = i5 + 1;
                    bArr[i5] = (byte) i;
                    return;
                } else {
                    this.f = i5 + 1;
                    bArr[i5] = (byte) ((i & 127) | 128);
                    i >>>= 7;
                }
            }
        }
    }

    public final void L(long j) {
        boolean z = aq1.c;
        byte[] bArr = this.d;
        if (z) {
            while (true) {
                long j2 = j & (-128);
                int i = this.f;
                if (j2 == 0) {
                    this.f = i + 1;
                    r2e.l(bArr, i, (byte) j);
                    return;
                } else {
                    this.f = i + 1;
                    r2e.l(bArr, i, (byte) ((((int) j) & 127) | 128));
                    j >>>= 7;
                }
            }
        } else {
            while (true) {
                long j3 = j & (-128);
                int i2 = this.f;
                if (j3 == 0) {
                    this.f = i2 + 1;
                    bArr[i2] = (byte) j;
                    return;
                } else {
                    this.f = i2 + 1;
                    bArr[i2] = (byte) ((((int) j) & 127) | 128);
                    j >>>= 7;
                }
            }
        }
    }

    public final void M() {
        this.g.write(this.d, 0, this.f);
        this.f = 0;
    }

    public final void N(int i) {
        if (this.e - this.f < i) {
            M();
        }
    }

    public final void O(byte[] bArr, int i, int i2) throws IOException {
        int i3 = this.f;
        int i4 = this.e;
        int i5 = i4 - i3;
        byte[] bArr2 = this.d;
        if (i5 >= i2) {
            System.arraycopy(bArr, i, bArr2, i3, i2);
            this.f += i2;
            return;
        }
        System.arraycopy(bArr, i, bArr2, i3, i5);
        int i6 = i + i5;
        int i7 = i2 - i5;
        this.f = i4;
        M();
        if (i7 > i4) {
            this.g.write(bArr, i6, i7);
        } else {
            System.arraycopy(bArr, i6, bArr2, 0, i7);
            this.f = i7;
        }
    }

    @Override // defpackage.aq1
    public final void m(byte b) {
        if (this.f == this.e) {
            M();
        }
        int i = this.f;
        this.f = i + 1;
        this.d[i] = b;
    }

    @Override // defpackage.aq1
    public final void n(int i, boolean z) {
        N(11);
        J(i, 0);
        byte b = z ? (byte) 1 : (byte) 0;
        int i2 = this.f;
        this.f = i2 + 1;
        this.d[i2] = b;
    }

    @Override // defpackage.aq1
    public final void o(int i, byte[] bArr) throws IOException {
        E(i);
        O(bArr, 0, i);
    }

    @Override // defpackage.aq1
    public final void p(int i, f21 f21Var) {
        C(i, 2);
        q(f21Var);
    }

    @Override // defpackage.aq1
    public final void q(f21 f21Var) {
        E(f21Var.size());
        f21Var.v(this);
    }

    @Override // defpackage.aq1
    public final void r(int i, int i2) {
        N(14);
        J(i, 5);
        H(i2);
    }

    @Override // defpackage.aq1
    public final void s(int i) {
        N(4);
        H(i);
    }

    @Override // defpackage.aq1
    public final void t(int i, long j) {
        N(18);
        J(i, 1);
        I(j);
    }

    @Override // defpackage.aq1
    public final void u(long j) {
        N(8);
        I(j);
    }

    @Override // defpackage.aq1
    public final void v(int i, int i2) {
        N(20);
        J(i, 0);
        if (i2 >= 0) {
            K(i2);
        } else {
            L(i2);
        }
    }

    @Override // defpackage.aq1
    public final void w(int i) {
        if (i >= 0) {
            E(i);
        } else {
            G(i);
        }
    }

    @Override // defpackage.aq1
    public final void x(byte[] bArr, int i, int i2) throws IOException {
        O(bArr, i, i2);
    }

    @Override // defpackage.aq1
    public final void y(int i, cz7 cz7Var, brb brbVar) {
        C(i, 2);
        E(((r1) cz7Var).getSerializedSize(brbVar));
        brbVar.i(cz7Var, this.a);
    }

    @Override // defpackage.aq1
    public final void z(cz7 cz7Var) {
        E(cz7Var.getSerializedSize());
        cz7Var.writeTo(this);
    }
}
