package com.google.android.gms.internal.play_billing;

import java.util.Locale;

/* loaded from: classes3.dex */
public final class n2 extends com.google.android.gms.internal.consent_sdk.e0 {

    /* renamed from: g, reason: collision with root package name */
    public static final boolean f33458g = j4.f33430e;

    /* renamed from: c, reason: collision with root package name */
    public k3 f33459c;

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f33460d;

    /* renamed from: e, reason: collision with root package name */
    public final int f33461e;

    /* renamed from: f, reason: collision with root package name */
    public int f33462f;

    public n2(byte[] bArr, int i5) {
        int length = bArr.length;
        if (((length - i5) | i5) < 0) {
            Locale locale = Locale.US;
            throw new IllegalArgumentException(b.c0.g(length, i5, "Array range is invalid. Buffer.length=", ", offset=0, length="));
        }
        this.f33460d = bArr;
        this.f33462f = 0;
        this.f33461e = i5;
    }

    public static int D0(int i5) {
        return (352 - (Integer.numberOfLeadingZeros(i5) * 9)) >>> 6;
    }

    public static int E0(long j11) {
        return (640 - (Long.numberOfLeadingZeros(j11) * 9)) >>> 6;
    }

    public final void A0(int i5) {
        int i11;
        int i12 = this.f33462f;
        while (true) {
            int i13 = i5 & (-128);
            byte[] bArr = this.f33460d;
            if (i13 == 0) {
                i11 = i12 + 1;
                bArr[i12] = (byte) i5;
                this.f33462f = i11;
                return;
            } else {
                i11 = i12 + 1;
                try {
                    bArr[i12] = (byte) (i5 | 128);
                    i5 >>>= 7;
                    i12 = i11;
                } catch (IndexOutOfBoundsException e3) {
                    throw new zzfa(i11, this.f33461e, 1, e3);
                }
            }
            throw new zzfa(i11, this.f33461e, 1, e3);
        }
    }

    public final void B0(int i5, long j11) throws zzfa {
        A0(i5 << 3);
        C0(j11);
    }

    public final void C0(long j11) throws zzfa {
        int i5;
        int i11 = this.f33462f;
        boolean z11 = f33458g;
        int i12 = this.f33461e;
        byte[] bArr = this.f33460d;
        if (!z11 || i12 - i11 < 10) {
            long j12 = j11;
            while ((j12 & (-128)) != 0) {
                i5 = i11 + 1;
                try {
                    bArr[i11] = (byte) (((int) j12) | 128);
                    j12 >>>= 7;
                    i11 = i5;
                } catch (IndexOutOfBoundsException e3) {
                    throw new zzfa(i5, i12, 1, e3);
                }
            }
            i5 = i11 + 1;
            bArr[i11] = (byte) j12;
        } else {
            long j13 = j11;
            while ((j13 & (-128)) != 0) {
                j4.f33428c.d(bArr, j4.f33431f + i11, (byte) (((int) j13) | 128));
                j13 >>>= 7;
                i11++;
            }
            i5 = i11 + 1;
            j4.f33428c.d(bArr, j4.f33431f + i11, (byte) j13);
        }
        this.f33462f = i5;
    }

    public final void o0(byte b11) throws zzfa {
        int i5 = this.f33462f;
        try {
            int i11 = i5 + 1;
            try {
                this.f33460d[i5] = b11;
                this.f33462f = i11;
            } catch (IndexOutOfBoundsException e3) {
                e = e3;
                i5 = i11;
                throw new zzfa(i5, this.f33461e, 1, e);
            }
        } catch (IndexOutOfBoundsException e11) {
            e = e11;
        }
    }

    public final void p0(int i5, int i11, byte[] bArr) {
        try {
            System.arraycopy(bArr, i5, this.f33460d, this.f33462f, i11);
            this.f33462f += i11;
        } catch (IndexOutOfBoundsException e3) {
            throw new zzfa(this.f33462f, this.f33461e, i11, e3);
        }
    }

    public final void q0(int i5, l2 l2Var) {
        A0((i5 << 3) | 2);
        A0(l2Var.f());
        l2Var.h(this);
    }

    public final void r0(int i5, int i11) throws zzfa {
        A0((i5 << 3) | 5);
        s0(i11);
    }

    public final void s0(int i5) throws zzfa {
        int i11 = this.f33462f;
        try {
            byte[] bArr = this.f33460d;
            bArr[i11] = (byte) i5;
            bArr[i11 + 1] = (byte) (i5 >> 8);
            bArr[i11 + 2] = (byte) (i5 >> 16);
            bArr[i11 + 3] = (byte) (i5 >> 24);
            this.f33462f = i11 + 4;
        } catch (IndexOutOfBoundsException e3) {
            throw new zzfa(i11, this.f33461e, 4, e3);
        }
    }

    public final void t0(int i5, long j11) throws zzfa {
        A0((i5 << 3) | 1);
        u0(j11);
    }

    public final void u0(long j11) throws zzfa {
        int i5 = this.f33462f;
        try {
            byte[] bArr = this.f33460d;
            bArr[i5] = (byte) j11;
            bArr[i5 + 1] = (byte) (j11 >> 8);
            bArr[i5 + 2] = (byte) (j11 >> 16);
            bArr[i5 + 3] = (byte) (j11 >> 24);
            bArr[i5 + 4] = (byte) (j11 >> 32);
            bArr[i5 + 5] = (byte) (j11 >> 40);
            bArr[i5 + 6] = (byte) (j11 >> 48);
            bArr[i5 + 7] = (byte) (j11 >> 56);
            this.f33462f = i5 + 8;
        } catch (IndexOutOfBoundsException e3) {
            throw new zzfa(i5, this.f33461e, 8, e3);
        }
    }

    public final void v0(int i5, int i11) throws zzfa {
        A0(i5 << 3);
        w0(i11);
    }

    public final void w0(int i5) throws zzfa {
        if (i5 >= 0) {
            A0(i5);
        } else {
            C0(i5);
        }
    }

    public final void x0(String str) throws zzfa {
        int i5 = this.f33462f;
        try {
            int iD0 = D0(str.length() * 3);
            int iD02 = D0(str.length());
            int i11 = this.f33461e;
            byte[] bArr = this.f33460d;
            if (iD02 != iD0) {
                A0(l4.b(str));
                int i12 = this.f33462f;
                this.f33462f = l4.a(str, bArr, i12, i11 - i12);
            } else {
                int i13 = i5 + iD02;
                this.f33462f = i13;
                int iA = l4.a(str, bArr, i13, i11 - i13);
                this.f33462f = i5;
                A0((iA - i5) - iD02);
                this.f33462f = iA;
            }
        } catch (IndexOutOfBoundsException e3) {
            throw new zzfa("CodedOutputStream was writing to a flat byte array and ran out of space.", e3);
        }
    }

    public final void y0(int i5, int i11) {
        A0((i5 << 3) | i11);
    }

    public final void z0(int i5, int i11) {
        A0(i5 << 3);
        A0(i11);
    }
}
