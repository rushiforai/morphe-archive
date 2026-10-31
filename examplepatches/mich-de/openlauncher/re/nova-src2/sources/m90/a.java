package m90;

import java.util.Arrays;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;

/* loaded from: classes5.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f76087a;

    static {
        j jVar = j.f76130d;
        f76087a = lm.e.n("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/").f76131a;
        lm.e.n("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_");
    }

    public static final byte[] a(String str) {
        int i5;
        char cCharAt;
        int length = str.length();
        while (length > 0 && ((cCharAt = str.charAt(length - 1)) == '=' || cCharAt == '\n' || cCharAt == '\r' || cCharAt == ' ' || cCharAt == '\t')) {
            length--;
        }
        int i11 = (int) ((length * 6) / 8);
        byte[] bArr = new byte[i11];
        int i12 = 0;
        int i13 = 0;
        int i14 = 0;
        for (int i15 = 0; i15 < length; i15++) {
            char cCharAt2 = str.charAt(i15);
            if ('A' <= cCharAt2 && cCharAt2 < '[') {
                i5 = cCharAt2 - 'A';
            } else if ('a' <= cCharAt2 && cCharAt2 < '{') {
                i5 = cCharAt2 - 'G';
            } else if ('0' <= cCharAt2 && cCharAt2 < ':') {
                i5 = cCharAt2 + 4;
            } else if (cCharAt2 == '+' || cCharAt2 == '-') {
                i5 = 62;
            } else if (cCharAt2 == '/' || cCharAt2 == '_') {
                i5 = 63;
            } else {
                if (cCharAt2 != '\n' && cCharAt2 != '\r' && cCharAt2 != ' ' && cCharAt2 != '\t') {
                    return null;
                }
            }
            i13 = (i13 << 6) | i5;
            i12++;
            if (i12 % 4 == 0) {
                bArr[i14] = (byte) (i13 >> 16);
                int i16 = i14 + 2;
                bArr[i14 + 1] = (byte) (i13 >> 8);
                i14 += 3;
                bArr[i16] = (byte) i13;
            }
        }
        int i17 = i12 % 4;
        if (i17 == 1) {
            return null;
        }
        if (i17 == 2) {
            bArr[i14] = (byte) ((i13 << 12) >> 16);
            i14++;
        } else if (i17 == 3) {
            int i18 = i13 << 6;
            int i19 = i14 + 1;
            bArr[i14] = (byte) (i18 >> 16);
            i14 += 2;
            bArr[i19] = (byte) (i18 >> 8);
        }
        if (i14 == i11) {
            return bArr;
        }
        byte[] bArrCopyOf = Arrays.copyOf(bArr, i14);
        Intrinsics.f(bArrCopyOf, "copyOf(this, newSize)");
        return bArrCopyOf;
    }

    public static String b(byte[] bArr) {
        Intrinsics.g(bArr, "<this>");
        byte[] map = f76087a;
        Intrinsics.g(map, "map");
        byte[] bArr2 = new byte[((bArr.length + 2) / 3) * 4];
        int length = bArr.length - (bArr.length % 3);
        int i5 = 0;
        int i11 = 0;
        while (i5 < length) {
            byte b11 = bArr[i5];
            int i12 = i5 + 2;
            byte b12 = bArr[i5 + 1];
            i5 += 3;
            byte b13 = bArr[i12];
            bArr2[i11] = map[(b11 & 255) >> 2];
            bArr2[i11 + 1] = map[((b11 & 3) << 4) | ((b12 & 255) >> 4)];
            int i13 = i11 + 3;
            bArr2[i11 + 2] = map[((b12 & 15) << 2) | ((b13 & 255) >> 6)];
            i11 += 4;
            bArr2[i13] = map[b13 & 63];
        }
        int length2 = bArr.length - length;
        if (length2 == 1) {
            byte b14 = bArr[i5];
            bArr2[i11] = map[(b14 & 255) >> 2];
            bArr2[i11 + 1] = map[(b14 & 3) << 4];
            bArr2[i11 + 2] = 61;
            bArr2[i11 + 3] = 61;
        } else if (length2 == 2) {
            int i14 = i5 + 1;
            byte b15 = bArr[i5];
            byte b16 = bArr[i14];
            bArr2[i11] = map[(b15 & 255) >> 2];
            bArr2[i11 + 1] = map[((b15 & 3) << 4) | ((b16 & 255) >> 4)];
            bArr2[i11 + 2] = map[(b16 & 15) << 2];
            bArr2[i11 + 3] = 61;
        }
        return new String(bArr2, Charsets.f72000b);
    }
}
