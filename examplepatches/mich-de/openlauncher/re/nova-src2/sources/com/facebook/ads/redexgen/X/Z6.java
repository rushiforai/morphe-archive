package com.facebook.ads.redexgen.X;

import com.facebook.ads.androidx.media3.common.Metadata;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.CommentFrame;
import com.facebook.ads.androidx.media3.extractor.metadata.id3.InternalFrame;
import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* loaded from: assets/audience_network/classes.dex */
public final class Z6 {
    public static byte[] A02;
    public static String[] A03 = {"5C5MgsIa9PpNkbmDIOckXdgN8bNWJu40", "UoSf8BkyJ0is9eJHeJEEd25Yl88Narbs", "cndQmvJK2lbpUHLfTcCybvfaX46x7zx3", "sYzIfM2eIqwRkrW1UDPLJXBmSSC7kLky", "igX8V", "Hcb8m", "5WRfL2xfAQB1OLK5rOEaW3DejC4H2cv3", "zXEKiGH5LBoh71LUM1AArx8kb80jLzb7"};
    public static final Pattern A04;
    public int A00 = -1;
    public int A01 = -1;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A03;
            if (strArr[2].charAt(14) != strArr[7].charAt(14)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[5] = "kHcW9";
            strArr2[4] = "jyKl2";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 3);
            i13++;
        }
    }

    public static void A01() {
        A02 = new byte[]{96, 30, 101, 14, 19, 7, 95, 19, 88, AbstractJsonLexerKt.TC_INVALID, 19, 120, 99, 69, 6, 67, 30, 22, 101, 14, 19, 7, 95, 19, 88, AbstractJsonLexerKt.TC_INVALID, 19, 120, 99, 69, 6, 67, 23, 30, 22, 101, 14, 19, 7, 95, 19, 88, AbstractJsonLexerKt.TC_INVALID, 19, 120, 99, 69, 6, 67, 23, 34, 46, 44, 111, 32, 49, 49, 45, 36, 111, 40, 21, 52, 47, 36, 50, 3, 62, 31, 4, 57, 39, 58, 40};
    }

    static {
        A01();
        A04 = Pattern.compile(A00(0, 50, 61));
    }

    private boolean A02(String str) throws NumberFormatException {
        Matcher matcher = A04.matcher(str);
        if (matcher.find()) {
            try {
                int i5 = Integer.parseInt((String) N1.A0f(matcher.group(1)), 16);
                int i11 = Integer.parseInt((String) N1.A0f(matcher.group(2)), 16);
                if (i5 > 0 || i11 > 0) {
                    this.A00 = i5;
                    this.A01 = i11;
                    return true;
                }
                return false;
            } catch (NumberFormatException unused) {
                return false;
            }
        }
        return false;
    }

    public final boolean A03() {
        return (this.A00 == -1 || this.A01 == -1) ? false : true;
    }

    public final boolean A04(int i5) {
        int encoderDelay = i5 >> 12;
        int i11 = i5 & 4095;
        if (encoderDelay <= 0 && i11 <= 0) {
            String[] strArr = A03;
            String str = strArr[6];
            String str2 = strArr[0];
            int encoderPadding = str.charAt(17);
            if (encoderPadding != str2.charAt(17)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[5] = "Zznty";
            strArr2[4] = "hZ8yw";
            return false;
        }
        this.A00 = encoderDelay;
        String[] strArr3 = A03;
        String str3 = strArr3[6];
        String str4 = strArr3[0];
        int encoderPadding2 = str3.charAt(17);
        if (encoderPadding2 != str4.charAt(17)) {
            throw new RuntimeException();
        }
        String[] strArr4 = A03;
        strArr4[2] = "UO2hDT3GmEt5f6LVg4xc25G07U0Y3fAG";
        strArr4[7] = "BFJ1sfZUnD4e94LvLJfDF6QEMH59jnIu";
        this.A01 = i11;
        return true;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A05(Metadata metadata) {
        for (int i5 = 0; i5 < i; i5++) {
            Metadata.Entry entryA03 = metadata.A03(i5);
            boolean z11 = entryA03 instanceof CommentFrame;
            String strA00 = A00(66, 8, 105);
            if (z11) {
                CommentFrame commentFrame = (CommentFrame) entryA03;
                if (strA00.equals(commentFrame.A00) && A02(commentFrame.A02)) {
                    return true;
                }
            } else if (entryA03 instanceof InternalFrame) {
                InternalFrame internalFrame = (InternalFrame) entryA03;
                String[] strArr = A03;
                String str = strArr[5];
                String str2 = strArr[4];
                int length = str.length();
                int i11 = str2.length();
                if (length != i11) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A03;
                strArr2[3] = "9yJoaawEqghSPuG10gvCiNjmpMUaC0Ey";
                strArr2[1] = "nsXKN93UFUIcnPwZtFdEmqmRUMe5x5wO";
                if (A00(50, 16, 66).equals(internalFrame.A01) && strA00.equals(internalFrame.A00)) {
                    String str3 = internalFrame.A02;
                    String[] strArr3 = A03;
                    String str4 = strArr3[6];
                    String str5 = strArr3[0];
                    int iCharAt = str4.charAt(17);
                    int i12 = str5.charAt(17);
                    if (iCharAt != i12) {
                        throw new RuntimeException();
                    }
                    String[] strArr4 = A03;
                    strArr4[3] = "YjLtRPolmFhOysJQrTvDO5L2b6I2Jmqf";
                    strArr4[1] = "jBXyBewQrGO9SibG340hsBi5pNaZeqyL";
                    if (A02(str3)) {
                        return true;
                    }
                }
            } else {
                continue;
            }
        }
        String[] strArr5 = A03;
        if (strArr5[2].charAt(14) != strArr5[7].charAt(14)) {
            throw new RuntimeException();
        }
        String[] strArr6 = A03;
        strArr6[3] = "8wPmvPRk4HC1zIjowmroFW1Z47pu4nv1";
        strArr6[1] = "wEbgiPywVnyiTKafS8gJZxGNVogztgOX";
        return false;
    }
}
