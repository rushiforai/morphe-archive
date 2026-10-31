package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class A8 extends AbstractC1345Xg {
    public static byte[] A00;
    public static final XK A01;
    public static final A8 A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 95);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{49, 61, 54, 55, 49, 28, 51, 63, 55, 12, 29, 10, 14, 27, 6, 1, 8, 42, 25, 10, 1, 27, 25, 5, 31, 24, 9, 15};
    }

    static {
        A01();
        A01 = new XK(null);
        A02 = new A8();
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1345Xg
    public final void A06(C1347Xi c1347Xi, int i5) {
        C1h.A09(c1347Xi, A00(9, 13, 48));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1345Xg
    public final void A07(EnumC1346Xh enumC1346Xh, int i5) {
        C1h.A09(enumC1346Xh, A00(22, 6, 53));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1345Xg
    public final void A08(EnumC1346Xh enumC1346Xh, int i5) {
        C1h.A09(enumC1346Xh, A00(22, 6, 53));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1345Xg
    public final void A09(EnumC1346Xh enumC1346Xh, int i5) {
        C1h.A09(enumC1346Xh, A00(22, 6, 53));
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1345Xg
    public final void A0A(boolean z11, String str, EnumC1346Xh enumC1346Xh, int i5) {
        C1h.A09(str, A00(0, 9, 13));
        C1h.A09(enumC1346Xh, A00(22, 6, 53));
    }
}
