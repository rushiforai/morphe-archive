package com.facebook.ads.redexgen.X;

import com.google.common.collect.ElementTypesAreNonnullByDefault;
import java.util.Arrays;
import javax.annotation.CheckForNull;

@ElementTypesAreNonnullByDefault
/* renamed from: com.facebook.ads.redexgen.X.Vd, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1295Vd {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 91);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{12, 25, 77, 4, 3, 9, 8, 21, 77};
    }

    public static Object A00(@CheckForNull Object element, int index) {
        if (element != null) {
            return element;
        }
        throw new NullPointerException(A01(0, 9, 54) + index);
    }

    public static Object[] A03(Object... array) {
        A04(array, array.length);
        return array;
    }

    public static Object[] A04(Object[] array, int length) {
        for (int i5 = 0; i5 < length; i5++) {
            A00(array[i5], i5);
        }
        return array;
    }

    public static <T> T[] A05(T[] tArr, int i5) {
        return (T[]) AbstractC1293Va.A01(tArr, i5);
    }
}
