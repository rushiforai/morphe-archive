package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.e9, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1669e9 {
    A04,
    A03,
    A05,
    A02;

    public static byte[] A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 29);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{35, 36, 35, 62, 53, 57, 47, 45, 39, 47, 36, 62, 46, 50, 63, 39, 60, 63, 61, 53, 26, 24, 15, 12, 15, 30, 9, 2, 49, 42, 47, 42, 43, 51, 42};
    }

    static {
        A01();
    }
}
