package ads_mobile_sdk;

import b.c0;
import b.x8;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

/* loaded from: classes.dex */
public final class vu extends yu {

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f10893b;

    /* renamed from: c, reason: collision with root package name */
    public final int f10894c;

    /* renamed from: d, reason: collision with root package name */
    public int f10895d;

    public vu(byte[] bArr, int i5) {
        if (((bArr.length - i5) | i5) < 0) {
            Locale locale = Locale.US;
            throw new IllegalArgumentException(c0.g(bArr.length, i5, "Array range is invalid. Buffer.length=", ", offset=0, length="));
        }
        this.f10893b = bArr;
        this.f10895d = 0;
        this.f10894c = i5;
    }

    @Override // ads_mobile_sdk.yu
    public final void a(byte b11) throws wu {
        int i5 = this.f10895d;
        try {
            int i11 = i5 + 1;
            try {
                this.f10893b[i5] = b11;
                this.f10895d = i11;
            } catch (IndexOutOfBoundsException e3) {
                e = e3;
                i5 = i11;
                throw new wu(i5, this.f10894c, 1, e);
            }
        } catch (IndexOutOfBoundsException e11) {
            e = e11;
        }
    }

    @Override // ads_mobile_sdk.yu
    public final int b() {
        return this.f10894c - this.f10895d;
    }

    @Override // ads_mobile_sdk.yu
    public final void c(long j11) throws wu {
        int i5 = this.f10895d;
        try {
            byte[] bArr = this.f10893b;
            bArr[i5] = (byte) j11;
            bArr[i5 + 1] = (byte) (j11 >> 8);
            bArr[i5 + 2] = (byte) (j11 >> 16);
            bArr[i5 + 3] = (byte) (j11 >> 24);
            bArr[i5 + 4] = (byte) (j11 >> 32);
            bArr[i5 + 5] = (byte) (j11 >> 40);
            bArr[i5 + 6] = (byte) (j11 >> 48);
            bArr[i5 + 7] = (byte) (j11 >> 56);
            this.f10895d = i5 + 8;
        } catch (IndexOutOfBoundsException e3) {
            throw new wu(i5, this.f10894c, 8, e3);
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void d(int i5, long j11) throws wu {
        g(i5, 1);
        c(j11);
    }

    @Override // ads_mobile_sdk.yu
    public final void e(int i5, int i11) throws wu {
        g(i5, 5);
        k(i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void f(int i5, int i11) throws wu {
        g(i5, 0);
        l(i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void g(int i5, int i11) throws wu {
        m((i5 << 3) | i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void h(int i5, int i11) throws wu {
        g(i5, 0);
        m(i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void k(int i5) throws wu {
        int i11 = this.f10895d;
        try {
            byte[] bArr = this.f10893b;
            bArr[i11] = (byte) i5;
            bArr[i11 + 1] = (byte) (i5 >> 8);
            bArr[i11 + 2] = (byte) (i5 >> 16);
            bArr[i11 + 3] = (byte) (i5 >> 24);
            this.f10895d = i11 + 4;
        } catch (IndexOutOfBoundsException e3) {
            throw new wu(i11, this.f10894c, 4, e3);
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void l(int i5) throws wu {
        int i11;
        IndexOutOfBoundsException indexOutOfBoundsException;
        byte[] bArr;
        int i12;
        IndexOutOfBoundsException indexOutOfBoundsException2;
        if (i5 >= 0) {
            m(i5);
            return;
        }
        long j11 = i5;
        int i13 = this.f10895d;
        try {
            bArr = this.f10893b;
            i12 = i13 + 1;
            try {
                bArr[i13] = (byte) (((int) j11) | 128);
                i11 = i13 + 2;
            } catch (IndexOutOfBoundsException e3) {
                indexOutOfBoundsException2 = e3;
            }
        } catch (IndexOutOfBoundsException e11) {
            i11 = i13;
            indexOutOfBoundsException = e11;
        }
        try {
            bArr[i12] = (byte) (((int) (j11 >>> 7)) | 128);
            int i14 = i13 + 3;
            bArr[i11] = (byte) (((int) (j11 >>> 14)) | 128);
            i11 = i13 + 4;
            bArr[i14] = (byte) (((int) (j11 >>> 21)) | 128);
            int i15 = i13 + 5;
            bArr[i11] = (byte) (((int) (j11 >>> 28)) | 128);
            int i16 = i13 + 6;
            try {
                bArr[i15] = -1;
                int i17 = i13 + 7;
                bArr[i16] = -1;
                i16 = i13 + 8;
                bArr[i17] = -1;
                i12 = i13 + 9;
                bArr[i16] = -1;
                i13 += 10;
                bArr[i12] = 1;
                this.f10895d = i13;
            } catch (IndexOutOfBoundsException e12) {
                indexOutOfBoundsException2 = e12;
                i12 = i16;
                indexOutOfBoundsException = indexOutOfBoundsException2;
                i11 = i12;
                throw new wu(i11, this.f10894c, 10, indexOutOfBoundsException);
            }
        } catch (IndexOutOfBoundsException e13) {
            indexOutOfBoundsException = e13;
            throw new wu(i11, this.f10894c, 10, indexOutOfBoundsException);
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void m(int i5) throws wu {
        IndexOutOfBoundsException indexOutOfBoundsException;
        IndexOutOfBoundsException indexOutOfBoundsException2;
        int i11;
        int i12 = this.f10895d;
        int i13 = i5 & (-128);
        byte[] bArr = this.f10893b;
        try {
            if (i13 == 0) {
                int i14 = i12 + 1;
                bArr[i12] = (byte) i5;
                this.f10895d = i14;
                return;
            }
            i13 = i12 + 1;
            try {
                bArr[i12] = (byte) (i5 | 128);
                int i15 = i5 >>> 7;
                try {
                    if ((i15 & (-128)) == 0) {
                        int i16 = i12 + 2;
                        bArr[i13] = (byte) i15;
                        this.f10895d = i16;
                        return;
                    }
                    int i17 = i12 + 2;
                    try {
                        bArr[i13] = (byte) (i15 | 128);
                        int i18 = i5 >>> 14;
                        if ((i18 & (-128)) == 0) {
                            int i19 = i12 + 3;
                            bArr[i17] = (byte) i18;
                            this.f10895d = i19;
                            return;
                        }
                        int i21 = i12 + 3;
                        try {
                            bArr[i17] = (byte) (i18 | 128);
                            int i22 = i5 >>> 21;
                            if ((i22 & (-128)) == 0) {
                                int i23 = i12 + 4;
                                bArr[i21] = (byte) i22;
                                this.f10895d = i23;
                                return;
                            }
                            i11 = i12 + 4;
                            try {
                                bArr[i21] = (byte) (i22 | 128);
                                int i24 = i12 + 5;
                                bArr[i11] = (byte) (i5 >>> 28);
                                this.f10895d = i24;
                            } catch (IndexOutOfBoundsException e3) {
                                indexOutOfBoundsException2 = e3;
                                throw new wu(i11, this.f10894c, 1, indexOutOfBoundsException2);
                            }
                        } catch (IndexOutOfBoundsException e11) {
                            indexOutOfBoundsException = e11;
                            i13 = i21;
                            indexOutOfBoundsException2 = indexOutOfBoundsException;
                            i11 = i13;
                            throw new wu(i11, this.f10894c, 1, indexOutOfBoundsException2);
                        }
                    } catch (IndexOutOfBoundsException e12) {
                        indexOutOfBoundsException = e12;
                        i13 = i17;
                    }
                } catch (IndexOutOfBoundsException e13) {
                    e = e13;
                    i13 = i5;
                    indexOutOfBoundsException = e;
                    indexOutOfBoundsException2 = indexOutOfBoundsException;
                    i11 = i13;
                    throw new wu(i11, this.f10894c, 1, indexOutOfBoundsException2);
                }
            } catch (IndexOutOfBoundsException e14) {
                e = e14;
            }
        } catch (IndexOutOfBoundsException e15) {
            e = e15;
        }
    }

    public final void b(byte[] bArr, int i5, int i11) throws wu {
        try {
            System.arraycopy(bArr, i5, this.f10893b, this.f10895d, i11);
            this.f10895d += i11;
        } catch (IndexOutOfBoundsException e3) {
            throw new wu(this.f10895d, this.f10894c, i11, e3);
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void d(long j11) throws wu {
        int i5 = this.f10895d;
        long j12 = j11 & (-128);
        byte[] bArr = this.f10893b;
        try {
            if (j12 == 0) {
                bArr[i5] = (byte) j11;
                this.f10895d = i5 + 1;
                return;
            }
            bArr[i5] = (byte) (((int) j11) | 128);
            long j13 = j11 >>> 7;
            if ((j13 & (-128)) == 0) {
                bArr[i5 + 1] = (byte) j13;
                this.f10895d = i5 + 2;
                return;
            }
            bArr[i5 + 1] = (byte) (((int) j13) | 128);
            long j14 = j11 >>> 14;
            if ((j14 & (-128)) == 0) {
                bArr[i5 + 2] = (byte) j14;
                this.f10895d = i5 + 3;
                return;
            }
            bArr[i5 + 2] = (byte) (((int) j14) | 128);
            long j15 = j11 >>> 21;
            if ((j15 & (-128)) == 0) {
                bArr[i5 + 3] = (byte) j15;
                this.f10895d = i5 + 4;
                return;
            }
            bArr[i5 + 3] = (byte) (((int) j15) | 128);
            long j16 = j11 >>> 28;
            if ((j16 & (-128)) == 0) {
                bArr[i5 + 4] = (byte) j16;
                this.f10895d = i5 + 5;
                return;
            }
            bArr[i5 + 4] = (byte) (((int) j16) | 128);
            long j17 = j11 >>> 35;
            if ((j17 & (-128)) == 0) {
                bArr[i5 + 5] = (byte) j17;
                this.f10895d = i5 + 6;
                return;
            }
            bArr[i5 + 5] = (byte) (((int) j17) | 128);
            long j18 = j11 >>> 42;
            if ((j18 & (-128)) == 0) {
                bArr[i5 + 6] = (byte) j18;
                this.f10895d = i5 + 7;
                return;
            }
            bArr[i5 + 6] = (byte) (((int) j18) | 128);
            long j19 = j11 >>> 49;
            if ((j19 & (-128)) == 0) {
                bArr[i5 + 7] = (byte) j19;
                this.f10895d = i5 + 8;
                return;
            }
            bArr[i5 + 7] = (byte) (((int) j19) | 128);
            long j21 = j11 >>> 56;
            if (((-128) & j21) == 0) {
                bArr[i5 + 8] = (byte) j21;
                this.f10895d = i5 + 9;
            } else {
                bArr[i5 + 8] = (byte) (((int) j21) | 128);
                bArr[i5 + 9] = (byte) (j11 >>> 63);
                this.f10895d = i5 + 10;
            }
        } catch (IndexOutOfBoundsException e3) {
            throw new wu(i5, this.f10894c, 1, e3);
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void e(int i5, long j11) throws wu {
        g(i5, 0);
        d(j11);
    }

    @Override // ads_mobile_sdk.yu
    public final void a(int i5, boolean z11) throws wu {
        g(i5, 0);
        a(z11 ? (byte) 1 : (byte) 0);
    }

    @Override // ads_mobile_sdk.yu
    public final void b(int i5, sq sqVar) throws wu {
        g(i5, 2);
        m(sqVar.size());
        sqVar.a(this);
    }

    @Override // ads_mobile_sdk.yu
    public final void a(int i5, byte[] bArr) throws wu {
        m(i5);
        b(bArr, 0, i5);
    }

    @Override // ads_mobile_sdk.yu
    public final void b(sq sqVar) throws wu {
        m(sqVar.size());
        sqVar.a(this);
    }

    @Override // b.t2
    public final void a(byte[] bArr, int i5, int i11) throws wu {
        b(bArr, i5, i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void a(String str) throws wu {
        byte[] bArr = this.f10893b;
        if (vn3.f10833b) {
            byte[] bytes = str.getBytes(StandardCharsets.UTF_8);
            m(bytes.length);
            b(bytes, 0, bytes.length);
            return;
        }
        int i5 = this.f10895d;
        try {
            int i11 = yu.i(str.length());
            int i12 = i5 + i11;
            this.f10895d = i12;
            int iA = (vn3.f10832a.a(str, bArr, i12, bArr.length - i12) - i5) - i11;
            int i13 = yu.i(iA);
            if (i13 != i11) {
                System.arraycopy(bArr, i12, bArr, i5 + i13, iA);
            }
            this.f10895d = i5;
            m(iA);
            this.f10895d = i5 + i13 + iA;
        } catch (IndexOutOfBoundsException e3) {
            throw new wu(e3);
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void b(g gVar) throws wu {
        cu0 cu0Var = (cu0) gVar;
        m(cu0Var.a((x8) null));
        cu0Var.a(this);
    }

    @Override // ads_mobile_sdk.yu
    public final void b(String str, int i5) throws wu {
        g(i5, 2);
        a(str);
    }
}
