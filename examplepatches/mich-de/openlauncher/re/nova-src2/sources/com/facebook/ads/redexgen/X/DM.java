package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class DM implements InterfaceC2599tP {
    public static byte[] A01;
    public static String[] A02 = {"F7Dtf", "yrKKUhPgAmWQtTugLXf5romTzOGIkr4i", "MFxH3M8qoqAmph5rwoRldDxySrIuqRTd", "mEXuswXNuIPGWlcWJSJjNKPAHBDwUkar", "myDcTTF", "WMaLOO0F3hvJj3Fd7ikzUtBWoV7z9rGN", "9JvRPXz4tn1bqdAndWp91", "7xBGAbldCAyQ8OMOYxQusefPJAhucKY5"};
    public final /* synthetic */ C06805y A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A02;
            if (strArr[2].charAt(27) != strArr[7].charAt(27)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[2] = "XeYF3RgfNHrT1JZ89Vz9wUhX8yQuABh3";
            strArr2[7] = "28lNng3c8KFswLbFbwN4vJRQbG3uGvHc";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 58);
            if (A02[4].length() != 7) {
                bArrCopyOfRange[i13] = b11;
                i13++;
            } else {
                String[] strArr3 = A02;
                strArr3[0] = "ENd3I";
                strArr3[6] = "Ht2gJAR0v0LdmNnpgk7e8";
                bArrCopyOfRange[i13] = b11;
                i13++;
            }
        }
    }

    public static void A01() {
        A01 = new byte[]{-38, -40, -54, -41, -60, -45, -58, -37, -50, -52, -58, -39, -50, -44, -45, -60, -50, -58, -57};
    }

    static {
        A01();
    }

    public DM(C06805y c06805y) {
        this.A00 = c06805y;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGC(String str) {
        this.A00.A0S = false;
        if (this.A00.A08 != null) {
            this.A00.A08.setProgress(100);
        }
        AbstractC2426qc.A0P(this.A00.A08, 8);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGE(String str) throws SecurityException {
        this.A00.A0S = true;
        AbstractC2426qc.A0P(this.A00.A08, 0);
        if (this.A00.A07 != null) {
            this.A00.A07.setUrl(str);
        }
        if (!this.A00.A0P && this.A00.A02 > 1) {
            this.A00.A0P = true;
            this.A00.A12(A00(0, 19, 43));
        }
        C06805y.A03(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGf(int i5) {
        if (this.A00.A0S && this.A00.A08 != null) {
            this.A00.A08.setProgress(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGi(String str) {
        if (this.A00.A07 != null) {
            this.A00.A07.setTitle(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGl() {
        ((AbstractC0861Do) this.A00).A0D.AEH(14);
    }
}
