package defpackage;

import java.nio.charset.Charset;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mpg {
    public static final mpg b = new mpg(new byte[0]);
    public final byte[] a;

    public mpg(byte[] bArr) {
        this.a = bArr;
    }

    public static mpg e(byte[] bArr) {
        byte[] bArr2;
        int length = bArr.length;
        if (length == 0) {
            bArr2 = new byte[0];
        } else {
            byte[] bArr3 = new byte[length];
            System.arraycopy(bArr, 0, bArr3, 0, length);
            bArr2 = bArr3;
        }
        return new mpg(bArr2);
    }

    public static int f(byte b2) {
        int[] iArr = {358984857, 11257410, 369424407, 615188036, 873771167, 1734030349, 488663950, 1985433483, 395279207};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        return b2 & ((iArr[7] % 395279207) ^ lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7));
    }

    public final byte[] a() {
        byte[] bArr = this.a;
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

    public final byte b(int i) {
        byte[] bArr = this.a;
        int length = bArr.length;
        if (((length - (i + 1)) | i) >= 0) {
            return bArr[i];
        }
        if (i < 0) {
            StringBuilder sb = new StringBuilder(String.valueOf(i).length() + 11);
            sb.append(cmg.a("Akelqh1fajntGgo="));
            sb.append(i);
            throw new ArrayIndexOutOfBoundsException(sb.toString());
        }
        StringBuilder sb2 = new StringBuilder(String.valueOf(length).length() + String.valueOf(i).length() + 18);
        String strA = cmg.a("Akelqh1faDmxRUSK1T9GeQ==");
        String strA2 = cmg.a("Zwk=");
        sb2.append(strA);
        sb2.append(i);
        sb2.append(strA2);
        sb2.append(length);
        throw new ArrayIndexOutOfBoundsException(sb2.toString());
    }

    public final String c() {
        Charset charsetForName = Charset.forName(cmg.a("Hn2H4l0="));
        byte[] bArr = this.a;
        return new String(bArr, 0, bArr.length, charsetForName);
    }

    public final mpg d(mpg mpgVar) {
        byte[] bArr = mpgVar.a;
        int length = bArr.length;
        byte[] bArr2 = this.a;
        int length2 = bArr2.length;
        byte[] bArr3 = new byte[length2 + length];
        System.arraycopy(bArr2, 0, bArr3, 0, length2);
        System.arraycopy(bArr, 0, bArr3, length2, length);
        return e(bArr3);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof mpg) {
            return Arrays.equals(this.a, ((mpg) obj).a);
        }
        return false;
    }

    public final int hashCode() {
        return Arrays.hashCode(this.a);
    }

    public final String toString() {
        int[] iArr = {95266356, 568641516, 183483904, 553669100, 504469011, 966284502, 91904737, 2026478004, 1659239833};
        int i = iArr[0];
        int i2 = iArr[1];
        int i3 = iArr[2];
        int i4 = iArr[3];
        int i5 = iArr[4];
        int i6 = iArr[5];
        int i7 = iArr[6];
        int i8 = iArr[7];
        int iF = lv8.f((i2 & (~i)) | i3, (i & i4) | i5, i6, i7);
        String string = Arrays.toString(this.a);
        StringBuilder sb = new StringBuilder(String.valueOf(string).length() + ((i8 % 1659239833) ^ iF));
        sb.append(cmg.a("CVC1qiQNJHikW0iU1TIPZA=="));
        sb.append(string);
        sb.append(cmg.a("Ng=="));
        return sb.toString();
    }
}
