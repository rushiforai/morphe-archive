package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oa, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2303oa {
    A07,
    A06,
    A05,
    A04;

    public static byte[] A00;
    public static final C2302oZ A01;
    public static final /* synthetic */ InterfaceC05640p A02;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 13);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{41, 41, 62, 53, 57, 40, 22, 22, 1, 10, 2, 3, 112, 97, 105, 104};
    }

    static {
        A02();
        A02 = C1q.A01(A03);
        A01 = new C2302oZ(null);
    }

    @JvmStatic
    public static final EnumC2303oa A00(String str) {
        return A01.A00(str);
    }
}
