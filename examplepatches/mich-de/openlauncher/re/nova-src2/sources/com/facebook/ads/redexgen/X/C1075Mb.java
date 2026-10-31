package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.telephony.TelephonyManager;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Mb, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1075Mb {
    public static byte[] A00;
    public static String[] A01 = {"UOE", "OzW9X87JasmLstSP6B", "jnOtrEq1Da7DJLynCCVCLwS6SsKHs48l", "O2cSMO4CMvoJi034LwMavfQrBP3oFOAr", "zXr7HORls", "4U8gssiG", "b2wBHpmftLYpfuS3DNRk2GImOTPjiSVl", "vEOiOSf3kJqR3tF"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 59);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{121, 97, 102, 103, 108};
    }

    static {
        A01();
    }

    public static void A02(Context context, C1078Me c1078Me) {
        try {
            TelephonyManager telephonyManager = (TelephonyManager) AbstractC1062Ln.A01((TelephonyManager) context.getSystemService(A00(0, 5, 50)));
            C1074Ma callback = new C1074Ma(c1078Me);
            telephonyManager.registerTelephonyCallback(context.getMainExecutor(), callback);
            telephonyManager.unregisterTelephonyCallback(callback);
        } catch (RuntimeException unused) {
            if (A01[0].length() != 3) {
                RuntimeException e3 = new RuntimeException();
                throw e3;
            }
            String[] strArr = A01;
            strArr[4] = "OOzuyXFjn";
            strArr[1] = "Tl4vHdte33mqirbzG0";
            c1078Me.A07(5);
        }
    }
}
