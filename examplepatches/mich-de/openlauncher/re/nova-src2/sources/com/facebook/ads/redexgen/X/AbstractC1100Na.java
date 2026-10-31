package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Na, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract /* synthetic */ class AbstractC1100Na {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 103);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{1, 29, 4, 5, 10, 27, 6, 10, 48, 33, 60, 48, 107, 50, 48, 48, 22, 3, 2};
    }

    public static /* synthetic */ boolean A02(String str) {
        if (str == null) {
            return false;
        }
        String strA01 = XC.A01(str);
        if (TextUtils.isEmpty(strA01)) {
            return false;
        }
        return ((strA01.contains(A00(4, 4, 25)) && !strA01.contains(A00(8, 8, 35))) || strA01.contains(A00(0, 4, 14)) || strA01.contains(A00(16, 3, 9))) ? false : true;
    }
}
