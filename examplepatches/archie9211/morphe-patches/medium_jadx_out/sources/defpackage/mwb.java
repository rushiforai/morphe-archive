package defpackage;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mwb extends h21 {
    public final transient byte[][] e;
    public final transient int[] f;

    public mwb(byte[][] bArr, int[] iArr) {
        super(h21.d.a);
        this.e = bArr;
        this.f = iArr;
    }

    private final Object writeReplace() {
        return v();
    }

    @Override // defpackage.h21
    public final String a() {
        return v().a();
    }

    @Override // defpackage.h21
    public final void c(int i, int i2, int i3, byte[] bArr) {
        bArr.getClass();
        long j = i3;
        dm2.A(e(), i, j);
        dm2.A(bArr.length, i2, j);
        int i4 = i3 + i;
        int iY0 = nk7.y0(this, i);
        while (i < i4) {
            int[] iArr = this.f;
            int i5 = iY0 == 0 ? 0 : iArr[iY0 - 1];
            int i6 = iArr[iY0] - i5;
            byte[][] bArr2 = this.e;
            int i7 = iArr[bArr2.length + iY0];
            int iMin = Math.min(i4, i6 + i5) - i;
            int i8 = (i - i5) + i7;
            k80.f0(i2, i8, i8 + iMin, bArr2[iY0], bArr);
            i2 += iMin;
            i += iMin;
            iY0++;
        }
    }

    @Override // defpackage.h21
    public final h21 d(String str) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance(str);
        byte[][] bArr = this.e;
        int length = bArr.length;
        int i = 0;
        int i2 = 0;
        while (i < length) {
            int[] iArr = this.f;
            int i3 = iArr[length + i];
            int i4 = iArr[i];
            messageDigest.update(bArr[i], i3, i4 - i2);
            i++;
            i2 = i4;
        }
        byte[] bArrDigest = messageDigest.digest();
        bArrDigest.getClass();
        return new h21(bArrDigest);
    }

    @Override // defpackage.h21
    public final int e() {
        return this.f[this.e.length - 1];
    }

    @Override // defpackage.h21
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof h21) {
            h21 h21Var = (h21) obj;
            if (h21Var.e() == e() && n(h21Var, 0, e())) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.h21
    public final String f() {
        return v().f();
    }

    @Override // defpackage.h21
    public final int g(int i, byte[] bArr) {
        bArr.getClass();
        return v().g(i, bArr);
    }

    @Override // defpackage.h21
    public final int hashCode() {
        int i = this.b;
        if (i != 0) {
            return i;
        }
        byte[][] bArr = this.e;
        int length = bArr.length;
        int i2 = 0;
        int i3 = 1;
        int i4 = 0;
        while (i2 < length) {
            int[] iArr = this.f;
            int i5 = iArr[length + i2];
            int i6 = iArr[i2];
            byte[] bArr2 = bArr[i2];
            int i7 = (i6 - i4) + i5;
            while (i5 < i7) {
                i3 = (i3 * 31) + bArr2[i5];
                i5++;
            }
            i2++;
            i4 = i6;
        }
        this.b = i3;
        return i3;
    }

    @Override // defpackage.h21
    public final byte[] i() {
        return s();
    }

    @Override // defpackage.h21
    public final byte j(int i) {
        byte[][] bArr = this.e;
        int length = bArr.length - 1;
        int[] iArr = this.f;
        dm2.A(iArr[length], i, 1L);
        int iY0 = nk7.y0(this, i);
        return bArr[iY0][(i - (iY0 == 0 ? 0 : iArr[iY0 - 1])) + iArr[bArr.length + iY0]];
    }

    @Override // defpackage.h21
    public final int k(byte[] bArr) {
        bArr.getClass();
        return v().k(bArr);
    }

    @Override // defpackage.h21
    public final boolean m(int i, int i2, int i3, byte[] bArr) {
        bArr.getClass();
        if (i >= 0 && i <= e() - i3 && i2 >= 0 && i2 <= bArr.length - i3) {
            int i4 = i3 + i;
            int iY0 = nk7.y0(this, i);
            while (i < i4) {
                int[] iArr = this.f;
                int i5 = iY0 == 0 ? 0 : iArr[iY0 - 1];
                int i6 = iArr[iY0] - i5;
                byte[][] bArr2 = this.e;
                int i7 = iArr[bArr2.length + iY0];
                int iMin = Math.min(i4, i6 + i5) - i;
                if (dm2.w((i - i5) + i7, i2, iMin, bArr2[iY0], bArr)) {
                    i2 += iMin;
                    i += iMin;
                    iY0++;
                }
            }
            return true;
        }
        return false;
    }

    @Override // defpackage.h21
    public final boolean n(h21 h21Var, int i, int i2) {
        h21Var.getClass();
        if (i >= 0 && i <= e() - i2) {
            int i3 = i2 + i;
            int iY0 = nk7.y0(this, i);
            int i4 = 0;
            while (i < i3) {
                int[] iArr = this.f;
                int i5 = iY0 == 0 ? 0 : iArr[iY0 - 1];
                int i6 = iArr[iY0] - i5;
                byte[][] bArr = this.e;
                int i7 = iArr[bArr.length + iY0];
                int iMin = Math.min(i3, i6 + i5) - i;
                if (h21Var.m(i4, (i - i5) + i7, iMin, bArr[iY0])) {
                    i4 += iMin;
                    i += iMin;
                    iY0++;
                }
            }
            return true;
        }
        return false;
    }

    @Override // defpackage.h21
    public final String o(Charset charset) {
        charset.getClass();
        return v().o(charset);
    }

    @Override // defpackage.h21
    public final h21 p(int i, int i2) {
        if (i2 == -1234567890) {
            i2 = e();
        }
        if (i < 0) {
            ywb.g(ev6.w("beginIndex=", i, " < 0"));
            return null;
        }
        if (i2 > e()) {
            StringBuilder sbC = ev6.C("endIndex=", i2, " > length(");
            sbC.append(e());
            sbC.append(')');
            throw new IllegalArgumentException(sbC.toString().toString());
        }
        int i3 = i2 - i;
        if (i3 < 0) {
            ywb.g(ev6.v("endIndex=", i2, i, " < beginIndex="));
            return null;
        }
        if (i == 0 && i2 == e()) {
            return this;
        }
        if (i == i2) {
            return h21.d;
        }
        int iY0 = nk7.y0(this, i);
        int iY02 = nk7.y0(this, i2 - 1);
        byte[][] bArr = this.e;
        byte[][] bArr2 = (byte[][]) k80.m0(iY0, iY02 + 1, bArr);
        int[] iArr = new int[bArr2.length * 2];
        int[] iArr2 = this.f;
        if (iY0 <= iY02) {
            int i4 = iY0;
            int i5 = 0;
            while (true) {
                iArr[i5] = Math.min(iArr2[i4] - i, i3);
                int i6 = i5 + 1;
                iArr[i5 + bArr2.length] = iArr2[bArr.length + i4];
                if (i4 == iY02) {
                    break;
                }
                i4++;
                i5 = i6;
            }
        }
        int i7 = iY0 != 0 ? iArr2[iY0 - 1] : 0;
        int length = bArr2.length;
        iArr[length] = (i - i7) + iArr[length];
        return new mwb(bArr2, iArr);
    }

    @Override // defpackage.h21
    public final h21 r() {
        return v().r();
    }

    @Override // defpackage.h21
    public final byte[] s() {
        byte[] bArr = new byte[e()];
        byte[][] bArr2 = this.e;
        int length = bArr2.length;
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        while (i < length) {
            int[] iArr = this.f;
            int i4 = iArr[length + i];
            int i5 = iArr[i];
            int i6 = i5 - i2;
            k80.f0(i3, i4, i4 + i6, bArr2[i], bArr);
            i3 += i6;
            i++;
            i2 = i5;
        }
        return bArr;
    }

    @Override // defpackage.h21
    public final String toString() {
        return v().toString();
    }

    @Override // defpackage.h21
    public final void u(kz0 kz0Var, int i) {
        int iY0 = nk7.y0(this, 0);
        int i2 = 0;
        while (i2 < i) {
            int[] iArr = this.f;
            int i3 = iY0 == 0 ? 0 : iArr[iY0 - 1];
            int i4 = iArr[iY0] - i3;
            byte[][] bArr = this.e;
            int i5 = iArr[bArr.length + iY0];
            int iMin = Math.min(i, i4 + i3) - i2;
            int i6 = (i2 - i3) + i5;
            iwb iwbVar = new iwb(bArr[iY0], i6, i6 + iMin, true, false);
            iwb iwbVar2 = kz0Var.a;
            if (iwbVar2 == null) {
                iwbVar.g = iwbVar;
                iwbVar.f = iwbVar;
                kz0Var.a = iwbVar;
            } else {
                iwb iwbVar3 = iwbVar2.g;
                iwbVar3.getClass();
                iwbVar3.b(iwbVar);
            }
            i2 += iMin;
            iY0++;
        }
        kz0Var.b += (long) i;
    }

    public final h21 v() {
        return new h21(s());
    }
}
