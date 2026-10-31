package com.facebook.ads.redexgen.X;

import android.content.SharedPreferences;
import com.facebook.ads.internal.util.process.ProcessUtils;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.oy, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2327oy {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 82);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{-60, -48, -50, -113, -57, -62, -60, -58, -61, -48, -48, -52, -113, -62, -59, -44, -113, -54, -49, -43, -58, -45, -49, -62, -51, -113, -62, -59, -44, -64, -44, -47, -64, -44, -43, -48, -45, -62, -56, -58};
    }

    public static SharedPreferences A00(C2095lA c2095lA) {
        return c2095lA.getSharedPreferences(ProcessUtils.getProcessSpecificName(A01(0, 40, 15), c2095lA), 0);
    }

    public final int A03(C2095lA c2095lA, String str, int i5) {
        return A00(c2095lA).getInt(str, i5);
    }

    public final String A04(C2095lA c2095lA, String str, String str2) {
        return A00(c2095lA).getString(str, str2);
    }

    public final void A05(C2095lA c2095lA, String str, int i5) {
        SharedPreferences btSP = A00(c2095lA);
        btSP.edit().putInt(str, i5).apply();
    }

    public final void A06(C2095lA c2095lA, String str, String str2) {
        SharedPreferences btSP = A00(c2095lA);
        btSP.edit().putString(str, str2).apply();
    }
}
