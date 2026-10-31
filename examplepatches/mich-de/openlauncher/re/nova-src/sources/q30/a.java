package q30;

import a2.c;
import androidx.compose.ui.node.LayoutNode;
import b.c0;
import b.u4;
import com.teslacoilsw.licensing_misc.util.Base64DecoderException;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: classes4.dex */
public abstract class a {

    /* renamed from: a, reason: collision with root package name */
    public static final byte[] f83605a = {65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 43, 47};

    /* renamed from: b, reason: collision with root package name */
    public static final byte[] f83606b = {-9, -9, -9, -9, -9, -9, -9, -9, -9, -5, -5, -9, -9, -5, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, -5, -9, -9, -9, -9, -9, -9, -9, -9, -9, -9, 62, -9, -9, -9, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -9, -9, -9, -1, -9, -9, -9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -9, -9, -9, -9, -9, -9, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -9, -9, -9, -9, -9};

    public static byte[] a(String str) throws Base64DecoderException {
        byte[] bArr;
        byte[] bytes = str.getBytes();
        int length = bytes.length;
        byte[] bArr2 = new byte[c.A(length, 3, 4, 2)];
        byte[] bArr3 = new byte[4];
        int i5 = 0;
        int i11 = 0;
        int iB = 0;
        while (true) {
            bArr = f83606b;
            if (i5 >= length) {
                break;
            }
            byte b11 = (byte) (bytes[i5] & AbstractJsonLexerKt.TC_INVALID);
            byte b12 = bArr[b11];
            if (b12 < -5) {
                throw new Base64DecoderException(c0.o(u4.j(i5, "Bad Base64 input character at ", ": "), bytes[i5], "(decimal)"));
            }
            if (b12 >= -1) {
                if (b11 == 61) {
                    int i12 = length - i5;
                    byte b13 = (byte) (bytes[length - 1] & AbstractJsonLexerKt.TC_INVALID);
                    if (i11 == 0 || i11 == 1) {
                        throw new Base64DecoderException(c0.h(i5, "invalid padding byte '=' at byte offset "));
                    }
                    if ((i11 == 3 && i12 > 2) || (i11 == 4 && i12 > 1)) {
                        throw new Base64DecoderException(c0.h(i5, "padding byte '=' falsely signals end of encoded value at offset "));
                    }
                    if (b13 != 61 && b13 != 10) {
                        throw new Base64DecoderException("encoded value has invalid trailing byte");
                    }
                } else {
                    int i13 = i11 + 1;
                    bArr3[i11] = b11;
                    if (i13 == 4) {
                        iB += b(bArr3, bArr2, iB, bArr);
                        i11 = 0;
                    } else {
                        i11 = i13;
                    }
                }
            }
            i5++;
        }
        if (i11 != 0) {
            if (i11 == 1) {
                throw new Base64DecoderException("single trailing character at offset " + (length - 1));
            }
            bArr3[i11] = 61;
            iB += b(bArr3, bArr2, iB, bArr);
        }
        byte[] bArr4 = new byte[iB];
        System.arraycopy(bArr2, 0, bArr4, 0, iB);
        return bArr4;
    }

    public static int b(byte[] bArr, byte[] bArr2, int i5, byte[] bArr3) {
        byte b11 = bArr[2];
        if (b11 == 61) {
            bArr2[i5] = (byte) ((((bArr3[bArr[1]] << 24) >>> 12) | ((bArr3[bArr[0]] << 24) >>> 6)) >>> 16);
            return 1;
        }
        byte b12 = bArr[3];
        if (b12 == 61) {
            int i11 = ((bArr3[bArr[1]] << 24) >>> 12) | ((bArr3[bArr[0]] << 24) >>> 6) | ((bArr3[b11] << 24) >>> 18);
            bArr2[i5] = (byte) (i11 >>> 16);
            bArr2[i5 + 1] = (byte) (i11 >>> 8);
            return 2;
        }
        int i12 = ((bArr3[bArr[1]] << 24) >>> 12) | ((bArr3[bArr[0]] << 24) >>> 6) | ((bArr3[b11] << 24) >>> 18) | ((bArr3[b12] << 24) >>> 24);
        bArr2[i5] = (byte) (i12 >> 16);
        bArr2[i5 + 1] = (byte) (i12 >> 8);
        bArr2[i5 + 2] = (byte) i12;
        return 3;
    }

    public static String c(byte[] bArr) {
        byte[] bArr2;
        int length = bArr.length;
        int i5 = ((length + 2) / 3) * 4;
        int i11 = (i5 / LayoutNode.NotPlacedPlaceOrder) + i5;
        byte[] bArr3 = new byte[i11];
        int i12 = length - 2;
        int i13 = 0;
        int i14 = 0;
        int i15 = 0;
        while (true) {
            bArr2 = f83605a;
            if (i13 >= i12) {
                break;
            }
            int i16 = ((bArr[i13] << 24) >>> 8) | ((bArr[i13 + 1] << 24) >>> 16) | ((bArr[i13 + 2] << 24) >>> 24);
            bArr3[i14] = bArr2[i16 >>> 18];
            int i17 = i14 + 1;
            bArr3[i17] = bArr2[(i16 >>> 12) & 63];
            bArr3[i14 + 2] = bArr2[(i16 >>> 6) & 63];
            bArr3[i14 + 3] = bArr2[i16 & 63];
            i15 += 4;
            if (i15 == Integer.MAX_VALUE) {
                bArr3[i14 + 4] = 10;
                i15 = 0;
                i14 = i17;
            }
            i13 += 3;
            i14 += 4;
        }
        if (i13 < length) {
            int i18 = length - i13;
            int i19 = (i18 > 2 ? (bArr[i13 + 2] << 24) >>> 24 : 0) | (i18 > 0 ? (bArr[i13] << 24) >>> 8 : 0) | (i18 > 1 ? (bArr[i13 + 1] << 24) >>> 16 : 0);
            if (i18 == 1) {
                bArr3[i14] = bArr2[i19 >>> 18];
                bArr3[i14 + 1] = bArr2[(i19 >>> 12) & 63];
                bArr3[i14 + 2] = 61;
                bArr3[i14 + 3] = 61;
            } else if (i18 == 2) {
                bArr3[i14] = bArr2[i19 >>> 18];
                bArr3[i14 + 1] = bArr2[(i19 >>> 12) & 63];
                bArr3[i14 + 2] = bArr2[(i19 >>> 6) & 63];
                bArr3[i14 + 3] = 61;
            } else if (i18 == 3) {
                bArr3[i14] = bArr2[i19 >>> 18];
                bArr3[i14 + 1] = bArr2[(i19 >>> 12) & 63];
                bArr3[i14 + 2] = bArr2[(i19 >>> 6) & 63];
                bArr3[i14 + 3] = bArr2[i19 & 63];
            }
            if (i15 + 4 == Integer.MAX_VALUE) {
                bArr3[i14 + 4] = 10;
                i14++;
            }
            i14 += 4;
        }
        if (i14 == i11) {
            return new String(bArr3, 0, i11);
        }
        throw new AssertionError("e != outBuff.length");
    }
}
