package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.regex.Pattern;

/* renamed from: com.facebook.ads.redexgen.X.ca, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1573ca {
    public static byte[] A00;
    public static final Pattern A01;

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 104);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{12, 25, 43, 94, 86, 75, 73, 90, 75, 74, 6, 61, 43, 40, 60, 58, 58, 20, 6, 45, 85, 90, 6, -2, 19, 32, 17, 19, 28, 34, 15, 21, 19, 33, -50, 27, 35, 33, 34, -50, 19, 28, 18, -50, 37, 23, 34, 22, -50, -45, -11, -29, -32, -12, -14, -14, 5, -41, -54, -70, -69, -64, -79, -108, -57, -116, 117, -55, -102, -106, -107, -85, -112};
    }

    static {
        A03();
        A01 = Pattern.compile(A02(58, 15, 4));
    }

    public static float A00(String str) throws NumberFormatException {
        if (str.endsWith(A02(0, 1, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE))) {
            return Float.parseFloat(str.substring(0, str.length() - 1)) / 100.0f;
        }
        throw new NumberFormatException(A02(23, 27, 70));
    }

    public static long A01(String str) throws NumberFormatException {
        long j11 = 0;
        String[] strArrA1P = N1.A1P(str, A02(56, 2, 65));
        for (String str2 : N1.A1O(strArrA1P[0], A02(1, 1, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE))) {
            long value = Long.parseLong(str2);
            j11 = (60 * j11) + value;
        }
        long j12 = j11 * 1000;
        if (strArrA1P.length == 2) {
            long value2 = Long.parseLong(strArrA1P[1]);
            j12 += value2;
        }
        return 1000 * j12;
    }

    public static void A04(C1084Mk c1084Mk) throws L9 {
        int iA09 = c1084Mk.A09();
        if (A05(c1084Mk)) {
            return;
        }
        c1084Mk.A0f(iA09);
        throw L9.A01(A02(2, 21, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE) + c1084Mk.A0T(), null);
    }

    public static boolean A05(C1084Mk c1084Mk) {
        String strA0T = c1084Mk.A0T();
        if (strA0T != null) {
            String line = A02(50, 6, 54);
            if (strA0T.startsWith(line)) {
                return true;
            }
        }
        return false;
    }
}
