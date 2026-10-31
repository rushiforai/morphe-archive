package com.facebook.ads.redexgen.X;

import com.facebook.ads.AudienceNetworkAds;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class HV extends AbstractRunnableC2319oq {
    public static byte[] A02;
    public final /* synthetic */ AudienceNetworkAds.InitListener A00;
    public final /* synthetic */ C0957Hh A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 8);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{91, 108, 99, 40, 123, 125, 107, 107, 109, 123, 123, 110, 125, 100, 100, 113, 40, 97, 102, 97, 124, 97, 105, 100, 97, 114, 109, 108, 41};
    }

    public HV(C0957Hh c0957Hh, AudienceNetworkAds.InitListener initListener) {
        this.A01 = c0957Hh;
        this.A00 = initListener;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        try {
            HG.A02().A0C(this.A01);
        } catch (Throwable th2) {
            this.A01.A08().A4j(th2);
        }
        C2150m4.A0C(this.A01);
        if (this.A00 == null) {
            return;
        }
        C2150m4.A04(this.A00, new C2149m3(true, A00(0, 29, 0)));
    }
}
