package androidx.datastore.preferences.protobuf;

import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public final class m extends x7.f {

    /* renamed from: g, reason: collision with root package name */
    public static final Logger f14353g = Logger.getLogger(m.class.getName());

    /* renamed from: h, reason: collision with root package name */
    public static final boolean f14354h = n1.f14367e;

    /* renamed from: b, reason: collision with root package name */
    public j0 f14355b;

    /* renamed from: c, reason: collision with root package name */
    public final byte[] f14356c;

    /* renamed from: d, reason: collision with root package name */
    public final int f14357d;

    /* renamed from: e, reason: collision with root package name */
    public int f14358e;

    /* renamed from: f, reason: collision with root package name */
    public final OutputStream f14359f;

    public m(OutputStream outputStream, int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException("bufferSize must be >= 0");
        }
        int iMax = Math.max(i5, 20);
        this.f14356c = new byte[iMax];
        this.f14357d = iMax;
        if (outputStream == null) {
            throw new NullPointerException("out");
        }
        this.f14359f = outputStream;
    }

    public static int g0(String str) {
        int length;
        try {
            length = q1.a(str);
        } catch (p1 unused) {
            length = str.getBytes(b0.f14278a).length;
        }
        return i0(length) + length;
    }

    public static int h0(int i5) {
        return i0(i5 << 3);
    }

    public static int i0(int i5) {
        return (352 - (Integer.numberOfLeadingZeros(i5) * 9)) >>> 6;
    }

    public static int j0(long j11) {
        return (640 - (Long.numberOfLeadingZeros(j11) * 9)) >>> 6;
    }

    public final void A0(int i5, int i11) {
        C0((i5 << 3) | i11);
    }

    public final void B0(int i5, int i11) throws IOException {
        l0(20);
        d0(i5, 0);
        e0(i11);
    }

    public final void C0(int i5) throws IOException {
        l0(5);
        e0(i5);
    }

    public final void D0(int i5, long j11) {
        l0(20);
        d0(i5, 0);
        f0(j11);
    }

    public final void E0(long j11) throws IOException {
        l0(10);
        f0(j11);
    }

    @Override // x7.f
    public final void Z(int i5, int i11, byte[] bArr) throws IOException {
        n0(bArr, i5, i11);
    }

    public final void b0(int i5) {
        int i11 = this.f14358e;
        int i12 = i11 + 1;
        this.f14358e = i12;
        byte[] bArr = this.f14356c;
        bArr[i11] = (byte) (i5 & 255);
        int i13 = i11 + 2;
        this.f14358e = i13;
        bArr[i12] = (byte) ((i5 >> 8) & 255);
        int i14 = i11 + 3;
        this.f14358e = i14;
        bArr[i13] = (byte) ((i5 >> 16) & 255);
        this.f14358e = i11 + 4;
        bArr[i14] = (byte) ((i5 >> 24) & 255);
    }

    public final void c0(long j11) {
        int i5 = this.f14358e;
        int i11 = i5 + 1;
        this.f14358e = i11;
        byte[] bArr = this.f14356c;
        bArr[i5] = (byte) (j11 & 255);
        int i12 = i5 + 2;
        this.f14358e = i12;
        bArr[i11] = (byte) ((j11 >> 8) & 255);
        int i13 = i5 + 3;
        this.f14358e = i13;
        bArr[i12] = (byte) ((j11 >> 16) & 255);
        int i14 = i5 + 4;
        this.f14358e = i14;
        bArr[i13] = (byte) (255 & (j11 >> 24));
        int i15 = i5 + 5;
        this.f14358e = i15;
        bArr[i14] = (byte) (((int) (j11 >> 32)) & 255);
        int i16 = i5 + 6;
        this.f14358e = i16;
        bArr[i15] = (byte) (((int) (j11 >> 40)) & 255);
        int i17 = i5 + 7;
        this.f14358e = i17;
        bArr[i16] = (byte) (((int) (j11 >> 48)) & 255);
        this.f14358e = i5 + 8;
        bArr[i17] = (byte) (((int) (j11 >> 56)) & 255);
    }

    public final void d0(int i5, int i11) {
        e0((i5 << 3) | i11);
    }

    public final void e0(int i5) {
        boolean z11 = f14354h;
        byte[] bArr = this.f14356c;
        if (z11) {
            while ((i5 & (-128)) != 0) {
                int i11 = this.f14358e;
                this.f14358e = i11 + 1;
                n1.j(bArr, i11, (byte) ((i5 | 128) & 255));
                i5 >>>= 7;
            }
            int i12 = this.f14358e;
            this.f14358e = i12 + 1;
            n1.j(bArr, i12, (byte) i5);
            return;
        }
        while ((i5 & (-128)) != 0) {
            int i13 = this.f14358e;
            this.f14358e = i13 + 1;
            bArr[i13] = (byte) ((i5 | 128) & 255);
            i5 >>>= 7;
        }
        int i14 = this.f14358e;
        this.f14358e = i14 + 1;
        bArr[i14] = (byte) i5;
    }

    public final void f0(long j11) {
        boolean z11 = f14354h;
        byte[] bArr = this.f14356c;
        if (z11) {
            while ((j11 & (-128)) != 0) {
                int i5 = this.f14358e;
                this.f14358e = i5 + 1;
                n1.j(bArr, i5, (byte) ((((int) j11) | 128) & 255));
                j11 >>>= 7;
            }
            int i11 = this.f14358e;
            this.f14358e = i11 + 1;
            n1.j(bArr, i11, (byte) j11);
            return;
        }
        while ((j11 & (-128)) != 0) {
            int i12 = this.f14358e;
            this.f14358e = i12 + 1;
            bArr[i12] = (byte) ((((int) j11) | 128) & 255);
            j11 >>>= 7;
        }
        int i13 = this.f14358e;
        this.f14358e = i13 + 1;
        bArr[i13] = (byte) j11;
    }

    public final void k0() throws IOException {
        this.f14359f.write(this.f14356c, 0, this.f14358e);
        this.f14358e = 0;
    }

    public final void l0(int i5) throws IOException {
        if (this.f14357d - this.f14358e < i5) {
            k0();
        }
    }

    public final void m0(byte b11) throws IOException {
        if (this.f14358e == this.f14357d) {
            k0();
        }
        int i5 = this.f14358e;
        this.f14358e = i5 + 1;
        this.f14356c[i5] = b11;
    }

    public final void n0(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f14358e;
        int i13 = this.f14357d;
        int i14 = i13 - i12;
        byte[] bArr2 = this.f14356c;
        if (i14 >= i11) {
            System.arraycopy(bArr, i5, bArr2, i12, i11);
            this.f14358e += i11;
            return;
        }
        System.arraycopy(bArr, i5, bArr2, i12, i14);
        int i15 = i5 + i14;
        int i16 = i11 - i14;
        this.f14358e = i13;
        k0();
        if (i16 > i13) {
            this.f14359f.write(bArr, i15, i16);
        } else {
            System.arraycopy(bArr, i15, bArr2, 0, i16);
            this.f14358e = i16;
        }
    }

    public final void o0(int i5, boolean z11) throws IOException {
        l0(11);
        d0(i5, 0);
        byte b11 = z11 ? (byte) 1 : (byte) 0;
        int i11 = this.f14358e;
        this.f14358e = i11 + 1;
        this.f14356c[i11] = b11;
    }

    public final void p0(int i5, h hVar) {
        A0(i5, 2);
        q0(hVar);
    }

    public final void q0(h hVar) throws IOException {
        C0(hVar.size());
        Z(hVar.g(), hVar.size(), hVar.f14327b);
    }

    public final void r0(int i5, int i11) {
        l0(14);
        d0(i5, 5);
        b0(i11);
    }

    public final void s0(int i5) throws IOException {
        l0(4);
        b0(i5);
    }

    public final void t0(int i5, long j11) {
        l0(18);
        d0(i5, 1);
        c0(j11);
    }

    public final void u0(long j11) throws IOException {
        l0(8);
        c0(j11);
    }

    public final void v0(int i5, int i11) throws IOException {
        l0(20);
        d0(i5, 0);
        if (i11 >= 0) {
            e0(i11);
        } else {
            f0(i11);
        }
    }

    public final void w0(int i5) throws IOException {
        if (i5 >= 0) {
            C0(i5);
        } else {
            E0(i5);
        }
    }

    public final void x0(int i5, a aVar, z0 z0Var) throws IOException {
        A0(i5, 2);
        C0(aVar.a(z0Var));
        z0Var.e(aVar, this.f14355b);
    }

    public final void y0(int i5, String str) throws IOException {
        A0(i5, 2);
        z0(str);
    }

    public final void z0(String str) throws IOException {
        try {
            int length = str.length() * 3;
            int iI0 = i0(length);
            int i5 = iI0 + length;
            int i11 = this.f14357d;
            if (i5 > i11) {
                byte[] bArr = new byte[length];
                int iP = q1.f14388a.P(str, bArr, 0, length);
                C0(iP);
                n0(bArr, 0, iP);
                return;
            }
            if (i5 > i11 - this.f14358e) {
                k0();
            }
            int iI02 = i0(str.length());
            int i12 = this.f14358e;
            byte[] bArr2 = this.f14356c;
            try {
                if (iI02 == iI0) {
                    int i13 = i12 + iI02;
                    this.f14358e = i13;
                    int iP2 = q1.f14388a.P(str, bArr2, i13, i11 - i13);
                    this.f14358e = i12;
                    e0((iP2 - i12) - iI02);
                    this.f14358e = iP2;
                } else {
                    int iA = q1.a(str);
                    e0(iA);
                    this.f14358e = q1.f14388a.P(str, bArr2, this.f14358e, iA);
                }
            } catch (p1 e3) {
                this.f14358e = i12;
                throw e3;
            } catch (ArrayIndexOutOfBoundsException e11) {
                throw new CodedOutputStream$OutOfSpaceException(e11);
            }
        } catch (p1 e12) {
            f14353g.log(Level.WARNING, "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!", (Throwable) e12);
            byte[] bytes = str.getBytes(b0.f14278a);
            try {
                C0(bytes.length);
                Z(0, bytes.length, bytes);
            } catch (IndexOutOfBoundsException e13) {
                throw new CodedOutputStream$OutOfSpaceException(e13);
            }
        }
    }
}
