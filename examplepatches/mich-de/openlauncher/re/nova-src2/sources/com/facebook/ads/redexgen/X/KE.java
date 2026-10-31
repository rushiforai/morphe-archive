package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public class KE implements InterfaceC1723f2 {
    public static byte[] A07;
    public static String[] A08 = {"NdU3dTBV9vpPy6YybD2Qky8Xp9oiymUK", "iGXlqhzjj4re98AW13mRmUxQt0ip7heY", "i4JUsV98mtHDxTx4GI", "uX4rqc35PVKyGMlab4Ievks4AeXTKuCR", "rLO13ppjW7wMy", "YX8F9O1K3gbo5OniWABn3Un2bmHHQded", "vQnjhTu4uDmsPPd6tCmWM2PRV3nZ7tVA", "6doRqStA7fW6oocsKlayDSgQ6jqa5ScM"};
    public final /* synthetic */ long A03;
    public final /* synthetic */ C07117d A04;
    public final /* synthetic */ C2143lw A05;
    public final /* synthetic */ Runnable A06;
    public boolean A02 = false;
    public boolean A01 = false;
    public boolean A00 = false;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A07, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 102);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A07 = new byte[]{57, 46, 46, 51, 46, 67, 93, 73};
    }

    static {
        A01();
    }

    public KE(C07117d c07117d, Runnable runnable, long j11, C2143lw c2143lw) {
        this.A04 = c07117d;
        this.A06 = runnable;
        this.A03 = j11;
        this.A05 = c2143lw;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1723f2
    public final void AFz(C1056Lh c1056Lh) {
        if (!this.A00) {
            this.A00 = true;
            this.A04.A05(this.A05.A03(EnumC2147m0.A03), null);
        }
        if (this.A04.A07 != null) {
            this.A04.A07.A0C();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1723f2
    public final void AG0(C1056Lh c1056Lh) {
        if (c1056Lh != this.A04.A00) {
            return;
        }
        this.A04.A0G().removeCallbacks(this.A06);
        this.A04.A01 = c1056Lh;
        this.A04.A07.A0F(c1056Lh);
        if (!this.A02) {
            this.A02 = true;
            this.A04.A05(this.A05.A03(EnumC2147m0.A05), this.A04.A01(this.A03));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1723f2
    public final void AG1(C1056Lh c1056Lh) {
        if (!this.A01) {
            this.A01 = true;
            C07117d c07117d = this.A04;
            C2143lw c2143lw = this.A05;
            EnumC2147m0 enumC2147m0 = EnumC2147m0.A04;
            String[] strArr = A08;
            if (strArr[3].charAt(16) != strArr[0].charAt(16)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A08;
            strArr2[3] = "w5hMaJohNUScvyTMb6YchiksjKW7iU2S";
            strArr2[0] = "lwejxTPFHVjkcDrib15s3w6szJ9sWeR6";
            c07117d.A05(c2143lw.A03(enumC2147m0), null);
        }
        this.A04.A0N();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1723f2
    public final void AG3(C1056Lh c1056Lh, C2262nt c2262nt) {
        if (c1056Lh != this.A04.A00) {
            return;
        }
        this.A04.A0G().removeCallbacks(this.A06);
        this.A04.A0P(c1056Lh);
        if (!this.A02) {
            this.A02 = true;
            Map mapA01 = this.A04.A01(this.A03);
            mapA01.put(A00(0, 5, 58), String.valueOf(c2262nt.A03().getErrorCode()));
            mapA01.put(A00(5, 3, 72), String.valueOf(c2262nt.A04()));
            this.A04.A05(this.A05.A03(EnumC2147m0.A05), mapA01);
        }
        this.A04.AEr(c2262nt);
    }
}
