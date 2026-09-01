package defpackage;

import com.google.android.gms.internal.play_billing.zzfm;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c4g {
    public static final boolean e = o9g.d;
    public ujf a;
    public final byte[] b;
    public final int c;
    public int d;

    public c4g(byte[] bArr, int i) {
        int length = bArr.length;
        if (((length - i) | i) < 0) {
            Locale locale = Locale.US;
            ay0.e(ev6.v("Array range is invalid. Buffer.length=", length, i, ", offset=0, length="));
            throw null;
        }
        this.b = bArr;
        this.d = 0;
        this.c = i;
    }

    public static int p(int i) {
        return (352 - (Integer.numberOfLeadingZeros(i) * 9)) >>> 6;
    }

    public static int q(long j) {
        return (640 - (Long.numberOfLeadingZeros(j) * 9)) >>> 6;
    }

    public final void a() {
        int i = this.d;
        int i2 = this.c;
        if (i2 - i > 0) {
            ygf.f("Did not write as much data as expected.");
        } else {
            if (i2 - i >= 0) {
                return;
            }
            ygf.f("Wrote more data than expected.");
        }
    }

    public final void b(byte b) throws zzfm {
        int i = this.d;
        try {
            int i2 = i + 1;
            try {
                this.b[i] = b;
                this.d = i2;
            } catch (IndexOutOfBoundsException e2) {
                e = e2;
                i = i2;
                throw new zzfm(i, this.c, 1, e);
            }
        } catch (IndexOutOfBoundsException e3) {
            e = e3;
        }
    }

    public final void c(byte[] bArr, int i, int i2) {
        try {
            System.arraycopy(bArr, i, this.b, this.d, i2);
            this.d += i2;
        } catch (IndexOutOfBoundsException e2) {
            throw new zzfm(this.d, this.c, i2, e2);
        }
    }

    public final void d(int i, int i2) throws zzfm {
        m((i << 3) | 5);
        e(i2);
    }

    public final void e(int i) throws zzfm {
        int i2 = this.d;
        try {
            byte[] bArr = this.b;
            bArr[i2] = (byte) i;
            bArr[i2 + 1] = (byte) (i >> 8);
            bArr[i2 + 2] = (byte) (i >> 16);
            bArr[i2 + 3] = (byte) (i >> 24);
            this.d = i2 + 4;
        } catch (IndexOutOfBoundsException e2) {
            throw new zzfm(i2, this.c, 4, e2);
        }
    }

    public final void f(int i, long j) throws zzfm {
        m((i << 3) | 1);
        g(j);
    }

    public final void g(long j) throws zzfm {
        int i = this.d;
        try {
            byte[] bArr = this.b;
            bArr[i] = (byte) j;
            bArr[i + 1] = (byte) (j >> 8);
            bArr[i + 2] = (byte) (j >> 16);
            bArr[i + 3] = (byte) (j >> 24);
            bArr[i + 4] = (byte) (j >> 32);
            bArr[i + 5] = (byte) (j >> 40);
            bArr[i + 6] = (byte) (j >> 48);
            bArr[i + 7] = (byte) (j >> 56);
            this.d = i + 8;
        } catch (IndexOutOfBoundsException e2) {
            throw new zzfm(i, this.c, 8, e2);
        }
    }

    public final void h(int i, int i2) throws zzfm {
        m(i << 3);
        i(i2);
    }

    public final void i(int i) throws zzfm {
        if (i >= 0) {
            m(i);
        } else {
            o(i);
        }
    }

    public final void j(String str) throws zzfm {
        int i = this.d;
        try {
            int iP = p(str.length() * 3);
            int iP2 = p(str.length());
            byte[] bArr = this.b;
            if (iP2 != iP) {
                int i2 = w9g.a;
                m(tp7.E(str));
                int i3 = this.d;
                this.d = w9g.a(str, bArr, i3, bArr.length - i3);
                return;
            }
            int i4 = i + iP2;
            this.d = i4;
            int iA = w9g.a(str, bArr, i4, bArr.length - i4);
            this.d = i;
            m((iA - i) - iP2);
            this.d = iA;
        } catch (IndexOutOfBoundsException e2) {
            throw new zzfm("CodedOutputStream was writing to a flat byte array and ran out of space.", e2);
        }
    }

    public final void k(int i, int i2) {
        m((i << 3) | i2);
    }

    public final void l(int i, int i2) {
        m(i << 3);
        m(i2);
    }

    public final void m(int i) {
        int i2;
        int i3 = this.d;
        while (true) {
            int i4 = i & (-128);
            byte[] bArr = this.b;
            if (i4 == 0) {
                i2 = i3 + 1;
                bArr[i3] = (byte) i;
                this.d = i2;
                return;
            } else {
                i2 = i3 + 1;
                try {
                    bArr[i3] = (byte) (i | 128);
                    i >>>= 7;
                    i3 = i2;
                } catch (IndexOutOfBoundsException e2) {
                    throw new zzfm(i2, this.c, 1, e2);
                }
            }
            throw new zzfm(i2, this.c, 1, e2);
        }
    }

    public final void n(int i, long j) throws zzfm {
        m(i << 3);
        o(j);
    }

    public final void o(long j) throws zzfm {
        int i;
        int i2 = this.d;
        boolean z = e;
        byte[] bArr = this.b;
        int i3 = this.c;
        if (!z || i3 - i2 < 10) {
            int i4 = i2;
            long j2 = j;
            while ((j2 & (-128)) != 0) {
                int i5 = i4 + 1;
                try {
                    bArr[i4] = (byte) (((int) j2) | 128);
                    j2 >>>= 7;
                    i4 = i5;
                } catch (IndexOutOfBoundsException e2) {
                    e = e2;
                    i = i5;
                    throw new zzfm(i, i3, 1, e);
                }
            }
            i = i4 + 1;
            try {
                bArr[i4] = (byte) j2;
            } catch (IndexOutOfBoundsException e3) {
                e = e3;
                throw new zzfm(i, i3, 1, e);
            }
        } else {
            int i6 = i2;
            long j3 = j;
            while ((j3 & (-128)) != 0) {
                o9g.c.x(bArr, o9g.e + ((long) i6), (byte) (((int) j3) | 128));
                j3 >>>= 7;
                i6++;
            }
            i = i6 + 1;
            o9g.c.x(bArr, o9g.e + ((long) i6), (byte) j3);
        }
        this.d = i;
    }
}
