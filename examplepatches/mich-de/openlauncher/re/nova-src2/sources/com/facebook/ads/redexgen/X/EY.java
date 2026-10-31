package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class EY implements InterfaceC2599tP {
    public static byte[] A01;
    public static String[] A02 = {"BdhBL09M4Kf5pZVFq3hu", "RvApnOP5TrfSVKNiPYUqrJes", "fe7XFV8kXqba2R6pM5eLN8KkTFIqEiwl", "blbqgiQJp6cs", "NwOGI73VJjSa3U5NpZL78Ksqq7LFe", "B8ngslNEnR5wDlhREJljtiUu", "QAhn6ShnFRB2OsCPxSM", "0DHDykPyyqwhMMlodysb3VmSPsGurPgY"};
    public final /* synthetic */ ET A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 10);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{76, 74, 92, 75, 102, 87, 88, 79, 80, 94, 88, 77, 80, 86, 87, 102, 80, 88, 91};
    }

    static {
        A01();
    }

    public EY(ET et2) {
        this.A00 = et2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGC(String str) {
        this.A00.A0U = false;
        this.A00.setBrowserProgressBarValue(100);
        AbstractC2426qc.A0P(this.A00.A0H, 8);
        if (this.A00.A0E.A2X() && this.A00.A0I != null) {
            String strA1h = this.A00.A0E.A1h();
            if (!TextUtils.isEmpty(strA1h)) {
                this.A00.A0I.loadUrl(strA1h);
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGE(String str) throws SecurityException {
        this.A00.A0U = true;
        AbstractC2426qc.A0P(this.A00.A0H, 0);
        this.A00.setUrlToBrowser(str);
        if (!this.A00.A0R && this.A00.A01 > 1) {
            this.A00.A0R = true;
            this.A00.A0h(A00(0, 19, 51));
        }
        ET.A03(this.A00);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGf(int i5) {
        if (this.A00.A0U) {
            ET et2 = this.A00;
            String[] strArr = A02;
            if (strArr[6].length() == strArr[3].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[2] = "QY4HeEjZ5INYif1SeRyocKWTC9N0iQjQ";
            strArr2[7] = "IhWprrJJT2Yl4c8tLv2o4taD3peu2qkx";
            et2.setBrowserProgressBarValue(i5);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGi(String str) {
        this.A00.setTitleToBrowser(str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGl() {
        this.A00.A0J.A0C().AEH(14);
    }
}
