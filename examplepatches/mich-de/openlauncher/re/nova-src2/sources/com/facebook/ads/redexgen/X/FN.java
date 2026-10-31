package com.facebook.ads.redexgen.X;

import android.content.pm.PackageManager;
import android.os.RemoteException;
import android.text.TextUtils;
import java.util.Arrays;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public class FN implements InterfaceC1887hj {
    public static byte[] A01;
    public static String[] A02 = {"rZwndJ5YzzmsdsNhiHxvAOJjq2sxbe9t", "RkF4SaRDWudpc56miHcF0mDs9kMlwswK", "I8myD22VdNPedRbWDcImqFFkAjoMCztJ", "BCOnBQvF7H72SAoRAqG0tO64SwejJ4wi", "bl0f7q2xn0qMgYN6TWJzuwvEvgS4y93", "k", "DFzPLyG", "QaWmGJycT2M31yJz329h5fucH2Zy48t5"};
    public final /* synthetic */ FM A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 98);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-71, -44, -36, -33, -40, -41, -109, -25, -30, -109, -33, -30, -44, -41, -109, -29, -33, -44, -20, -44, -43, -33, -40, -109, -42, -30, -31, -25, -40, -31, -25, -70, -42, -53, -29, -53, -52, -42, -49, -85, -50, -35, -64, -45, -49, -31, -9, 0, 3, -2, -14, 5, 31, 29, 15, 28, 13, 22, 19, 13, 21, 55, 42, 37, 38, 48, 32, 37, 54, 51, 34, 53, 42, 48, 47, 8, -5, -9, 9, -15, 6, 11, 2, -9};
    }

    static {
        A01();
    }

    public FN(FM fm) {
        this.A00 = fm;
    }

    public /* synthetic */ FN(FM fm, FQ fq2) {
        this(fm);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AEY() throws PackageManager.NameNotFoundException, RemoteException {
        this.A00.A0i(true, A00(52, 9, 72));
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AFD() {
        if (this.A00.A03 != EnumC2491rf.A03) {
            if (!TextUtils.isEmpty(this.A00.A0N.A37())) {
                Map<String, String> mapA07 = new C2618ti().A05(this.A00.A0Y.getViewabilityChecker()).A04(this.A00.A0Y.getTouchDataRecorder()).A07();
                mapA07.put(A00(46, 6, 47), this.A00.A0N.A1c());
                mapA07.put(A00(61, 14, 95), String.valueOf(this.A00.A0N.A1I()));
                if (this.A00.A0Q.A0F().AA8() != null) {
                    mapA07.put(A00(75, 9, 48), this.A00.A0Q.A0F().AA8().name());
                }
                this.A00.A0R.AC7(this.A00.A0N.A37(), mapA07);
                C2328oz.A00(this.A00.A0Q).A0E(this.A00.A0W.A9O(), this.A00.A0N.A37());
                C1750fT.A07(this.A00.A0N.A33(), this.A00.A0Q);
                AbstractC1813gU.A02(this.A00.A0N.A1Z(), AbstractC2401qD.A00(this.A00.A0N.A1c()));
                this.A00.A0Q.A0F().A3h();
            }
            this.A00.A0V.A5C(this.A00.A0W.A8s());
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AFk() {
        C1903hz c1903hz = new C1903hz(-1L, A00(31, 15, 8), A00(0, 31, 17));
        if (this.A00.A0O.A0d() || this.A00.A0O.A0g()) {
            this.A00.A0X.A0C(c1903hz);
        } else {
            FM fm = this.A00;
            String[] strArr = A02;
            if (strArr[2].charAt(12) == strArr[0].charAt(12)) {
                A02[4] = "Cg0ZWKnQXkCXtdR";
                fm.A0X.A0B(c1903hz);
            }
            throw new RuntimeException();
        }
        if (this.A00.A0O.A0g()) {
            this.A00.A0a.set(true);
            return;
        }
        FM fm2 = this.A00;
        if (A02[3].charAt(7) == 'F') {
            A02[4] = "BRhEUAyV5GJd";
            fm2.A0Y();
            return;
        }
        throw new RuntimeException();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AFm() {
        this.A00.A0X.A0B(null);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AGV() {
        this.A00.A0X.A0C(null);
        this.A00.AGF(false);
        this.A00.A0Y.A0E(8);
        this.A00.A0Q.A0F().AGM();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1887hj
    public final void AHt() {
        this.A00.A0V.AEH(15);
    }
}
