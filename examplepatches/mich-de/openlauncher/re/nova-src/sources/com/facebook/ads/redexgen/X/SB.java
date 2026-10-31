package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public abstract class SB implements InterfaceC1110Nk {
    public static byte[] A00;
    public static final boolean A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 86);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{47, 40, 58, 44, 99, 100, 118, 111, 31, 51, 63, 36, 49, 48};
    }

    /* JADX WARN: Removed duplicated region for block: B:11:0x0038  */
    static {
        boolean z11;
        A01();
        if (A00(8, 6, 8).equals(N1.A05)) {
            if (!A00(4, 4, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE).equals(N1.A06)) {
                if (!A00(0, 4, 56).equals(N1.A06)) {
                    z11 = false;
                }
            }
            z11 = true;
        }
        A01 = z11;
    }
}
