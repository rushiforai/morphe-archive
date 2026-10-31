package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class D7 implements InterfaceC2511rz {
    public static byte[] A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 6);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{94, 73, 73, 84, 73, 118, 94, 72, 72, 90, 92, 94};
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void ADH() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AE6() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AEd(int i5) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AEz(float f11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AH3(boolean z11) {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AHT() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void AHa(String str) {
        C1h.A09(str, A00(0, 12, 61));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void ALw() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2511rz
    public final void ALx(float f11) {
    }
}
