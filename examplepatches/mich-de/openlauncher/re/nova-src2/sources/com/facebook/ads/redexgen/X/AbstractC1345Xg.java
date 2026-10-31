package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.Xg, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1345Xg {
    public static byte[] A00;

    static {
        A04();
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 70);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A00 = new byte[]{7, 19, 8, 9, 7, -14, 5, 17, 9, -44, -48, -42, -45, -60, -58};
    }

    public abstract void A06(C1347Xi c1347Xi, int i5);

    public abstract void A07(EnumC1346Xh enumC1346Xh, int i5);

    public abstract void A08(EnumC1346Xh enumC1346Xh, int i5);

    public abstract void A09(EnumC1346Xh enumC1346Xh, int i5);

    public abstract void A0A(boolean z11, String str, EnumC1346Xh enumC1346Xh, int i5);

    private final long A02() {
        return AA.A00().ADW();
    }

    public final C1347Xi A05(boolean z11, String str, EnumC1346Xh enumC1346Xh) {
        C1h.A09(str, A03(0, 9, 94));
        C1h.A09(enumC1346Xh, A03(9, 6, 27));
        return new C1347Xi(A02(), z11, str, enumC1346Xh);
    }
}
