package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class CE implements InterfaceC2599tP {
    public static byte[] A01;
    public final /* synthetic */ C2141lu A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 79);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-46, -57, -46, -54, -61, -1, -4, -10};
    }

    public CE(C2141lu c2141lu) {
        this.A00 = c2141lu;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGC(String str) {
        C1h.A09(str, A00(5, 3, 59));
        this.A00.A0F = false;
        C2590tG c2590tG = this.A00.A08;
        if (c2590tG != null) {
            c2590tG.setProgress(100);
            AbstractC2426qc.A0P(c2590tG, 8);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGE(String str) throws SecurityException {
        C1h.A09(str, A00(5, 3, 59));
        this.A00.A0F = true;
        C2590tG c2590tG = this.A00.A08;
        if (c2590tG != null) {
            AbstractC2426qc.A0P(c2590tG, 0);
        }
        F8 f82 = this.A00.A07;
        if (f82 != null) {
            f82.setUrl(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGf(int i5) {
        C2590tG c2590tG;
        if (!this.A00.A0F || (c2590tG = this.A00.A08) == null) {
            return;
        }
        c2590tG.setProgress(i5);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGi(String str) {
        C1h.A09(str, A00(0, 5, 15));
        F8 f82 = this.A00.A07;
        if (f82 != null) {
            f82.setTitle(str);
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2599tP
    public final void AGl() {
    }
}
