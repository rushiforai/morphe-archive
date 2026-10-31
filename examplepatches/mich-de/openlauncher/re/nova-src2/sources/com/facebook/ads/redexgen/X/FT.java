package com.facebook.ads.redexgen.X;

import android.content.pm.PackageManager;
import android.os.RemoteException;
import android.text.TextUtils;
import java.util.Arrays;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public class FT implements InterfaceC1887hj {
    public static byte[] A01;
    public final /* synthetic */ FS A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 95);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{14, 7, 26, 5, 9, 28, 1, 7, 17, 6, 23, 24, 29, 23, 31, 106, 117, 120, 121, 115, 67, 120, 105, 110, 125, 104, 117, 115, 114, 46, 49, 61, 47, 7, 44, 33, 40, 61};
    }

    public FT(FS fs2) {
        this.A00 = fs2;
    }

    public /* synthetic */ FT(FS fs2, FZ fz2) {
        this(fs2);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AEY() throws PackageManager.NameNotFoundException, RemoteException {
        this.A00.A0W(true, A00(6, 9, 43));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AFD() {
        if (!this.A00.A0f) {
            if (!TextUtils.isEmpty(this.A00.A0O.A37())) {
                Map<String, String> mapA07 = new C2618ti().A05(this.A00.A0B.getViewabilityChecker()).A04(this.A00.A0B.getTouchDataRecorder()).A07();
                mapA07.put(A00(0, 6, 55), this.A00.A0O.A1c());
                mapA07.put(A00(15, 14, 67), String.valueOf(this.A00.A0O.A1I()));
                if (this.A00.A0R.A0F().AA8() != null) {
                    mapA07.put(A00(29, 9, 7), this.A00.A0R.A0F().AA8().name());
                }
                this.A00.A0S.AC7(this.A00.A0O.A37(), mapA07);
                C2328oz.A00(this.A00.A0R).A0E(this.A00.A0X.A9O(), this.A00.A0O.A37());
                C1750fT.A07(this.A00.A0O.A33(), this.A00.A0R);
                AbstractC1813gU.A02(this.A00.A0O.A1Z(), AbstractC2401qD.A00(this.A00.A0O.A1c()));
                this.A00.A0R.A0F().A3h();
                if (this.A00.A0P.A0h()) {
                    this.A00.A0R.A0F().AFV();
                }
            }
            this.A00.A0W.A5C(this.A00.A0X.A8s());
            return;
        }
        this.A00.A0R.A0F().AFW();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AFk() {
        this.A00.A0W.A5C(this.A00.A0X.A8c());
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AFm() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AGV() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AHt() {
        this.A00.A0W.AEH(15);
    }
}
