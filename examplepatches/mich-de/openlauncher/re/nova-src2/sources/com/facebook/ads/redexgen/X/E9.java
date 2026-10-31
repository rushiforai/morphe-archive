package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public class E9 extends AbstractC1540c3 {
    public static byte[] A01;
    public final /* synthetic */ C6U A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 65);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-28, -19, -16, -21, -33, -14, 5, -8, -13, -12, -2, -18, -13, 4, 1, -16, 3, -8, -2, -3, 40, 27, 23, 41, 17, 38, 43, 34, 23};
    }

    public E9(C6U c6u) {
        this.A00 = c6u;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        if (!this.A00.A0D.A07()) {
            this.A00.A0D.A05();
            Map<String, String> mapA07 = new C2618ti().A05(this.A00.A0J).A04(this.A00.A0D).A07();
            mapA07.put(A00(0, 6, 61), this.A00.A08.A1c());
            mapA07.put(A00(6, 14, 78), String.valueOf(this.A00.A08.A1I()));
            if (this.A00.A09.A0F().AA8() != null) {
                mapA07.put(A00(20, 9, 113), this.A00.A09.A0F().AA8().name());
            }
            this.A00.A0A.AC7(this.A00.A08.A37(), mapA07);
            C2328oz.A00(this.A00.A09).A0E(this.A00.A0F.A9O(), this.A00.A08.A37());
            C1750fT.A07(this.A00.A08.A33(), this.A00.A09);
            this.A00.A09.A0F().A3h();
            AbstractC1813gU.A02(this.A00.A08.A1Z(), AbstractC2401qD.A00(this.A00.A08.A1c()));
            if (this.A00.A0E != null) {
                this.A00.A0E.A5C(this.A00.A0F.A8s());
            }
        }
    }
}
