package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Xh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC1346Xh {
    A03,
    A04;

    public static byte[] A00;
    public static final /* synthetic */ InterfaceC05640p A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{15, 17, 4, 0, 11, 11, 14, 2, 0, 19, 4, -1, -14, -5, -15, -14, -1, -14, -1};
    }

    static {
        A01();
        A01 = C1q.A01(A02);
    }
}
