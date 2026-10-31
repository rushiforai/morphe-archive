package m90;

import b.u4;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g0 extends j {

    /* renamed from: e, reason: collision with root package name */
    public final transient byte[][] f76127e;

    /* renamed from: f, reason: collision with root package name */
    public final transient int[] f76128f;

    public g0(byte[][] bArr, int[] iArr) {
        super(j.f76130d.f76131a);
        this.f76127e = bArr;
        this.f76128f = iArr;
    }

    @Override // m90.j
    public final j b(String str) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance(str);
        byte[][] bArr = this.f76127e;
        int length = bArr.length;
        int i5 = 0;
        int i11 = 0;
        while (i5 < length) {
            int[] iArr = this.f76128f;
            int i12 = iArr[length + i5];
            int i13 = iArr[i5];
            messageDigest.update(bArr[i5], i12, i13 - i11);
            i5++;
            i11 = i13;
        }
        byte[] bArrDigest = messageDigest.digest();
        Intrinsics.d(bArrDigest);
        return new j(bArrDigest);
    }

    @Override // m90.j
    public final int c() {
        return this.f76128f[this.f76127e.length - 1];
    }

    @Override // m90.j
    public final String d() {
        return v().d();
    }

    @Override // m90.j
    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof j) {
            j jVar = (j) obj;
            if (jVar.c() == c() && n(0, jVar, c())) {
                return true;
            }
        }
        return false;
    }

    @Override // m90.j
    public final int g(int i5, byte[] other) {
        Intrinsics.g(other, "other");
        return v().g(i5, other);
    }

    @Override // m90.j
    public final int hashCode() {
        int i5 = this.f76132b;
        if (i5 != 0) {
            return i5;
        }
        byte[][] bArr = this.f76127e;
        int length = bArr.length;
        int i11 = 0;
        int i12 = 1;
        int i13 = 0;
        while (i11 < length) {
            int[] iArr = this.f76128f;
            int i14 = iArr[length + i11];
            int i15 = iArr[i11];
            byte[] bArr2 = bArr[i11];
            int i16 = (i15 - i13) + i14;
            while (i14 < i16) {
                i12 = (i12 * 31) + bArr2[i14];
                i14++;
            }
            i11++;
            i13 = i15;
        }
        this.f76132b = i12;
        return i12;
    }

    @Override // m90.j
    public final byte[] i() {
        return u();
    }

    @Override // m90.j
    public final byte j(int i5) {
        byte[][] bArr = this.f76127e;
        int length = bArr.length - 1;
        int[] iArr = this.f76128f;
        com.google.android.gms.internal.consent_sdk.e0.v(iArr[length], i5, 1L);
        int iA = n90.d.a(this, i5);
        return bArr[iA][(i5 - (iA == 0 ? 0 : iArr[iA - 1])) + iArr[bArr.length + iA]];
    }

    @Override // m90.j
    public final int k(byte[] other) {
        Intrinsics.g(other, "other");
        return v().k(other);
    }

    @Override // m90.j
    public final boolean m(int i5, int i11, int i12, byte[] other) {
        Intrinsics.g(other, "other");
        if (i5 < 0 || i5 > c() - i12 || i11 < 0 || i11 > other.length - i12) {
            return false;
        }
        int i13 = i12 + i5;
        int iA = n90.d.a(this, i5);
        while (i5 < i13) {
            int[] iArr = this.f76128f;
            int i14 = iA == 0 ? 0 : iArr[iA - 1];
            int i15 = iArr[iA] - i14;
            byte[][] bArr = this.f76127e;
            int i16 = iArr[bArr.length + iA];
            int iMin = Math.min(i13, i15 + i14) - i5;
            if (!com.google.android.gms.internal.consent_sdk.e0.p(bArr[iA], (i5 - i14) + i16, other, i11, iMin)) {
                return false;
            }
            i11 += iMin;
            i5 += iMin;
            iA++;
        }
        return true;
    }

    @Override // m90.j
    public final boolean n(int i5, j other, int i11) {
        Intrinsics.g(other, "other");
        if (i5 >= 0 && i5 <= c() - i11) {
            int i12 = i11 + i5;
            int iA = n90.d.a(this, i5);
            int i13 = 0;
            while (i5 < i12) {
                int[] iArr = this.f76128f;
                int i14 = iA == 0 ? 0 : iArr[iA - 1];
                int i15 = iArr[iA] - i14;
                byte[][] bArr = this.f76127e;
                int i16 = iArr[bArr.length + iA];
                int iMin = Math.min(i12, i15 + i14) - i5;
                if (other.m(i13, (i5 - i14) + i16, iMin, bArr[iA])) {
                    i13 += iMin;
                    i5 += iMin;
                    iA++;
                }
            }
            return true;
        }
        return false;
    }

    @Override // m90.j
    public final j o(int i5, int i11) {
        int iY = com.google.android.gms.internal.consent_sdk.e0.Y(this, i11);
        if (i5 < 0) {
            throw new IllegalArgumentException(b.c0.i(i5, "beginIndex=", " < 0").toString());
        }
        if (iY > c()) {
            StringBuilder sbJ = u4.j(iY, "endIndex=", " > length(");
            sbJ.append(c());
            sbJ.append(')');
            throw new IllegalArgumentException(sbJ.toString().toString());
        }
        int i12 = iY - i5;
        if (i12 < 0) {
            throw new IllegalArgumentException(b.c0.g(iY, i5, "endIndex=", " < beginIndex=").toString());
        }
        if (i5 == 0 && iY == c()) {
            return this;
        }
        if (i5 == iY) {
            return j.f76130d;
        }
        int iA = n90.d.a(this, i5);
        int iA2 = n90.d.a(this, iY - 1);
        byte[][] bArr = this.f76127e;
        byte[][] bArr2 = (byte[][]) u90.b.y(bArr, iA, iA2 + 1);
        int[] iArr = new int[bArr2.length * 2];
        int[] iArr2 = this.f76128f;
        if (iA <= iA2) {
            int i13 = iA;
            int i14 = 0;
            while (true) {
                iArr[i14] = Math.min(iArr2[i13] - i5, i12);
                int i15 = i14 + 1;
                iArr[i14 + bArr2.length] = iArr2[bArr.length + i13];
                if (i13 == iA2) {
                    break;
                }
                i13++;
                i14 = i15;
            }
        }
        int i16 = iA != 0 ? iArr2[iA - 1] : 0;
        int length = bArr2.length;
        iArr[length] = (i5 - i16) + iArr[length];
        return new g0(bArr2, iArr);
    }

    @Override // m90.j
    public final j q() {
        return v().q();
    }

    @Override // m90.j
    public final void t(g gVar, int i5) {
        int iA = n90.d.a(this, 0);
        int i11 = 0;
        while (i11 < i5) {
            int[] iArr = this.f76128f;
            int i12 = iA == 0 ? 0 : iArr[iA - 1];
            int i13 = iArr[iA] - i12;
            byte[][] bArr = this.f76127e;
            int i14 = iArr[bArr.length + iA];
            int iMin = Math.min(i5, i13 + i12) - i11;
            int i15 = (i11 - i12) + i14;
            e0 e0Var = new e0(bArr[iA], i15, i15 + iMin, true);
            e0 e0Var2 = gVar.f76125a;
            if (e0Var2 == null) {
                e0Var.f76121g = e0Var;
                e0Var.f76120f = e0Var;
                gVar.f76125a = e0Var;
            } else {
                e0 e0Var3 = e0Var2.f76121g;
                Intrinsics.d(e0Var3);
                e0Var3.b(e0Var);
            }
            i11 += iMin;
            iA++;
        }
        gVar.f76126b += i5;
    }

    @Override // m90.j
    public final String toString() {
        return v().toString();
    }

    public final byte[] u() {
        byte[] bArr = new byte[c()];
        byte[][] bArr2 = this.f76127e;
        int length = bArr2.length;
        int i5 = 0;
        int i11 = 0;
        int i12 = 0;
        while (i5 < length) {
            int[] iArr = this.f76128f;
            int i13 = iArr[length + i5];
            int i14 = iArr[i5];
            int i15 = i14 - i11;
            u90.b.q(bArr2[i5], i12, bArr, i13, i13 + i15);
            i12 += i15;
            i5++;
            i11 = i14;
        }
        return bArr;
    }

    public final j v() {
        return new j(u());
    }
}
