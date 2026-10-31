package com.facebook.ads.redexgen.X;

import android.content.Context;
import java.util.Arrays;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.oY, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2301oY {
    public static byte[] A00;
    public static final C2301oY A01;

    static {
        A02();
        A01 = new C2301oY();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 36);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{-30, -14, -17, -9, -13, -27, -14, -44, -7, -16, -27, -70, -58, -59, -53, -68, -49, -53};
    }

    @JvmStatic
    public static final EnumC2299oW A00(EnumC2303oa enumC2303oa, Context context) {
        C1h.A09(enumC2303oa, A01(0, 11, 92));
        C1h.A09(context, A01(11, 7, 51));
        switch (C2300oX.A00[enumC2303oa.ordinal()]) {
            case 1:
                return EnumC2299oW.A04;
            case 2:
                return A03(context) ? EnumC2299oW.A03 : EnumC2299oW.A05;
            case 3:
                return A03(context) ? EnumC2299oW.A03 : EnumC2299oW.A04;
            case 4:
                return EnumC2299oW.A05;
            default:
                throw new AnonymousClass28();
        }
    }

    @JvmStatic
    public static final boolean A03(Context context) {
        C1h.A09(context, A01(11, 7, 51));
        return IO.A00(context) == 0;
    }
}
