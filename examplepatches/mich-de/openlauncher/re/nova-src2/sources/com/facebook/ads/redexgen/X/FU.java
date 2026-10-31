package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class FU implements InterfaceC2369ph {
    public static byte[] A01;
    public static String[] A02 = {"XQ6pDaA1rZEM", "XoeGOYiSv0w2M1U1qXC2kK0WxpTFbq6C", "goNPtYs5sZFfNSJyOgs171oDuCl7t69H", "IBRmsKraW8ihcuaNuynFKjmRlH", "udOMyB", "k9bLdXox5SSCuqwZoRmzAy5kJm", "rLCACxpviKCtWgunDsmekf59Ef0kXw8R", "IiDilnQTvcIperbA6lCpmy3utrrmGEhT"};
    public final /* synthetic */ FS A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 68);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-32, -8, -22, -24, -8, -30};
    }

    static {
        A01();
    }

    public FU(FS fs2) {
        this.A00 = fs2;
    }

    public /* synthetic */ FU(FS fs2, FZ fz2) {
        this(fs2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() {
        this.A00.A0g.setToolbarActionMessage(A00(0, 0, 7));
        this.A00.A0I();
        if (this.A00.A0d && this.A00.A0X()) {
            this.A00.A0g.setToolbarActionMode(1);
        } else {
            this.A00.A0g.setToolbarActionMode(0);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
        float fA04;
        this.A00.A0Q((int) f11);
        if (this.A00.A0e) {
            if (this.A00.A0J) {
                fA04 = 1.0f - (f11 / this.A00.A0O.A32().A0I().A03());
                if (this.A00.A0M || fA04 < 1.0f) {
                    this.A00.A0M = false;
                    String strA07 = this.A00.A0O.A36().A07();
                    String[] strArr = A02;
                    if (strArr[1].charAt(20) != strArr[6].charAt(20)) {
                        throw new RuntimeException();
                    }
                    String[] strArr2 = A02;
                    strArr2[0] = "16sMGD3KF8iI";
                    strArr2[5] = "yItCOMUcMHVXea4ql8lykvs7qx";
                    this.A00.A0g.setToolbarActionMessage(strA07.replace(A00(0, 6, 65), String.valueOf((int) f11)));
                } else {
                    this.A00.A0M = true;
                    this.A00.A0g.setToolbarActionMessage(A00(0, 0, 7));
                }
            } else {
                fA04 = 1.0f - (f11 / this.A00.A0O.A32().A0I().A04());
            }
            this.A00.A0g.setProgress(100.0f * fA04);
            float fA03 = this.A00.A0O.A32().A0I().A03() - f11;
            float percentageOfReward = this.A00.A0O.A32().A0I().A04();
            boolean z11 = fA03 >= percentageOfReward;
            if (!this.A00.A0M && z11) {
                this.A00.A0g.setToolbarActionMode(1);
                return;
            }
            return;
        }
        this.A00.A0g.setProgress(100.0f * (1.0f - (f11 / this.A00.A0P.A0C())));
    }
}
