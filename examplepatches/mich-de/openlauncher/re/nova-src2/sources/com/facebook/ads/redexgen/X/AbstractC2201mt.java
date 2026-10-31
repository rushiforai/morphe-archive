package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.mt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2201mt {
    public static byte[] A00;
    public static String[] A01 = {"z7fl6yLDnX", "I6ms8PC1R", "9l2yniCsNs", "ncU3wODxdj", "6", "W2f8yLUdf", "uAQeVH6Pts8Oja8tshXK2PPYPpxDyirV", "v"};

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 46);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{68, 65, 75, 82, 122, 70, 74, 75, 67, 76, 66, 122, 86, 64, 75, 65, 122, 67, 71, 73, 74, 66, 76, 75, 122, 68, 86, 76, 65, 75, 78, 68, 93, 117, 67, 78, 76, 75, 117, 88, 79, 76, 88, 79, 89, 66, 117, 94, 67, 71, 79, 117, 71, 89, 64, 69, 79, 86, 126, 82, 73, 78, 84, 77, 69, 126, 82, 68, 79, 69, 126, 64, 81, 81, 126, 72, 79, 71, 78, 126, 72, 79, 126, 84, 82, 68, 83, 126, 64, 70, 68, 79, 85, 19, 22, 28, 5, 45, 7, 1, 23, 45, 20, 16, 70, 19, 45, 27, 22, 78, 75, 65, 88, 112, 90, 92, 74, 112, 73, 77, 27, 78, 112, 70, 75, 112, 73, 70, 93, 92, 91, 74, 79, 69, 92, 116, 94, 88, 78, 89, 116, 74, 76, 78, 69, 95, 116, 89, 78, 77, 89, 78, 88, 67, 116, 95, 66, 70, 78, 116, 70, 88};
        String[] strArr = A01;
        if (strArr[3].length() != strArr[2].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[1] = "p5GsoscRd";
        strArr2[5] = "RXaFE6KJ1";
    }

    static {
        A03();
    }

    public static long A00(Context context) {
        return C2203mv.A0T(context).A36(A02(29, 25, 4), -1L);
    }

    public static long A01(Context context) {
        return C2203mv.A0T(context).A36(A02(Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, 31, 5), -1L);
    }

    public static boolean A04(Context context) {
        return C2203mv.A0T(context).A3B(A02(54, 39, 15), true);
    }

    public static boolean A05(Context context) {
        return C2203mv.A0T(context).A3B(A02(0, 29, 11), false);
    }

    public static boolean A06(Context context) {
        return C2203mv.A0T(context).A3B(A02(93, 16, 92), false);
    }

    public static boolean A07(Context context) {
        return C2203mv.A0T(context).A3B(A02(109, 22, 1), false);
    }
}
