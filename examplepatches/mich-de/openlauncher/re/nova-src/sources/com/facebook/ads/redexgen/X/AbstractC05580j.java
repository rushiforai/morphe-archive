package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0j, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC05580j extends AbstractC05771c {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 38);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{-87, -57, -44, -44, -43, -38, -122, -40, -43, -37, -44, -54, -122, -76, -57, -76, -122, -36, -57, -46, -37, -53, -108};
    }

    public static final int A00(float f11) {
        if (Float.isNaN(f11)) {
            throw new IllegalArgumentException(A01(0, 23, 64));
        }
        return Math.round(f11);
    }
}
