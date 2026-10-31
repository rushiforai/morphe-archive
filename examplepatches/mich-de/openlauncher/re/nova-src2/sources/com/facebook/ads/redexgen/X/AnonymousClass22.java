package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.22, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class AnonymousClass22 {
    public static byte[] A00;
    public static final AnonymousClass22 A01;

    static {
        A01();
        A01 = new AnonymousClass22();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 117);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{1, 5, 10, 2, -1, 4, -60, -21, 4, -1, 10};
    }

    public final String toString() {
        return A00(0, 11, 33);
    }
}
