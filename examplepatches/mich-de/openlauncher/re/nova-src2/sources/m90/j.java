package m90;

import h6.c1;
import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes.dex */
public class j implements Serializable, Comparable {

    /* renamed from: d, reason: collision with root package name */
    public static final j f76130d = new j(new byte[0]);

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f76131a;

    /* renamed from: b, reason: collision with root package name */
    public transient int f76132b;

    /* renamed from: c, reason: collision with root package name */
    public transient String f76133c;

    public j(byte[] data) {
        Intrinsics.g(data, "data");
        this.f76131a = data;
    }

    public static int h(j jVar, j other) {
        jVar.getClass();
        Intrinsics.g(other, "other");
        return jVar.g(0, other.i());
    }

    public static int l(j jVar, j other) {
        jVar.getClass();
        Intrinsics.g(other, "other");
        return jVar.k(other.i());
    }

    public static /* synthetic */ j p(j jVar, int i5, int i11, int i12) {
        if ((i12 & 1) != 0) {
            i5 = 0;
        }
        if ((i12 & 2) != 0) {
            i11 = -1234567890;
        }
        return jVar.o(i5, i11);
    }

    @Override // java.lang.Comparable
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final int compareTo(j other) {
        Intrinsics.g(other, "other");
        int iC = c();
        int iC2 = other.c();
        int iMin = Math.min(iC, iC2);
        for (int i5 = 0; i5 < iMin; i5++) {
            int iJ = j(i5) & 255;
            int iJ2 = other.j(i5) & 255;
            if (iJ != iJ2) {
                return iJ < iJ2 ? -1 : 1;
            }
        }
        if (iC == iC2) {
            return 0;
        }
        return iC < iC2 ? -1 : 1;
    }

    public j b(String str) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance(str);
        messageDigest.update(this.f76131a, 0, c());
        byte[] bArrDigest = messageDigest.digest();
        Intrinsics.d(bArrDigest);
        return new j(bArrDigest);
    }

    public int c() {
        return this.f76131a.length;
    }

    public String d() {
        byte[] bArr = this.f76131a;
        char[] cArr = new char[bArr.length * 2];
        int i5 = 0;
        for (byte b11 : bArr) {
            int i11 = i5 + 1;
            char[] cArr2 = n90.b.f78033a;
            cArr[i5] = cArr2[(b11 >> 4) & 15];
            i5 += 2;
            cArr[i11] = cArr2[b11 & 15];
        }
        return new String(cArr);
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof j) {
            j jVar = (j) obj;
            int iC = jVar.c();
            byte[] bArr = this.f76131a;
            if (iC == bArr.length && jVar.m(0, 0, bArr.length, bArr)) {
                return true;
            }
        }
        return false;
    }

    public int g(int i5, byte[] other) {
        Intrinsics.g(other, "other");
        byte[] bArr = this.f76131a;
        int length = bArr.length - other.length;
        int iMax = Math.max(i5, 0);
        if (iMax > length) {
            return -1;
        }
        while (!com.google.android.gms.internal.consent_sdk.e0.p(bArr, iMax, other, 0, other.length)) {
            if (iMax == length) {
                return -1;
            }
            iMax++;
        }
        return iMax;
    }

    public int hashCode() {
        int i5 = this.f76132b;
        if (i5 != 0) {
            return i5;
        }
        int iHashCode = Arrays.hashCode(this.f76131a);
        this.f76132b = iHashCode;
        return iHashCode;
    }

    public byte[] i() {
        return this.f76131a;
    }

    public byte j(int i5) {
        return this.f76131a[i5];
    }

    public int k(byte[] other) {
        Intrinsics.g(other, "other");
        int iY = com.google.android.gms.internal.consent_sdk.e0.Y(this, -1234567890);
        byte[] bArr = this.f76131a;
        for (int iMin = Math.min(iY, bArr.length - other.length); -1 < iMin; iMin--) {
            if (com.google.android.gms.internal.consent_sdk.e0.p(bArr, iMin, other, 0, other.length)) {
                return iMin;
            }
        }
        return -1;
    }

    public boolean m(int i5, int i11, int i12, byte[] other) {
        Intrinsics.g(other, "other");
        if (i5 < 0) {
            return false;
        }
        byte[] bArr = this.f76131a;
        return i5 <= bArr.length - i12 && i11 >= 0 && i11 <= other.length - i12 && com.google.android.gms.internal.consent_sdk.e0.p(bArr, i5, other, i11, i12);
    }

    public boolean n(int i5, j other, int i11) {
        Intrinsics.g(other, "other");
        return other.m(0, i5, i11, this.f76131a);
    }

    public j o(int i5, int i11) {
        int iY = com.google.android.gms.internal.consent_sdk.e0.Y(this, i11);
        if (i5 < 0) {
            throw new IllegalArgumentException("beginIndex < 0");
        }
        byte[] bArr = this.f76131a;
        if (iY > bArr.length) {
            throw new IllegalArgumentException(a2.c.m(new StringBuilder("endIndex > length("), bArr.length, ')').toString());
        }
        if (iY - i5 >= 0) {
            return (i5 == 0 && iY == bArr.length) ? this : new j(u90.b.x(i5, iY, bArr));
        }
        throw new IllegalArgumentException("endIndex < beginIndex");
    }

    public j q() {
        int i5 = 0;
        while (true) {
            byte[] bArr = this.f76131a;
            if (i5 >= bArr.length) {
                return this;
            }
            byte b11 = bArr[i5];
            if (b11 >= 65 && b11 <= 90) {
                byte[] bArrCopyOf = Arrays.copyOf(bArr, bArr.length);
                Intrinsics.f(bArrCopyOf, "copyOf(this, size)");
                bArrCopyOf[i5] = (byte) (b11 + 32);
                for (int i11 = i5 + 1; i11 < bArrCopyOf.length; i11++) {
                    byte b12 = bArrCopyOf[i11];
                    if (b12 >= 65 && b12 <= 90) {
                        bArrCopyOf[i11] = (byte) (b12 + 32);
                    }
                }
                return new j(bArrCopyOf);
            }
            i5++;
        }
    }

    public final String r() {
        String str = this.f76133c;
        if (str != null) {
            return str;
        }
        byte[] bArrI = i();
        Intrinsics.g(bArrI, "<this>");
        String str2 = new String(bArrI, Charsets.f72000b);
        this.f76133c = str2;
        return str2;
    }

    public void t(g gVar, int i5) {
        n90.b.c(this, gVar, i5);
    }

    public String toString() {
        byte[] bArr = this.f76131a;
        if (bArr.length == 0) {
            return "[size=0]";
        }
        int iA = n90.b.a(bArr);
        if (iA != -1) {
            String strR = r();
            String strSubstring = strR.substring(0, iA);
            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
            String strF0 = r70.j.F0(r70.j.F0(r70.j.F0(strSubstring, "\\", "\\\\", false), "\n", "\\n", false), "\r", "\\r", false);
            if (iA >= strR.length()) {
                return c1.m(AbstractJsonLexerKt.END_LIST, "[text=", strF0);
            }
            return "[size=" + bArr.length + " text=" + strF0 + "…]";
        }
        if (bArr.length <= 64) {
            return "[hex=" + d() + AbstractJsonLexerKt.END_LIST;
        }
        StringBuilder sb2 = new StringBuilder("[size=");
        sb2.append(bArr.length);
        sb2.append(" hex=");
        int iY = com.google.android.gms.internal.consent_sdk.e0.Y(this, 64);
        if (iY > bArr.length) {
            throw new IllegalArgumentException(a2.c.m(new StringBuilder("endIndex > length("), bArr.length, ')').toString());
        }
        if (iY < 0) {
            throw new IllegalArgumentException("endIndex < beginIndex");
        }
        sb2.append((iY == bArr.length ? this : new j(u90.b.x(0, iY, bArr))).d());
        sb2.append("…]");
        return sb2.toString();
    }
}
