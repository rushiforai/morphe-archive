package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import java.util.Locale;

/* renamed from: com.facebook.ads.redexgen.X.qS, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2416qS {
    public static byte[] A00;
    public static final InterfaceC2415qR A01 = null;

    static {
        A08();
    }

    public static String A04(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 25);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A08() {
        A00 = new byte[]{-76, -67, -62, -11, 84, 81, 85, 86, 87, -83, -53, -40, -111, -34, -118, -48, -39, -36, -41, -53, -34, -118, -34, -45, -41, -49, -104};
    }

    public static long A00() {
        if (A01 != null) {
            return A01.A6M();
        }
        return System.currentTimeMillis();
    }

    public static long A01(long j11) {
        return A02(j11, System.currentTimeMillis());
    }

    public static long A02(long j11, long j12) {
        if (j11 == -1) {
            return -1L;
        }
        return j12 - j11;
    }

    public static String A03(double d5) {
        try {
            return String.format(Locale.US, A04(0, 4, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE), Double.valueOf(d5));
        } catch (Exception e3) {
            Log.e(C2416qS.class.getSimpleName(), A04(9, 18, 81), e3);
            return A04(4, 5, 10);
        }
    }

    public static String A05(long j11) {
        return String.valueOf(A01(j11));
    }

    @Deprecated
    public static String A06(long j11) {
        return A03(j11 / 1000.0d);
    }

    public static String A07(long j11) {
        return Long.toString(j11);
    }
}
