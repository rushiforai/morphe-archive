package com.facebook.ads.redexgen.X;

import android.content.pm.PackageManager;
import android.os.RemoteException;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class FP implements InterfaceC2369ph {
    public static byte[] A01;
    public final /* synthetic */ FM A00;

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
        A01 = new byte[]{-84, -64, -65, -70, -82, -73, -76, -82, -74};
    }

    public FP(FM fm) {
        this.A00 = fm;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() throws PackageManager.NameNotFoundException, RemoteException {
        if (!this.A00.A0G && !this.A00.A0E) {
            this.A00.A0i(false, A00(0, 9, 48));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
    }
}
