package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class EM implements InterfaceC2599tP {
    public static byte[] A01;
    public static String[] A02 = {"GwK5", "W0EJGSJ8Qtr9PaYdCpumfSHEZTZTelU7", "5IG6YIVnb7BpewqXPJgKDvskMWVhgNm8", "GDWSiy4NZABrlqrVQkHwWKKRB3pQ", "dnTiYFmeKbhkOsASCAbc9HUO23cG0pXj", "ydUbVp5c1d1aZRIN53xyokPz9dSLQwK9", "vy3f7FkbLRzQH7r4ZdG0ubqAG5HixDSe", "pDpz6sTAZPvJKdSx2oGeaXuATzPUuHLB"};
    public final /* synthetic */ EE A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 105);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{59, 61, 43, 60, 17, 32, 47, 56, 39, 41, 47, 58, 39, 33, 32, 17, 39, 47, 44};
    }

    static {
        A01();
    }

    public EM(EE ee2) {
        this.A00 = ee2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGC(String str) {
        this.A00.A0U = false;
        if (this.A00.A0C != null) {
            this.A00.A0C.setProgress(100);
        }
        AbstractC2426qc.A0P(this.A00.A0C, 8);
        if (this.A00.A0k.A2X()) {
            F4 f42 = this.A00.A0D;
            if (A02[1].charAt(9) == 'r') {
                throw new RuntimeException();
            }
            A02[1] = "RSiC9uyJ8Aa7xb9PtGmz3NdNdT2xHG4R";
            if (f42 != null) {
                String strA1h = this.A00.A0k.A1h();
                if (!TextUtils.isEmpty(strA1h)) {
                    this.A00.A0D.loadUrl(strA1h);
                }
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGE(String str) throws SecurityException {
        this.A00.A0U = true;
        AbstractC2426qc.A0P(this.A00.A0C, 0);
        if (this.A00.A0B != null) {
            this.A00.A0B.setUrl(str);
        }
        if (!this.A00.A0Q && this.A00.A02 > 1) {
            this.A00.A0Q = true;
            EE ee2 = this.A00;
            if (A02[1].charAt(9) == 'r') {
                throw new RuntimeException();
            }
            A02[2] = "wSH8YNGRkLBoj75L73P1MG6Tp8fe4XfJ";
            ee2.A0w(A00(0, 19, 39));
        }
        EE.A02(this.A00);
        String[] strArr = A02;
        if (strArr[6].charAt(5) != strArr[4].charAt(5)) {
            return;
        }
        A02[0] = "xBdI";
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGf(int i5) {
        if (this.A00.A0U && this.A00.A0C != null) {
            this.A00.A0C.setProgress(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGi(String str) {
        if (this.A00.A0B != null) {
            this.A00.A0B.setTitle(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGl() {
        this.A00.A0o.A0C().AEH(14);
    }
}
