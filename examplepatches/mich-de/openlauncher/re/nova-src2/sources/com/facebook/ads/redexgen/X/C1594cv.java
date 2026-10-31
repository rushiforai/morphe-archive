package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.List;

/* renamed from: com.facebook.ads.redexgen.X.cv, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1594cv {
    public static byte[] A02;
    public final List<VC> A00;
    public final ZP[] A01;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 74);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{-2, 35, 43, 22, 33, 30, 25, -43, 24, 33, 36, 40, 26, 25, -43, 24, 22, 37, 41, 30, 36, 35, -43, 34, 30, 34, 26, -43, 41, 46, 37, 26, -43, 37, 39, 36, 43, 30, 25, 26, 25, -17, -43, -68, -53, -53, -57, -60, -66, -68, -49, -60, -54, -55, -118, -66, -64, -68, -120, -111, -117, -109, -50, -35, -35, -39, -42, -48, -50, -31, -42, -36, -37, -100, -48, -46, -50, -102, -92, -99, -91};
    }

    public C1594cv(List<VC> list) {
        this.A00 = list;
        this.A01 = new ZP[list.size()];
    }

    public final void A02(long j11, C1084Mk c1084Mk) {
        AbstractC1377Yp.A03(j11, c1084Mk, this.A01);
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0004 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void A03(InterfaceC1384Yw interfaceC1384Yw, C1601d2 c1601d2) {
        for (int i5 = 0; i5 < i; i5++) {
            c1601d2.A05();
            ZP zpALm = interfaceC1384Yw.ALm(c1601d2.A03(), 3);
            VC vc = this.A00.get(i5);
            String str = vc.A0W;
            AbstractC1062Ln.A09(A00(43, 19, 17).equals(str) || A00(62, 19, 35).equals(str), A00(0, 43, 107) + str);
            C1029Ke c1029KeA11 = new C1029Ke().A0y(vc.A0T != null ? vc.A0T : c1601d2.A04()).A11(str);
            int i11 = vc.A0H;
            C1029Ke c1029KeA10 = c1029KeA11.A0n(i11).A10(vc.A0V);
            int i12 = vc.A03;
            zpALm.A7E(c1029KeA10.A0Z(i12).A12(vc.A0X).A14());
            this.A01[i5] = zpALm;
        }
    }
}
