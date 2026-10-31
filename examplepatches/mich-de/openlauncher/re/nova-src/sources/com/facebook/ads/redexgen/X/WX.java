package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class WX {
    public static byte[] A03;
    public final int A00;
    public final U8 A01;
    public final int[] A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 108);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-14, 1, 0, -15, 18, 19, 22, 27, 22, 33, 22, 28, 27, 38, 78, 81, 85, 90, 1, 85, 83, 66, 68, 76, 84, 1, 66, 83, 70, 1, 79, 80, 85, 1, 66, 77, 77, 80, 88, 70, 69};
    }

    public WX(U8 u82, int... iArr) {
        this(u82, iArr, 0);
    }

    public WX(U8 u82, int[] iArr, int i5) {
        if (iArr.length == 0) {
            MV.A08(A00(0, 13, 65), A00(13, 28, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), new IllegalArgumentException());
        }
        this.A01 = u82;
        this.A02 = iArr;
        this.A00 = i5;
    }
}
