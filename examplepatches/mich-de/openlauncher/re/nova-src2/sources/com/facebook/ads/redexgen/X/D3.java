package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class D3 implements InterfaceC2451r1 {
    public static byte[] A01;
    public final /* synthetic */ D2 A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 43);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-89, -97, -99, -92};
    }

    public D3(D2 d22) {
        this.A00 = d22;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2451r1
    public final void ADh(AbstractC2452r2 abstractC2452r2) {
        if (abstractC2452r2.getToolbarActionMode() == 8 && this.A00.A04 != null) {
            this.A00.A0F.A04(EnumC2231nN.A0Y, null);
            LA laA2z = this.A00.A0A.A2z(this.A00.A00 - 1);
            if (!laA2z.A3K() || !laA2z.A32().A0U() || !this.A00.A0A.A2M()) {
                this.A00.A04.A1a(A00(0, 4, 9));
            } else {
                this.A00.A04.A1e();
            }
            this.A00.A0G();
            return;
        }
        this.A00.A0E();
    }
}
