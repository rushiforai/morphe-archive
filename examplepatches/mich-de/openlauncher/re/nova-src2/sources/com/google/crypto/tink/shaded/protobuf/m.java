package com.google.crypto.tink.shaded.protobuf;

import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes3.dex */
public final class m extends ic.b {

    /* renamed from: k, reason: collision with root package name */
    public static final Logger f34630k = Logger.getLogger(m.class.getName());

    /* renamed from: l, reason: collision with root package name */
    public static final boolean f34631l = g1.f34603e;

    /* renamed from: g, reason: collision with root package name */
    public cm.f f34632g;

    /* renamed from: h, reason: collision with root package name */
    public final byte[] f34633h;

    /* renamed from: i, reason: collision with root package name */
    public final int f34634i;

    /* renamed from: j, reason: collision with root package name */
    public int f34635j;

    public m(byte[] bArr, int i5) {
        if (((bArr.length - i5) | i5) < 0) {
            Locale locale = Locale.US;
            throw new IllegalArgumentException(b.c0.g(bArr.length, i5, "Array range is invalid. Buffer.length=", ", offset=0, length="));
        }
        this.f34633h = bArr;
        this.f34635j = 0;
        this.f34634i = i5;
    }

    public static int d0(int i5, i iVar) {
        int iJ0 = j0(i5);
        int size = iVar.size();
        return k0(size) + size + iJ0;
    }

    public static int e0(int i5) {
        return j0(i5) + 4;
    }

    public static int f0(int i5) {
        return j0(i5) + 8;
    }

    public static int g0(int i5) {
        return k0((i5 >> 31) ^ (i5 << 1));
    }

    public static int h0(long j11) {
        return m0((j11 >> 63) ^ (j11 << 1));
    }

    public static int i0(String str) {
        int length;
        try {
            length = j1.b(str);
        } catch (i1 unused) {
            length = str.getBytes(b0.f34575a).length;
        }
        return k0(length) + length;
    }

    public static int j0(int i5) {
        return k0(i5 << 3);
    }

    public static int k0(int i5) {
        return (352 - (Integer.numberOfLeadingZeros(i5) * 9)) >>> 6;
    }

    public static int l0(int i5, long j11) {
        return m0(j11) + j0(i5);
    }

    public static int m0(long j11) {
        return (640 - (Long.numberOfLeadingZeros(j11) * 9)) >>> 6;
    }

    public static m n0(byte[] bArr) {
        return new m(bArr, bArr.length);
    }

    public final void A0(int i5, int i11) {
        z0(i5, 0);
        B0(i11);
    }

    public final void B0(int i5) {
        int i11;
        int i12 = this.f34635j;
        while (true) {
            int i13 = i5 & (-128);
            byte[] bArr = this.f34633h;
            if (i13 == 0) {
                i11 = i12 + 1;
                bArr[i12] = (byte) i5;
                this.f34635j = i11;
                return;
            } else {
                i11 = i12 + 1;
                try {
                    bArr[i12] = (byte) (i5 | 128);
                    i5 >>>= 7;
                    i12 = i11;
                } catch (IndexOutOfBoundsException e3) {
                    throw new CodedOutputStream$OutOfSpaceException(i11, this.f34634i, 1, e3);
                }
            }
            throw new CodedOutputStream$OutOfSpaceException(i11, this.f34634i, 1, e3);
        }
    }

    public final void C0(int i5, long j11) {
        z0(i5, 0);
        D0(j11);
    }

    public final void D0(long j11) throws CodedOutputStream$OutOfSpaceException {
        int i5;
        int i11 = this.f34635j;
        boolean z11 = f34631l;
        byte[] bArr = this.f34633h;
        if (!z11 || o0() < 10) {
            while ((j11 & (-128)) != 0) {
                i5 = i11 + 1;
                try {
                    bArr[i11] = (byte) (((int) j11) | 128);
                    j11 >>>= 7;
                    i11 = i5;
                } catch (IndexOutOfBoundsException e3) {
                    throw new CodedOutputStream$OutOfSpaceException(i5, this.f34634i, 1, e3);
                }
            }
            i5 = i11 + 1;
            bArr[i11] = (byte) j11;
        } else {
            while ((j11 & (-128)) != 0) {
                g1.k(bArr, i11, (byte) (((int) j11) | 128));
                j11 >>>= 7;
                i11++;
            }
            i5 = i11 + 1;
            g1.k(bArr, i11, (byte) j11);
        }
        this.f34635j = i5;
    }

    @Override // ic.b
    public final void Y(int i5, int i11, byte[] bArr) throws CodedOutputStream$OutOfSpaceException {
        try {
            System.arraycopy(bArr, i5, this.f34633h, this.f34635j, i11);
            this.f34635j += i11;
        } catch (IndexOutOfBoundsException e3) {
            throw new CodedOutputStream$OutOfSpaceException(this.f34635j, this.f34634i, i11, e3);
        }
    }

    public final void c0() {
        if (o0() != 0) {
            throw new IllegalStateException("Did not write as much data as expected.");
        }
    }

    public final int o0() {
        return this.f34634i - this.f34635j;
    }

    public final void p0(byte b11) throws CodedOutputStream$OutOfSpaceException {
        int i5 = this.f34635j;
        try {
            int i11 = i5 + 1;
            try {
                this.f34633h[i5] = b11;
                this.f34635j = i11;
            } catch (IndexOutOfBoundsException e3) {
                e = e3;
                i5 = i11;
                throw new CodedOutputStream$OutOfSpaceException(i5, this.f34634i, 1, e);
            }
        } catch (IndexOutOfBoundsException e11) {
            e = e11;
        }
    }

    public final void q0(int i5, boolean z11) throws CodedOutputStream$OutOfSpaceException {
        z0(i5, 0);
        p0(z11 ? (byte) 1 : (byte) 0);
    }

    public final void r0(int i5, i iVar) {
        z0(i5, 2);
        B0(iVar.size());
        g gVar = (g) iVar;
        Y(gVar.j(), gVar.size(), gVar.f34597d);
    }

    public final void s0(int i5, int i11) {
        z0(i5, 5);
        t0(i11);
    }

    public final void t0(int i5) throws CodedOutputStream$OutOfSpaceException {
        int i11 = this.f34635j;
        try {
            byte[] bArr = this.f34633h;
            bArr[i11] = (byte) i5;
            bArr[i11 + 1] = (byte) (i5 >> 8);
            bArr[i11 + 2] = (byte) (i5 >> 16);
            bArr[i11 + 3] = (byte) (i5 >> 24);
            this.f34635j = i11 + 4;
        } catch (IndexOutOfBoundsException e3) {
            throw new CodedOutputStream$OutOfSpaceException(i11, this.f34634i, 4, e3);
        }
    }

    public final void u0(int i5, long j11) {
        z0(i5, 1);
        v0(j11);
    }

    public final void v0(long j11) throws CodedOutputStream$OutOfSpaceException {
        int i5 = this.f34635j;
        try {
            byte[] bArr = this.f34633h;
            bArr[i5] = (byte) j11;
            bArr[i5 + 1] = (byte) (j11 >> 8);
            bArr[i5 + 2] = (byte) (j11 >> 16);
            bArr[i5 + 3] = (byte) (j11 >> 24);
            bArr[i5 + 4] = (byte) (j11 >> 32);
            bArr[i5 + 5] = (byte) (j11 >> 40);
            bArr[i5 + 6] = (byte) (j11 >> 48);
            bArr[i5 + 7] = (byte) (j11 >> 56);
            this.f34635j = i5 + 8;
        } catch (IndexOutOfBoundsException e3) {
            throw new CodedOutputStream$OutOfSpaceException(i5, this.f34634i, 8, e3);
        }
    }

    public final void w0(int i5, int i11) throws CodedOutputStream$OutOfSpaceException {
        z0(i5, 0);
        x0(i11);
    }

    public final void x0(int i5) throws CodedOutputStream$OutOfSpaceException {
        if (i5 >= 0) {
            B0(i5);
        } else {
            D0(i5);
        }
    }

    public final void y0(int i5, String str) throws CodedOutputStream$OutOfSpaceException {
        z0(i5, 2);
        int i11 = this.f34635j;
        try {
            int iK0 = k0(str.length() * 3);
            int iK02 = k0(str.length());
            byte[] bArr = this.f34633h;
            if (iK02 != iK0) {
                B0(j1.b(str));
                this.f34635j = j1.f34620a.F(str, bArr, this.f34635j, o0());
                return;
            }
            int i12 = i11 + iK02;
            this.f34635j = i12;
            int iF = j1.f34620a.F(str, bArr, i12, o0());
            this.f34635j = i11;
            B0((iF - i11) - iK02);
            this.f34635j = iF;
        } catch (i1 e3) {
            this.f34635j = i11;
            f34630k.log(Level.WARNING, "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!", (Throwable) e3);
            byte[] bytes = str.getBytes(b0.f34575a);
            try {
                B0(bytes.length);
                Y(0, bytes.length, bytes);
            } catch (IndexOutOfBoundsException e11) {
                throw new CodedOutputStream$OutOfSpaceException(e11);
            }
        } catch (IndexOutOfBoundsException e12) {
            throw new CodedOutputStream$OutOfSpaceException(e12);
        }
    }

    public final void z0(int i5, int i11) {
        B0((i5 << 3) | i11);
    }
}
