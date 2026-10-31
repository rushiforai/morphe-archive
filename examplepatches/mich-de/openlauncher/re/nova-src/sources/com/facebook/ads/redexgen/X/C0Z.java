package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.List;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0Z, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C0Z extends AbstractC05710w {
    public static byte[] A00;

    static {
        A06();
    }

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 112);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A00 = new byte[]{10, 66, 94, 95, 69, 8, 76, 94, 97, 68, 94, 89, 5, 3, 3, 3, 4};
    }

    public static final <T> List<T> A05(T[] tArr) {
        C1h.A09(tArr, A04(0, 6, 70));
        List<T> listA00 = AbstractC05851t.A00(tArr);
        C1h.A08(listA00, A04(6, 11, 93));
        return listA00;
    }
}
