package com.facebook.ads.redexgen.X;

import android.os.PowerManager;
import android.util.Log;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.qw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2446qw {
    public static byte[] A00;
    public static final String A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 23);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{100, -105, -126, -124, -113, -109, -120, -114, -115, 63, -120, -115, 63, -110, -126, -111, -124, -124, -115, 63, -120, -115, -109, -124, -111, -128, -126, -109, -120, -107, -124, 63, -126, -121, -124, -126, -118, 75, 63, -128, -110, -110, -108, -116, -120, -115, -122, 63, -120, -115, -109, -124, -111, -128, -126, -109, -120, -107, -124, 77, -103, -104, -96, -114, -101, -46, -55, -45, -53, -39};
    }

    static {
        A01();
        A01 = C2446qw.class.getSimpleName();
    }

    public static boolean A02(C0958Hi c0958Hi) {
        return A03(c0958Hi) && C2447qx.A03(c0958Hi);
    }

    public static boolean A03(C0958Hi c0958Hi) {
        if (c0958Hi == null) {
            return true;
        }
        try {
            return ((PowerManager) c0958Hi.getSystemService(A00(60, 5, 18))).isInteractive();
        } catch (Exception e3) {
            Log.e(A01, A00(0, 60, 8), e3);
            c0958Hi.A08().ABz(A00(65, 5, 73), AbstractC2126lf.A2S, new C2127lg(e3));
            return true;
        }
    }
}
