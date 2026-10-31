package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.protocol.AdErrorType;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class KK extends AbstractRunnableC2319oq {
    public static byte[] A03;
    public InterfaceC1708en A00;
    public String A01;
    public final /* synthetic */ C07137f A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 2);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{105, -116, -119, -104, -100, -115, -102, 72, -100, -111, -107, -115, -105, -99, -100, 86};
    }

    public KK(C07137f c07137f, InterfaceC1708en interfaceC1708en, String str) {
        this.A02 = c07137f;
        this.A00 = interfaceC1708en;
        this.A01 = str;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractRunnableC2319oq
    public final void A07() {
        this.A02.A0U(this.A01);
        this.A02.A0P(this.A00);
        this.A02.AEr(new C2262nt(AdErrorType.NETWORK_ERROR, A00(0, 16, 38)));
    }
}
