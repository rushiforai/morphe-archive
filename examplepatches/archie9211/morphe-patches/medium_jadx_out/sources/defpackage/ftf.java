package defpackage;

import com.google.android.gms.internal.p000firebaseauthapi.zzakd;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ftf extends htf {
    public final byte[] c;
    public final int d;
    public int e;

    public ftf(byte[] bArr, int i) {
        if (((bArr.length - i) | i) < 0) {
            Locale locale = Locale.US;
            ay0.e(ev6.v("Array range is invalid. Buffer.length=", bArr.length, i, ", offset=0, length="));
            throw null;
        }
        this.c = bArr;
        this.e = 0;
        this.d = i;
    }

    @Override // defpackage.htf
    public final int a() {
        return this.d - this.e;
    }

    @Override // defpackage.htf
    public final void b(byte b) throws zzakd {
        int i = this.e;
        try {
            int i2 = i + 1;
            try {
                this.c[i] = b;
                this.e = i2;
            } catch (IndexOutOfBoundsException e) {
                e = e;
                i = i2;
                throw new zzakd(i, this.d, 1, e);
            }
        } catch (IndexOutOfBoundsException e2) {
            e = e2;
        }
    }

    @Override // defpackage.htf
    public final void c(int i) throws zzakd {
        int i2 = this.e;
        try {
            byte[] bArr = this.c;
            bArr[i2] = (byte) i;
            bArr[i2 + 1] = (byte) (i >> 8);
            bArr[i2 + 2] = (byte) (i >> 16);
            bArr[i2 + 3] = i >> 24;
            this.e = i2 + 4;
        } catch (IndexOutOfBoundsException e) {
            throw new zzakd(i2, this.d, 4, e);
        }
    }

    @Override // defpackage.htf
    public final void d(int i, int i2) throws zzakd {
        r(i, 5);
        c(i2);
    }

    @Override // defpackage.htf
    public final void e(int i, long j) throws zzakd {
        r(i, 1);
        i(j);
    }

    @Override // defpackage.htf
    public final void f(int i, String str) throws zzakd {
        r(i, 2);
        int i2 = this.e;
        try {
            int iV = htf.v(str.length() * 3);
            int iV2 = htf.v(str.length());
            byte[] bArr = this.c;
            if (iV2 != iV) {
                q(fp7.q(str));
                int i3 = this.e;
                this.e = fp7.r(str, bArr, i3, bArr.length - i3);
            } else {
                int i4 = i2 + iV2;
                this.e = i4;
                int iR = fp7.r(str, bArr, i4, bArr.length - i4);
                this.e = i2;
                q((iR - i2) - iV2);
                this.e = iR;
            }
        } catch (IndexOutOfBoundsException e) {
            throw new zzakd(e);
        }
    }

    @Override // defpackage.htf
    public final void g(int i, hsf hsfVar) throws zzakd {
        r(i, 2);
        q(hsfVar.e());
        hsfVar.u(this);
    }

    @Override // defpackage.htf
    public final void h(int i, boolean z) throws zzakd {
        r(i, 0);
        b(z ? (byte) 1 : (byte) 0);
    }

    @Override // defpackage.htf
    public final void i(long j) throws zzakd {
        int i = this.e;
        try {
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
        } catch (IndexOutOfBoundsException e) {
            throw new zzakd(i, this.d, 8, e);
        }
    }

    @Override // defpackage.htf
    public final void j(byte[] bArr, int i, int i2) throws zzakd {
        try {
            System.arraycopy(bArr, i, this.c, this.e, i2);
            this.e += i2;
        } catch (IndexOutOfBoundsException e) {
            throw new zzakd(this.e, this.d, i2, e);
        }
    }

    @Override // defpackage.htf
    public final void k(int i) throws zzakd {
        if (i >= 0) {
            q(i);
        } else {
            n(i);
        }
    }

    @Override // defpackage.htf
    public final void l(int i, int i2) throws zzakd {
        r(i, 0);
        k(i2);
    }

    @Override // defpackage.htf
    public final void m(int i, long j) throws zzakd {
        r(i, 0);
        n(j);
    }

    @Override // defpackage.htf
    public final void n(long j) throws zzakd {
        int i;
        int i2 = this.e;
        boolean z = htf.b;
        byte[] bArr = this.c;
        if (!z || a() < 10) {
            while ((j & (-128)) != 0) {
                i = i2 + 1;
                try {
                    bArr[i2] = (byte) (((int) j) | 128);
                    j >>>= 7;
                    i2 = i;
                } catch (IndexOutOfBoundsException e) {
                    throw new zzakd(i, this.d, 1, e);
                }
            }
            i = i2 + 1;
            bArr[i2] = (byte) j;
        } else {
            while ((j & (-128)) != 0) {
                avf.d(bArr, i2, (byte) (((int) j) | 128));
                j >>>= 7;
                i2++;
            }
            i = i2 + 1;
            avf.d(bArr, i2, (byte) j);
        }
        this.e = i;
    }

    @Override // defpackage.htf
    public final void q(int i) throws zzakd {
        int i2;
        int i3 = this.e;
        while (true) {
            int i4 = i & (-128);
            byte[] bArr = this.c;
            if (i4 == 0) {
                i2 = i3 + 1;
                bArr[i3] = (byte) i;
                this.e = i2;
                return;
            } else {
                i2 = i3 + 1;
                try {
                    bArr[i3] = (byte) (i | 128);
                    i >>>= 7;
                    i3 = i2;
                } catch (IndexOutOfBoundsException e) {
                    throw new zzakd(i2, this.d, 1, e);
                }
            }
            throw new zzakd(i2, this.d, 1, e);
        }
    }

    @Override // defpackage.htf
    public final void r(int i, int i2) throws zzakd {
        q((i << 3) | i2);
    }

    @Override // defpackage.htf
    public final void s(int i, int i2) throws zzakd {
        r(i, 0);
        q(i2);
    }
}
