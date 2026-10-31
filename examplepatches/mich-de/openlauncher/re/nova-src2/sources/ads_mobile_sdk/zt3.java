package ads_mobile_sdk;

import b.k9;
import java.nio.charset.Charset;
import java.util.Arrays;

/* loaded from: classes2.dex */
public final class zt3 {

    /* renamed from: b, reason: collision with root package name */
    public static final zt3 f12664b = new zt3(new byte[0]);

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f12665a;

    public zt3(byte[] bArr) {
        this.f12665a = bArr;
    }

    public final byte[] a() {
        byte[] bArr = this.f12665a;
        int length = bArr.length;
        if (length == 0) {
            return new byte[0];
        }
        if (length == 0) {
            return new byte[0];
        }
        byte[] bArr2 = new byte[length];
        System.arraycopy(bArr, 0, bArr2, 0, length);
        return bArr2;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof zt3) {
            return Arrays.equals(this.f12665a, ((zt3) obj).f12665a);
        }
        return false;
    }

    public final int hashCode() {
        return Integer.hashCode(Arrays.hashCode(this.f12665a));
    }

    public final String toString() {
        int[] iArr = {936621968, 262671172, 1099388327, 506341952, 1363551406, -1491858486, 110389885, 989492335, 981766422};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int i12 = iArr[2];
        int i13 = iArr[3];
        int i14 = iArr[4];
        int iC = k9.c((i11 & (~i5)) | i12, (i5 & i13) | i14, iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]);
        String string = Arrays.toString(this.f12665a);
        StringBuilder sb2 = new StringBuilder(String.valueOf(string).length() + iC);
        sb2.append(xt3.a("CVC1qiQNJHikW0iU1TIPZA=="));
        sb2.append(string);
        sb2.append(xt3.a("Ng=="));
        return sb2.toString();
    }

    public final byte a(int i5) {
        int iC = k9.c(((~2106914653) & 587408197) | 1537377410, (2106914653 & 536945509) | 443419704, -2054635237, 102375994) ^ (2013725218 % 1633938701);
        byte[] bArr = this.f12665a;
        int length = bArr.length;
        if (((length - (i5 + 1)) | i5) >= 0) {
            return bArr[i5];
        }
        if (i5 < 0) {
            StringBuilder sb2 = new StringBuilder(String.valueOf(i5).length() + iC);
            sb2.append(xt3.a("Akelqh1fajntGgo="));
            sb2.append(i5);
            throw new ArrayIndexOutOfBoundsException(sb2.toString());
        }
        StringBuilder sb3 = new StringBuilder(String.valueOf(i5).length() + 18 + String.valueOf(length).length());
        sb3.append(xt3.a("Akelqh1faDmxRUSK1T9GeQ=="));
        sb3.append(i5);
        sb3.append(xt3.a("Zwk="));
        sb3.append(length);
        throw new ArrayIndexOutOfBoundsException(sb3.toString());
    }

    public final zt3 a(zt3 zt3Var) {
        byte[] bArr;
        byte[] bArr2 = this.f12665a;
        int length = bArr2.length + zt3Var.f12665a.length;
        byte[] bArr3 = new byte[length];
        System.arraycopy(bArr2, 0, bArr3, 0, bArr2.length);
        byte[] bArr4 = zt3Var.f12665a;
        System.arraycopy(bArr4, 0, bArr3, bArr2.length, bArr4.length);
        if (length == 0) {
            bArr = new byte[0];
        } else {
            bArr = new byte[length];
            System.arraycopy(bArr3, 0, bArr, 0, length);
        }
        return new zt3(bArr);
    }

    public static zt3 a(String str) {
        byte[] bArr;
        byte[] bytes = str.getBytes(Charset.forName(xt3.a("Hn2H4l0=")));
        int length = bytes.length;
        if (length == 0) {
            bArr = new byte[0];
        } else {
            byte[] bArr2 = new byte[length];
            System.arraycopy(bytes, 0, bArr2, 0, length);
            bArr = bArr2;
        }
        return new zt3(bArr);
    }

    public static int a(byte b11) {
        int[] iArr = {2107654819, 15074090, 1957914693, -2142502098, -1902504939, -100121615, 100669, 1835342733, 837626799};
        int i5 = iArr[0];
        int i11 = iArr[1];
        int i12 = iArr[2];
        int i13 = iArr[3];
        int i14 = iArr[4];
        return b11 & (k9.c((i11 & (~i5)) | i12, (i5 & i13) | i14, iArr[5], iArr[6]) ^ (iArr[7] % iArr[8]));
    }
}
