package com.facebook.ads.redexgen.X;

import android.util.Log;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Gp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C0939Gp implements InterfaceC1527bq {
    public static byte[] A01;
    public final /* synthetic */ C2095lA A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 96);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{109, 79, 64, 9, 90, 14, 74, 71, 93, 94, 79, 90, 77, 70, 14, 77, 65, 91, 64, 90, 75, 92, 93, 0, 6, 43, 49, 50, 35, 54, 33, 42, 39, 38, 98, 33, 45, 55, 44, 54, 39, 48, 49, 108, 98, 16, 39, 49, 50, 45, 44, 49, 39, 120, 98};
    }

    public C0939Gp(C2095lA c2095lA) {
        this.A00 = c2095lA;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1527bq
    public final void AES(InterfaceC1533bw interfaceC1533bw) {
        if (this.A00.A05().AB6() && interfaceC1533bw != null) {
            String str = A00(24, 31, 34) + interfaceC1533bw.A7d();
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1527bq
    public final void AEs(Exception exc) {
        if (this.A00.A05().AB6()) {
            Log.e(C2235nR.A00(), A00(0, 24, 78), exc);
        }
    }
}
