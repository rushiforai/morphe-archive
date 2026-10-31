package com.facebook.ads.redexgen.X;

import android.content.Context;
import com.amplitude.core.Configuration;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.my, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2206my {
    public static byte[] A00;
    public static final AtomicBoolean A01;

    public static String A06(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 102);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A00 = new byte[]{5, 8, 18, 27, 3, 22, 22, 3, 5, 8, 3, 7, 16, 23, 3, 19, 18, 3, 8, 13, 23, 7, -42, -39, -29, -20, -44, -25, -25, -44, -42, -39, -44, -25, -38, -26, -22, -38, -24, -23, -44, -23, -34, -30, -38, -28, -22, -23, -23, -20, -10, -1, -25, -6, -6, -25, -22, -4, -25, -16, -23, -10, -20, -5, -16, -23, -13, -19, -25, -19, -10, -23, -22, -12, -19, -20, 58, 61, 71, 80, 56, 75, 75, 56, 62, 71, 58, 59, 69, 62, 61, 22, 25, 35, 44, 20, 39, 39, 20, 27, 24, 20, 26, 45, 37, 30, 39, 22, 41, 30, 36, 35, 20, 41, 30, 34, 26, 36, 42, 41, -55, -52, -42, -33, -57, -38, -38, -57, -48, -55, -42, -52, -37, -48, -55, -45, -51, -57, -54, -47, -42, -52, -57, -38, -51, -36, -38, -31, -57, -51, -42, -55, -54, -44, -51, -52, -16, -13, -3, 6, -18, 1, 1, -18, -9, -16, -3, -13, 2, -9, -16, -6, -12, -18, -13, -8, 2, -14, -2, -3, -3, -12, -14, 3, -18, 1, -12, 3, 1, 8, -18, -12, -3, -16, -15, -5, -12, -13, 2, 5, 15, 24, 0, 19, 19, 0, 9, 2, 15, 5, 20, 9, 2, 12, 6, 0, 6, 15, 2, 3, 13, 6, 5, 40, 43, 53, 62, 38, 57, 57, 38, 47, 40, 53, 43, 58, 47, 40, 50, 44, 38, 50, 44, 44, 55, 38, 57, 57, 38, 54, 53, 38, 59, 48, 52, 44, 54, 60, 59, 38, 41, 51, 60, 36, 55, 55, 36, 45, 38, 51, 41, 56, 45, 38, 48, 42, 36, 50, 38, 61, 36, 55, 42, 57, 55, 46, 42, 56, -32, -29, -19, -10, -34, -15, -15, -34, -25, -32, -19, -29, -14, -25, -32, -22, -28, -34, -15, -28, -13, -15, -8, -34, -13, -24, -20, -28, -18, -12, -13, 65, 68, 78, 87, 63, 82, 82, 63, 72, 65, 78, 68, 83, 72, 65, 75, 69, 63, 84, 73, 77, 69, 79, 85, 84, 32, 35, 45, 54, 30, 49, 49, 30, 39, 32, 45, 35, 50, 39, 32, 42, 36, 30, 51, 40, 44, 36, 46, 52, 51, 30, 49, 36, 51, 49, 56, 30, 36, 45, 32, 33, 43, 36, 35, -48, -45, -35, -26, -50, -31, -31, -50, -41, -48, -35, -45, -30, -41, -48, -38, -44, -50, -29, -40, -36, -44, -34, -28, -29, -50, -28, -35, -47, -40, -35, -45, -50, -44, -35, -48, -47, -37, -44, -45, -47, -44, -34, -25, -49, -30, -30, -49, -39, -34, -28, -49, -43, -34, -47, -46, -36, -43, -44, -43, -40, -30, -21, -45, -26, -26, -45, -26, -32, -40, -45, -32, -41, -32, -39, -36, -26, -17, -41, -22, -22, -41, -22, -18, -41, -35, -26, -39, -38, -28, -35, -36, 52, 55, 65, 74, 50, 69, 69, 50, 70, 56, 65, 55, 50, 53, 71, 50, 56, 75, 71, 69, 52, 70, -11, -8, 2, 11, -13, 6, 6, -13, 7, -7, 2, -8, -13, -9, 3, 2, -6, -3, -5, -13, 8, 7, 48, 51, 61, 70, 46, 65, 65, 46, 68, 66, 52, 46, 49, 56, 61, 51, 46, 56, 60, 63, 62, 65, 67, 48, 61, 67, -18, -6, -8, -71, -15, -20, -18, -16, -19, -6, -6, -10, -71, -10, -20, -1, -20, -7, -20, 44, 56, 54, -9, 47, 42, 44, 46, 43, 56, 56, 52, -9, 64, 42, 52, 50, 67, 42, 60, 49, 50, 8, 8, -11, -5, 4, -9, -8, 2, -5, -6};
    }

    static {
        A08();
        A01 = new AtomicBoolean(false);
    }

    public static int A00(Context context) {
        return C2203mv.A0T(context).A35(A06(22, 26, 15), 10000);
    }

    public static int A01(Context context) {
        return C2203mv.A0T(context).A35(A06(Sdk.SDKError.Reason.SILENT_MODE_MONITOR_ERROR_VALUE, 25, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE), Configuration.FLUSH_INTERVAL_MILLIS);
    }

    public static int A02(Context context) {
        return C2203mv.A0T(context).A35(A06(259, 29, 95), 2);
    }

    public static int A03(Context context) {
        return C2203mv.A0T(context).A35(A06(288, 31, 25), 3000);
    }

    public static long A04(Context context) {
        return C2203mv.A0T(context).A36(A06(91, 29, 79), 86400000L);
    }

    public static Boolean A05(JSONObject jSONObject) throws JSONException {
        String strA06 = A06(586, 10, 48);
        if (jSONObject.has(strA06)) {
            return Boolean.valueOf(jSONObject.optBoolean(strA06, false));
        }
        return null;
    }

    public static String A07(boolean z11) {
        return z11 ? A06(564, 22, 99) : A06(545, 19, 37);
    }

    public static void A09(Context context) {
        C2203mv.A0T(context).A38(A06(76, 15, 115));
    }

    public static boolean A0A(Context context) {
        return C2203mv.A0T(context).A3B(A06(0, 22, 62), true);
    }

    public static boolean A0B(Context context) {
        return C2203mv.A0T(context).A3B(A06(120, 36, 2), false);
    }

    public static boolean A0C(Context context) {
        return C2203mv.A0T(context).A3B(A06(344, 39, 89), false);
    }

    public static boolean A0D(Context context) {
        return C2203mv.A0T(context).A3B(A06(156, 42, 41), false);
    }

    public static boolean A0E(Context context) {
        return C2203mv.A0T(context).A3B(A06(Sdk.SDKError.Reason.STALE_CACHED_RESPONSE_VALUE, 36, 97), true);
    }

    public static boolean A0F(Context context) {
        return A01.get() || A0S(context);
    }

    public static boolean A0G(Context context) {
        return C2203mv.A0T(context).A3B(A06(423, 19, 10), true);
    }

    public static boolean A0H(Context context) {
        return C2203mv.A0T(context).A3B(A06(457, 18, 18), true);
    }

    public static boolean A0I(Context context) {
        return C2203mv.A0T(context).A3B(A06(383, 40, 9), true);
    }

    public static boolean A0J(Context context) {
        return C2203mv.A0T(context).A3B(A06(442, 15, 14), true);
    }

    public static boolean A0K(Context context) {
        return C2203mv.A0T(context).A3B(A06(497, 22, 46), true);
    }

    public static boolean A0L(Context context) {
        return C2203mv.A1d(context) || A0P(context);
    }

    public static boolean A0M(Context context) {
        return A01.get() || A0Q(context);
    }

    public static boolean A0N(Context context) {
        return C2203mv.A0T(context).A3B(A06(475, 22, 109), false);
    }

    public static boolean A0O(Context context) {
        return C2203mv.A0T(context).A3B(A06(519, 26, 105), false);
    }

    public static boolean A0P(Context context) {
        return A0S(context) && C2203mv.A0T(context).A3B(A06(198, 25, 59), false);
    }

    public static boolean A0Q(Context context) {
        return A0S(context) && C2203mv.A0T(context).A3B(A06(48, 28, 34), false);
    }

    public static boolean A0R(Context context) {
        return A0H(context) || A0G(context);
    }

    public static boolean A0S(Context context) {
        return C2203mv.A0T(context).A3B(A06(76, 15, 115), false) && A0R(context) && !A0T(context, A04(context));
    }

    public static boolean A0T(Context context, long j11) {
        long lastUpdateTime = System.currentTimeMillis();
        long currentTime = C2203mv.A0S(context);
        return lastUpdateTime - currentTime > j11;
    }

    public static boolean A0U(String str) {
        if (str != null) {
            try {
                JSONObject bidPayloadJson = new JSONObject(str);
                Boolean boolA05 = A05(bidPayloadJson);
                if (boolA05 != null) {
                    return boolA05.booleanValue();
                }
                return true;
            } catch (JSONException unused) {
                return true;
            }
        }
        return true;
    }
}
