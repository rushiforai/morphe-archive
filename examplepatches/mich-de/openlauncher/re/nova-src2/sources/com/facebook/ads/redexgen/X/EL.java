package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class EL implements InterfaceC2734va {
    public static byte[] A01;
    public static String[] A02 = {"l0xk5w0SVxXUr9nW65hoR123JEdRmzl5", "TYQOdbYkKEjvx0Xtiu6MXet0lYEwTh8W", "kPcWfh3XDspVZTILh2s3sdDa8325pHcu", "8Q4vC66VLOErVbGrt", "lQEsWNKl6Ne29IedZ2wSYIqnHknigywW", "RhBGncBhH8rRV8h1fmVe8pmsUKLcBX53", "K", "23iAyGscovhy5rsOMvPB5IYbQPfkYkHH"};
    public final /* synthetic */ EE A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 119);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{53, 51, 37, 50, 31, 46, 33, 54, 41, 39, 33, 52, 41, 47, 46, 31, 41, 33, 34};
    }

    static {
        A01();
    }

    public EL(EE ee2) {
        this.A00 = ee2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2734va
    public final void AEL() {
        this.A00.A0p.A00(this.A00.A0g);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2734va
    public final void AEM() {
        this.A00.A0p.A01(this.A00.A0g);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2734va
    public final void AG5() {
        this.A00.A0U = false;
        if (this.A00.A0C != null) {
            this.A00.A0C.setProgress(100);
        }
        AbstractC2426qc.A0P(this.A00.A0C, 8);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2734va
    public final void AGE(String str) throws SecurityException {
        this.A00.A0U = true;
        AbstractC2426qc.A0P(this.A00.A0C, 0);
        if (this.A00.A0B != null) {
            this.A00.A0B.setUrl(str);
        }
        EE ee2 = this.A00;
        if (A02[0].charAt(6) != '0') {
            throw new RuntimeException();
        }
        A02[0] = "OkaYWs0lzotGebFzgpaLwllpV4Kjrb2y";
        if (!ee2.A0Q && this.A00.A02 > 1) {
            this.A00.A0Q = true;
            this.A00.A0w(A00(0, 19, 73));
        }
        EE.A02(this.A00);
    }
}
