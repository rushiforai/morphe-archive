package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0v, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC05700v extends AbstractC05841s {
    public static byte[] A00;
    public static String[] A01 = {"nlw", "aAnj26nH2hjQGae9mvSI0", "J9vc", "wEHjWviIagA0RiZtsIcLVMEmrzBUulD9", "XMmicjZIesCyTiRThgSUJWEQzgXugrDN", "JyVC3ytnutRkm33", "2H2TswSbVhllomBezSDO7vtM0swUoJ9q", "irMlxMArUeq5dat6fat2aEp5W"};

    public static String A08(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 95);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0B() {
        A00 = new byte[]{40, 15, 5, 4, 25, 65, 14, 23, 4, 19, 7, 13, 14, 22, 65, 9, 0, 18, 65, 9, 0, 17, 17, 4, 15, 4, 5, 79, 4, 13, 4, 12, 4, 15, 21, 18};
    }

    static {
        A0B();
    }

    public static final <T> List<T> A09() {
        C05680t c05680t = C05680t.A02;
        String[] strArr = A01;
        if (strArr[2].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[7] = "T8jIe6Y7i5zGRCzfWEsmpCsqB";
        strArr2[1] = "YTX5P8jNZqeshwgqZ2btT";
        return c05680t;
    }

    public static final <T> List<T> A0A(T... tArr) {
        C1h.A09(tArr, A08(28, 8, 62));
        return tArr.length > 0 ? C0Z.A05(tArr) : A09();
    }

    public static final void A0C() {
        throw new ArithmeticException(A08(0, 28, 62));
    }
}
