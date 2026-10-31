package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class FQ implements InterfaceC2004je {
    public static byte[] A01;
    public final /* synthetic */ FM A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 94);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-11, -2, 1, 5, -9, -15, 0, -13, 8, -15, -12, -13, 4};
    }

    public FQ(FM fm) {
        this.A00 = fm;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2004je
    public final boolean AAw() {
        if (this.A00.A0K) {
            if (this.A00.A0d.getToolbarActionMode() == 1) {
                this.A00.A0d.setToolbarActionMode(2);
                this.A00.A0Y();
            } else {
                int toolbarActionMode = this.A00.A0d.getToolbarActionMode();
                String strA00 = A00(0, 13, 52);
                if (toolbarActionMode == 0) {
                    this.A00.A0X.A0D(strA00);
                    this.A00.A0S.A04(EnumC2231nN.A07, null);
                    this.A00.A0V.A5C(this.A00.A0W.A8X());
                } else if (this.A00.A0C != null && this.A00.A0C.A0h()) {
                    this.A00.A0X.A0D(strA00);
                    this.A00.A0S.A04(EnumC2231nN.A07, null);
                    this.A00.A0V.A5C(this.A00.A0W.A8X());
                }
            }
            return true;
        }
        return false;
    }
}
