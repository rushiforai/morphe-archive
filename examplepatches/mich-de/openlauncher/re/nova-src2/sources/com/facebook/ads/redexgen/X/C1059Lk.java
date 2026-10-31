package com.facebook.ads.redexgen.X;

import com.facebook.ads.internal.protocol.AdErrorType;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Lk, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1059Lk implements InterfaceC2078kr {
    public static byte[] A04;
    public final /* synthetic */ InterfaceC1716ev A00;
    public final /* synthetic */ C07247q A01;
    public final /* synthetic */ C7D A02;
    public final /* synthetic */ C2481rV A03;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A04, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 17);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A04 = new byte[]{57, 30, 22, 19, 26, 27, 95, 11, 16, 95, 27, 16, 8, 17, 19, 16, 30, 27, 95, 30, 95, 18, 26, 27, 22, 30, 81};
    }

    public C1059Lk(C07247q c07247q, C2481rV c2481rV, InterfaceC1716ev interfaceC1716ev, C7D c7d) {
        this.A01 = c07247q;
        this.A03 = c2481rV;
        this.A00 = interfaceC1716ev;
        this.A02 = c7d;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEJ() {
        AdErrorType adErrorType = AdErrorType.CACHE_FAILURE_ERROR;
        String strA00 = A00(0, 27, 110);
        this.A02.A0F().A3j(C2416qS.A01(this.A01.A00), adErrorType.getErrorCode(), strA00);
        this.A00.AFQ(this.A01, C2262nt.A01(adErrorType, strA00));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2078kr
    public final void AEU() {
        this.A03.A0J();
        this.A00.AE9(this.A01, this.A03);
        this.A02.A0F().A4p(this.A01.A01 != null);
    }
}
