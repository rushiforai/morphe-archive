package com.facebook.ads.redexgen.X;

import android.net.Uri;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.eV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract /* synthetic */ class AbstractC1691eV {
    public static byte[] A00;

    static {
        A03();
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 4);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A00 = new byte[]{31, 2, 21, 37, 22, 31, 20, 16, 13, 26, 42, 7, 16, 17, 28, 7};
    }

    public static long A00(InterfaceC1692eW interfaceC1692eW) {
        return interfaceC1692eW.A7H(A02(0, 7, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), -1L);
    }

    public static Uri A01(InterfaceC1692eW interfaceC1692eW) {
        String strA7J = interfaceC1692eW.A7J(A02(7, 9, 113), null);
        if (strA7J == null) {
            return null;
        }
        return Uri.parse(strA7J);
    }
}
