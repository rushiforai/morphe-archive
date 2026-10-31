package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class YT {
    public static YR A00;
    public static byte[] A01;
    public static final int A02;
    public static final int A03;
    public static final int A04;
    public static final int A05;
    public static final int A06;
    public static final int A07;
    public static final YT A08;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{40, 41, 48, 41, 43, 37, 56, 41, -39, -41, -26, -69, -32, -27, -26, -45, -32, -43, -41, -102, -96, -96, -96, -101};
    }

    static {
        A01();
        A08 = new YT();
        A06 = 2;
        A03 = 3;
        A05 = 4;
        A07 = 5;
        A04 = 6;
        A02 = 7;
        AB abA00 = AB.A00();
        C1h.A08(abA00, A00(8, 16, 40));
        A00 = abA00;
    }

    @JvmStatic
    public static final void A02(YR yr2) {
        C1h.A09(yr2, A00(0, 8, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE));
        A00 = yr2;
    }
}
