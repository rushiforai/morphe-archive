package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public class DE extends AbstractC1540c3 {
    public static byte[] A01;
    public final /* synthetic */ D8 A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 86);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{47, 56, 59, 54, 42, 61, 14, 1, -4, -3, 7, -9, -4, 13, 10, -7, 12, 1, 7, 6, 43, 30, 26, 44, 20, 41, 46, 37, 26};
    }

    public DE(D8 d82) {
        this.A00 = d82;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        if (!this.A00.A08.A07()) {
            this.A00.A08.A05();
            if (!TextUtils.isEmpty(this.A00.A03.A37())) {
                Map<String, String> mapA07 = new C2618ti().A05(this.A00.A0C).A04(this.A00.A08).A06(this.A00.A03.A1b()).A07();
                mapA07.put(A00(0, 6, 115), this.A00.A03.A1c());
                mapA07.put(A00(6, 14, 66), String.valueOf(this.A00.A03.A1I()));
                if (this.A00.A05.A0F().AA8() != null) {
                    mapA07.put(A00(20, 9, 95), this.A00.A05.A0F().AA8().name());
                }
                this.A00.A06.AC7(this.A00.A03.A37(), mapA07);
                if (this.A00.A03.A2m()) {
                    this.A00.A05.A0F().AFZ();
                }
                C2328oz.A00(this.A00.A05).A0E(this.A00.A0B.A9O(), this.A00.A03.A37());
                C1750fT.A07(this.A00.A03.A33(), this.A00.A05);
                this.A00.A05.A0F().A3h();
                AbstractC1813gU.A02(this.A00.A03.A1Z(), AbstractC2401qD.A00(this.A00.A03.A1c()));
                this.A00.A0A.A5C(this.A00.A0B.A8s());
            }
        }
    }
}
