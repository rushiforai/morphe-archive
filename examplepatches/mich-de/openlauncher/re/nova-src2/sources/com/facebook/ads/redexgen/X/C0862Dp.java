package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;
import java.util.Map;

/* renamed from: com.facebook.ads.redexgen.X.Dp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0862Dp extends AbstractC1540c3 {
    public static byte[] A01;
    public final /* synthetic */ AbstractC0861Do A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 51);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{90, 88, 75, 86, 76, 74, 92, 85, 102, 79, 11, 64, 75, 66, 74, 77, 70, 71, 124, 66, 71, 124, 74, 77, 71, 70, 91, 27, 18, 15, 16, 28, 9, 75, 77, 74, 90, 27, 4, 9, 8, 2, 50, 9, 24, 31, 12, 25, 4, 2, 3, 6, 25, 21, 7, 47, 4, 9, 0, 21};
    }

    public C0862Dp(AbstractC0861Do abstractC0861Do) {
        this.A00 = abstractC0861Do;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1540c3
    public final void A03() {
        if (!this.A00.A0C.A07()) {
            this.A00.A0C.A05();
            if (!TextUtils.isEmpty(this.A00.A08.A37())) {
                Map<String, String> mapA07 = new C2618ti().A05(this.A00.A0F).A04(this.A00.A0C).A06(this.A00.A08.A1b()).A07();
                mapA07.put(A00(27, 6, 78), this.A00.A08.A1c());
                mapA07.put(A00(37, 14, 94), String.valueOf(this.A00.A08.A1I()));
                if (this.A00.A01) {
                    mapA07.put(A00(11, 16, 16), A00(0, 0, 11) + this.A00.A07);
                }
                if (this.A00.A09.A0F().AA8() != null) {
                    mapA07.put(A00(51, 9, 67), this.A00.A09.A0F().AA8().name());
                }
                if (this.A00.A08.A39().size() > 1 && this.A00.A08.A2K()) {
                    mapA07.put(A00(0, 11, 10), A00(33, 4, 12));
                }
                this.A00.A0A.AC7(this.A00.A08.A37(), mapA07);
                C2328oz.A00(this.A00.A09).A0E(this.A00.A0E.A9O(), this.A00.A08.A37());
                C1750fT.A07(this.A00.A08.A33(), this.A00.A09);
                this.A00.A09.A0F().A3h();
                if (!this.A00.A04) {
                    AbstractC1813gU.A02(this.A00.A08.A1Z(), AbstractC2401qD.A00(this.A00.A08.A1c()));
                }
                if (!this.A00.A05) {
                    this.A00.A0D.A5C(this.A00.A0E.A8s());
                }
            }
        }
    }
}
