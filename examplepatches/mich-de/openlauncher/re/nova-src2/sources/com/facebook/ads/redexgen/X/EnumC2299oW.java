package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2299oW {
    A05,
    A03,
    A04;

    public static byte[] A00;
    public static final /* synthetic */ InterfaceC05640p A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 23);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{53, 35, 37, 34, 57, 59, 41, 53, 62, 36, 57, 59, 51, 41, 34, 55, 52, 107, 97, 107, 108, 125, 117, 103, 122, 106, 119, 111, 107, 125, 106, 35, 49, 54, 34, 61, 49, 35};
    }

    static {
        A01();
        A01 = C1q.A01(A02);
    }
}
