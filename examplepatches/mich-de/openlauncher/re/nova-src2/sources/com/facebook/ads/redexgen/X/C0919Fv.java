package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Fv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0919Fv implements InterfaceC2603tT {
    public static byte[] A01;
    public final /* synthetic */ C0917Ft A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 27);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-62, -64, -78, -65, -84, -81, -62, -77, -77, -78, -65, -78, -79, -84, -80, -71, -74, -80, -72, -84, -74, -82, -81, -84, -78, -59, -63, -78, -65, -69, -82, -71, -84, -69, -82, -61, -74, -76, -82, -63, -74, -68, -69};
    }

    public C0919Fv(C0917Ft c0917Ft) {
        this.A00 = c0917Ft;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2603tT
    public final void AEP() {
        this.A00.A0H();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2603tT
    public final void AG4() {
        this.A00.A0K(A00(0, 43, 50));
    }
}
