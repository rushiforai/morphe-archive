package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzakd;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jtf extends htf {
    public final byte[] c;
    public final int d;
    public int e;
    public final ByteArrayOutputStream f;

    public jtf(ByteArrayOutputStream byteArrayOutputStream, int i) {
        this.f = byteArrayOutputStream;
        if (i < 0) {
            ay0.e("bufferSize must be >= 0");
            throw null;
        }
        int iMax = Math.max(i, 20);
        this.c = new byte[iMax];
        this.d = iMax;
    }

    public final void A(int i, int i2) {
        C((i << 3) | i2);
    }

    public final void B(int i) {
        int i2 = this.e;
        byte[] bArr = this.c;
        bArr[i2] = (byte) i;
        bArr[i2 + 1] = (byte) (i >> 8);
        bArr[i2 + 2] = (byte) (i >> 16);
        bArr[i2 + 3] = i >> 24;
        this.e = i2 + 4;
    }

    public final void C(int i) {
        boolean z = htf.b;
        byte[] bArr = this.c;
        if (z) {
            while (true) {
                int i2 = i & (-128);
                int i3 = this.e;
                if (i2 == 0) {
                    this.e = i3 + 1;
                    avf.d(bArr, i3, (byte) i);
                    return;
                } else {
                    this.e = i3 + 1;
                    avf.d(bArr, i3, (byte) (i | 128));
                    i >>>= 7;
                }
            }
        } else {
            while (true) {
                int i4 = i & (-128);
                int i5 = this.e;
                if (i4 == 0) {
                    this.e = i5 + 1;
                    bArr[i5] = (byte) i;
                    return;
                } else {
                    this.e = i5 + 1;
                    bArr[i5] = (byte) (i | 128);
                    i >>>= 7;
                }
            }
        }
    }

    public final void D(int i) throws IOException {
        if (this.d - this.e < i) {
            x();
        }
    }

    @Override // defpackage.htf
    public final int a() {
        throw new UnsupportedOperationException("spaceLeft() can only be called on CodedOutputStreams that are writing to a flat array or ByteBuffer.");
    }

    @Override // defpackage.htf
    public final void b(byte b) throws IOException {
        if (this.e == this.d) {
            x();
        }
        int i = this.e;
        this.c[i] = b;
        this.e = i + 1;
    }

    @Override // defpackage.htf
    public final void c(int i) throws IOException {
        D(4);
        B(i);
    }

    @Override // defpackage.htf
    public final void d(int i, int i2) throws IOException {
        D(14);
        A(i, 5);
        B(i2);
    }

    @Override // defpackage.htf
    public final void e(int i, long j) throws IOException {
        D(18);
        A(i, 1);
        y(j);
    }

    @Override // defpackage.htf
    public final void f(int i, String str) throws IOException {
        r(i, 2);
        int length = str.length() * 3;
        int iV = htf.v(length);
        int i2 = iV + length;
        int i3 = this.d;
        if (i2 > i3) {
            byte[] bArr = new byte[length];
            int iR = fp7.r(str, bArr, 0, length);
            q(iR);
            w(bArr, 0, iR);
            return;
        }
        if (i2 > i3 - this.e) {
            x();
        }
        int iV2 = htf.v(str.length());
        int i4 = this.e;
        byte[] bArr2 = this.c;
        try {
            if (iV2 != iV) {
                int iQ = fp7.q(str);
                C(iQ);
                this.e = fp7.r(str, bArr2, this.e, iQ);
            } else {
                int i5 = i4 + iV2;
                this.e = i5;
                int iR2 = fp7.r(str, bArr2, i5, i3 - i5);
                this.e = i4;
                C((iR2 - i4) - iV2);
                this.e = iR2;
            }
        } catch (ArrayIndexOutOfBoundsException e) {
            throw new zzakd(e);
        }
    }

    @Override // defpackage.htf
    public final void g(int i, hsf hsfVar) throws IOException {
        r(i, 2);
        q(hsfVar.e());
        hsfVar.u(this);
    }

    @Override // defpackage.htf
    public final void h(int i, boolean z) throws IOException {
        D(11);
        A(i, 0);
        byte b = z ? (byte) 1 : (byte) 0;
        int i2 = this.e;
        this.c[i2] = b;
        this.e = i2 + 1;
    }

    @Override // defpackage.htf
    public final void i(long j) throws IOException {
        D(8);
        y(j);
    }

    @Override // defpackage.htf
    public final void j(byte[] bArr, int i, int i2) throws IOException {
        w(bArr, i, i2);
    }

    @Override // defpackage.htf
    public final void k(int i) throws IOException {
        if (i >= 0) {
            q(i);
        } else {
            n(i);
        }
    }

    @Override // defpackage.htf
    public final void l(int i, int i2) throws IOException {
        D(20);
        A(i, 0);
        if (i2 >= 0) {
            C(i2);
        } else {
            z(i2);
        }
    }

    @Override // defpackage.htf
    public final void m(int i, long j) throws IOException {
        D(20);
        A(i, 0);
        z(j);
    }

    @Override // defpackage.htf
    public final void n(long j) throws IOException {
        D(10);
        z(j);
    }

    @Override // defpackage.htf
    public final void q(int i) throws IOException {
        D(5);
        C(i);
    }

    @Override // defpackage.htf
    public final void r(int i, int i2) throws IOException {
        q((i << 3) | i2);
    }

    @Override // defpackage.htf
    public final void s(int i, int i2) throws IOException {
        D(20);
        A(i, 0);
        C(i2);
    }

    public final void w(byte[] bArr, int i, int i2) throws IOException {
        int i3 = this.e;
        int i4 = this.d;
        int i5 = i4 - i3;
        byte[] bArr2 = this.c;
        if (i5 >= i2) {
            System.arraycopy(bArr, i, bArr2, i3, i2);
            this.e += i2;
            return;
        }
        System.arraycopy(bArr, i, bArr2, i3, i5);
        int i6 = i + i5;
        int i7 = i2 - i5;
        this.e = i4;
        x();
        if (i7 > i4) {
            this.f.write(bArr, i6, i7);
        } else {
            System.arraycopy(bArr, i6, bArr2, 0, i7);
            this.e = i7;
        }
    }

    public final void x() throws IOException {
        this.f.write(this.c, 0, this.e);
        this.e = 0;
    }

    public final void y(long j) {
        int i = this.e;
        byte[] bArr = this.c;
        bArr[i] = (byte) j;
        bArr[i + 1] = (byte) (j >> 8);
        bArr[i + 2] = (byte) (j >> 16);
        bArr[i + 3] = (byte) (j >> 24);
        bArr[i + 4] = (byte) (j >> 32);
        bArr[i + 5] = (byte) (j >> 40);
        bArr[i + 6] = (byte) (j >> 48);
        bArr[i + 7] = (byte) (j >> 56);
        this.e = i + 8;
    }

    public final void z(long j) {
        boolean z = htf.b;
        byte[] bArr = this.c;
        if (z) {
            while (true) {
                long j2 = j & (-128);
                int i = this.e;
                if (j2 == 0) {
                    this.e = i + 1;
                    avf.d(bArr, i, (byte) j);
                    return;
                } else {
                    this.e = i + 1;
                    avf.d(bArr, i, (byte) (((int) j) | 128));
                    j >>>= 7;
                }
            }
        } else {
            while (true) {
                long j3 = j & (-128);
                int i2 = this.e;
                if (j3 == 0) {
                    this.e = i2 + 1;
                    bArr[i2] = (byte) j;
                    return;
                } else {
                    this.e = i2 + 1;
                    bArr[i2] = (byte) (((int) j) | 128);
                    j >>>= 7;
                }
            }
        }
    }
}
