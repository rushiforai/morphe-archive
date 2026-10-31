package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.o7, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2275o7 {
    A07(A01(55, 10, 58)),
    A06(A01(52, 3, 63)),
    A05(A01(39, 13, 72)),
    A08(A01(65, 13, 37));

    public static byte[] A01;
    public static final C2276o8 A02;
    public static final /* synthetic */ InterfaceC05640p A03;
    public final String A00;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 22);
        }
        return new String(bArrCopyOfRange);
    }

    public static InterfaceC05640p<EnumC2275o7> A02() {
        return A03;
    }

    public static void A03() {
        A01 = new byte[]{69, 70, 84, 78, 68, 88, 70, 87, 87, 88, 70, 67, 84, 55, 35, 50, 125, 113, 109, 112, 126, 103, 96, 96, 119, 118, 9, 14, 21, 8, 31, 5, 27, 10, 10, 5, 27, 30, 9, 60, 63, 45, 55, 61, 1, 63, 46, 46, 1, 63, 58, 45, 77, 89, 72, 67, 79, 115, 78, 64, 89, 94, 94, 73, 72, 64, 71, 92, 65, 86, 108, 82, 67, 67, 108, 82, 87, 64};
    }

    static {
        A03();
        A03 = C1q.A01(A04);
        A02 = new C2276o8(null);
    }

    EnumC2275o7(String str) {
        this.A00 = str;
    }

    @JvmStatic
    public static final EnumC2275o7 A00(String str) {
        return A02.A02(str);
    }

    public final String A05() {
        return this.A00;
    }
}
