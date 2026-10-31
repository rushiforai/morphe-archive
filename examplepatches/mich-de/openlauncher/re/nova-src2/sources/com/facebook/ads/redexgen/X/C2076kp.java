package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import com.facebook.ads.internal.util.process.ProcessUtils;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.kp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2076kp {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 33);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{45, 59, 16, 42, 55, 59, 61, 46, 60, 43, 39, 37, 102, 46, 41, 43, 45, 42, 39, 39, 35, 102, 41, 44, 59, 102, 33, 38, 60, 45, 58, 38, 41, 36, 102, 42, 60, 45, 48, 60, 58, 41, 59};
    }

    public static SharedPreferences A00(C2095lA c2095lA) {
        return c2095lA.getSharedPreferences(ProcessUtils.getProcessSpecificName(A01(9, 34, 105), c2095lA), 0);
    }

    public final String A03(C2095lA c2095lA) {
        return A00(c2095lA).getString(A01(0, 9, 110), null);
    }

    public final void A04(C2095lA c2095lA, String str) {
        SharedPreferences btSP = A00(c2095lA);
        btSP.edit().putString(A01(0, 9, 110), str).apply();
    }
}
