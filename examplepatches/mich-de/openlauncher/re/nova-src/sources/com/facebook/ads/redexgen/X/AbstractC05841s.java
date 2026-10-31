package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.1s, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC05841s {
    public static byte[] A00;

    static {
        A0F();
    }

    public static String A0D(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 104);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0F() {
        A00 = new byte[]{-15, -25, -20, -27, -22, -29, -14, -19, -20, -54, -25, -15, -14, -90, -84, -84, -84, -89};
    }

    public static final <T> List<T> A0E(T t6) {
        List<T> listSingletonList = Collections.singletonList(t6);
        C1h.A08(listSingletonList, A0D(0, 18, 22));
        return listSingletonList;
    }
}
