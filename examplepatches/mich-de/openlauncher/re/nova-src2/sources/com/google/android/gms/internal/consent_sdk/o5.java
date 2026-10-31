package com.google.android.gms.internal.consent_sdk;

import java.io.IOException;
import java.io.OutputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class o5 extends mk.v {

    /* renamed from: i, reason: collision with root package name */
    public static final Logger f32197i = Logger.getLogger(o5.class.getName());

    /* renamed from: j, reason: collision with root package name */
    public static final boolean f32198j = e7.f32059e;

    /* renamed from: d, reason: collision with root package name */
    public h6 f32199d;

    /* renamed from: e, reason: collision with root package name */
    public final byte[] f32200e;

    /* renamed from: f, reason: collision with root package name */
    public final int f32201f;

    /* renamed from: g, reason: collision with root package name */
    public int f32202g;

    /* renamed from: h, reason: collision with root package name */
    public final OutputStream f32203h;

    public o5(OutputStream outputStream, int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException("bufferSize must be >= 0");
        }
        int iMax = Math.max(i5, 20);
        this.f32200e = new byte[iMax];
        this.f32201f = iMax;
        if (outputStream == null) {
            throw new NullPointerException("out");
        }
        this.f32203h = outputStream;
    }

    public static int V(String str) {
        int length;
        try {
            length = g7.b(str);
        } catch (f7 unused) {
            length = str.getBytes(b6.f31997a).length;
        }
        return W(length) + length;
    }

    public static int W(int i5) {
        return (352 - (Integer.numberOfLeadingZeros(i5) * 9)) >>> 6;
    }

    public static int X(long j11) {
        return (640 - (Long.numberOfLeadingZeros(j11) * 9)) >>> 6;
    }

    public final void Y() throws IOException {
        this.f32203h.write(this.f32200e, 0, this.f32202g);
        this.f32202g = 0;
    }

    public final void Z(int i5) throws IOException {
        if (this.f32201f - this.f32202g < i5) {
            Y();
        }
    }

    public final void a0(int i5) {
        int i11 = this.f32202g;
        byte[] bArr = this.f32200e;
        bArr[i11] = (byte) i5;
        bArr[i11 + 1] = (byte) (i5 >> 8);
        bArr[i11 + 2] = (byte) (i5 >> 16);
        bArr[i11 + 3] = (byte) (i5 >> 24);
        this.f32202g = i11 + 4;
    }

    public final void b0(long j11) {
        int i5 = this.f32202g;
        byte[] bArr = this.f32200e;
        bArr[i5] = (byte) j11;
        bArr[i5 + 1] = (byte) (j11 >> 8);
        bArr[i5 + 2] = (byte) (j11 >> 16);
        bArr[i5 + 3] = (byte) (j11 >> 24);
        bArr[i5 + 4] = (byte) (j11 >> 32);
        bArr[i5 + 5] = (byte) (j11 >> 40);
        bArr[i5 + 6] = (byte) (j11 >> 48);
        bArr[i5 + 7] = (byte) (j11 >> 56);
        this.f32202g = i5 + 8;
    }

    public final void c0(int i5) {
        boolean z11 = f32198j;
        byte[] bArr = this.f32200e;
        if (!z11) {
            while ((i5 & (-128)) != 0) {
                int i11 = this.f32202g;
                this.f32202g = i11 + 1;
                bArr[i11] = (byte) (i5 | 128);
                i5 >>>= 7;
            }
            int i12 = this.f32202g;
            this.f32202g = i12 + 1;
            bArr[i12] = (byte) i5;
            return;
        }
        while ((i5 & (-128)) != 0) {
            int i13 = this.f32202g;
            this.f32202g = i13 + 1;
            e7.f32057c.d(bArr, e7.f32060f + i13, (byte) (i5 | 128));
            i5 >>>= 7;
        }
        int i14 = this.f32202g;
        this.f32202g = i14 + 1;
        e7.f32057c.d(bArr, e7.f32060f + i14, (byte) i5);
    }

    public final void d0(long j11) {
        boolean z11 = f32198j;
        byte[] bArr = this.f32200e;
        if (z11) {
            while (true) {
                int i5 = (int) j11;
                if ((j11 & (-128)) == 0) {
                    int i11 = this.f32202g;
                    this.f32202g = i11 + 1;
                    e7.f32057c.d(bArr, e7.f32060f + i11, (byte) i5);
                    return;
                }
                int i12 = this.f32202g;
                this.f32202g = i12 + 1;
                e7.f32057c.d(bArr, e7.f32060f + i12, (byte) (i5 | 128));
                j11 >>>= 7;
            }
        } else {
            while (true) {
                int i13 = (int) j11;
                if ((j11 & (-128)) == 0) {
                    int i14 = this.f32202g;
                    this.f32202g = i14 + 1;
                    bArr[i14] = (byte) i13;
                    return;
                } else {
                    int i15 = this.f32202g;
                    this.f32202g = i15 + 1;
                    bArr[i15] = (byte) (i13 | 128);
                    j11 >>>= 7;
                }
            }
        }
    }

    public final void e0(int i5, n5 n5Var) throws IOException {
        p0((i5 << 3) | 2);
        f0(n5Var);
    }

    public final void f0(n5 n5Var) throws IOException {
        p0(n5Var.e());
        s0(n5Var.e(), n5Var.f32155b);
    }

    public final void g0(int i5, int i11) throws IOException {
        Z(14);
        c0((i5 << 3) | 5);
        a0(i11);
    }

    public final void h0(int i5) throws IOException {
        Z(4);
        a0(i5);
    }

    public final void i0(int i5, long j11) throws IOException {
        Z(18);
        c0((i5 << 3) | 1);
        b0(j11);
    }

    public final void j0(long j11) throws IOException {
        Z(8);
        b0(j11);
    }

    public final void k0(int i5, int i11) throws IOException {
        Z(20);
        c0(i5 << 3);
        if (i11 >= 0) {
            c0(i11);
        } else {
            d0(i11);
        }
    }

    public final void l0(int i5) throws IOException {
        if (i5 >= 0) {
            p0(i5);
        } else {
            r0(i5);
        }
    }

    public final void m0(String str) throws IOException {
        try {
            int length = str.length() * 3;
            int iW = W(length);
            int i5 = iW + length;
            int i11 = this.f32201f;
            if (i5 > i11) {
                byte[] bArr = new byte[length];
                int iA = g7.a(str, bArr, 0, length);
                p0(iA);
                s0(iA, bArr);
                return;
            }
            if (i5 > i11 - this.f32202g) {
                Y();
            }
            int iW2 = W(str.length());
            int i12 = this.f32202g;
            byte[] bArr2 = this.f32200e;
            try {
                if (iW2 == iW) {
                    int i13 = i12 + iW2;
                    this.f32202g = i13;
                    int iA2 = g7.a(str, bArr2, i13, i11 - i13);
                    this.f32202g = i12;
                    c0((iA2 - i12) - iW2);
                    this.f32202g = iA2;
                } else {
                    int iB = g7.b(str);
                    c0(iB);
                    this.f32202g = g7.a(str, bArr2, this.f32202g, iB);
                }
            } catch (f7 e3) {
                this.f32202g = i12;
                throw e3;
            } catch (ArrayIndexOutOfBoundsException e11) {
                throw new zzps(e11);
            }
        } catch (f7 e12) {
            f32197i.logp(Level.WARNING, "com.google.protobuf.CodedOutputStream", "inefficientWriteStringNoTag", "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!", (Throwable) e12);
            byte[] bytes = str.getBytes(b6.f31997a);
            try {
                int length2 = bytes.length;
                p0(length2);
                s0(length2, bytes);
            } catch (IndexOutOfBoundsException e13) {
                throw new zzps(e13);
            }
        }
    }

    public final void n0(int i5, int i11) {
        p0((i5 << 3) | i11);
    }

    public final void o0(int i5, int i11) throws IOException {
        Z(20);
        c0(i5 << 3);
        c0(i11);
    }

    public final void p0(int i5) {
        Z(5);
        c0(i5);
    }

    public final void q0(int i5, long j11) throws IOException {
        Z(20);
        c0(i5 << 3);
        d0(j11);
    }

    public final void r0(long j11) throws IOException {
        Z(10);
        d0(j11);
    }

    public final void s0(int i5, byte[] bArr) throws IOException {
        int i11 = this.f32202g;
        int i12 = this.f32201f;
        int i13 = i12 - i11;
        byte[] bArr2 = this.f32200e;
        if (i13 >= i5) {
            System.arraycopy(bArr, 0, bArr2, i11, i5);
            this.f32202g += i5;
            return;
        }
        System.arraycopy(bArr, 0, bArr2, i11, i13);
        this.f32202g = i12;
        Y();
        int i14 = i5 - i13;
        if (i14 > i12) {
            this.f32203h.write(bArr, i13, i14);
        } else {
            System.arraycopy(bArr, i13, bArr2, 0, i14);
            this.f32202g = i14;
        }
    }
}
