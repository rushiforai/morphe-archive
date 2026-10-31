package com.facebook.ads.redexgen.X;

import android.content.pm.PackageManager;
import android.os.RemoteException;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public class FW implements InterfaceC2369ph {
    public static byte[] A01;
    public final /* synthetic */ FS A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 97);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{108, 120, 121, 98, 110, 97, 100, 110, 102};
    }

    public FW(FS fs2) {
        this.A00 = fs2;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AET() throws PackageManager.NameNotFoundException, RemoteException {
        if (!this.A00.A0H && !this.A00.A0G) {
            this.A00.A0W(false, A00(0, 9, 108));
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2369ph
    public final void AGb(float f11) {
    }
}
