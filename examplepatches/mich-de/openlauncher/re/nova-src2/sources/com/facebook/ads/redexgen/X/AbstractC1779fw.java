package com.facebook.ads.redexgen.X;

import com.facebook.ads.AdError;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.fw, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1779fw {
    public static byte[] A00;
    public static String[] A01 = {"kdNZsDbIr2FjUgQ6", "G4tbE8YXKkBHtbRzjHgF1iVs8BhQX3ki", "rgsd1nh14jUfY0oEDkCzVbJlkUwrdBXO", "6d8i19T6TQ9xRiUYh6SOmARBfT83lkdi", "2FsjHYpAfMpiihTdUse", "xtyrzkpFCSmXtl0pVvZtRxgukiiALNOU", "PnjWz3Ubzat8tEiN6RTB47L4MZQANY1H", "IONaBzwOxfylvpW8Ch"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[6].charAt(12) != strArr[5].charAt(12)) {
                break;
            }
            A01[2] = "wyIfRhN1EoOdsBbK5VRzuRP5Lc7uqmgb";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 100);
            if (A01[0].length() == 15) {
                break;
            }
            String[] strArr2 = A01;
            strArr2[3] = "fUzr4JaNgjTtoWHz8k6HkVts9HpSP1Qi";
            strArr2[1] = "zuQx1GaumRIGoFj6MrcQJkCLkICnzrhi";
            bArrCopyOfRange[i13] = b11;
            i13++;
        }
        throw new RuntimeException();
    }

    public static void A01() {
        A00 = new byte[]{-88, -30, -18, -25, -26, -31, -26, -20, -35, -22, -21, -20, -31, -20, -31, -39, -28};
    }

    static {
        A01();
    }

    public static void A02(C0958Hi c0958Hi, LA la2, boolean z11, InterfaceC1777fu interfaceC1777fu) {
        if (!C2203mv.A2E(c0958Hi)) {
            C2086kz c2086kz = new C2086kz(c0958Hi);
            C1758fb c1758fbA07 = la2.A32().A0I().A07();
            c2086kz.A0e(new C2232nO(la2.A37(), c0958Hi.A0A()));
            if (c1758fbA07 == null) {
                interfaceC1777fu.AGK(AdError.CACHE_ERROR);
                return;
            }
            if (c1758fbA07.A0d()) {
                interfaceC1777fu.AGL();
                if (A01[2].charAt(7) != '1') {
                    throw new RuntimeException();
                }
                A01[0] = "84TqyqDRqUmJCVM8";
                return;
            }
            C2082kv c2082kv = new C2082kv(c1758fbA07.A0M(), la2.A1r(), la2.A1c());
            c2082kv.A04 = true;
            c2082kv.A03 = A00(0, 5, 22);
            switch (C1776ft.A00[c1758fbA07.A0G().ordinal()]) {
                case 1:
                case 2:
                    c2086kz.A0Y(c2082kv);
                    break;
            }
            c2086kz.A0c(new C2084kx(la2.A35().A01(), -1, -1, la2.A1r(), la2.A1c()));
            c2086kz.A0c(new C2084kx(c1758fbA07.A0L(), -1, -1, la2.A1r(), la2.A1c()));
            AbstractC1774fr.A00(la2, c2086kz, A00(5, 12, 20));
            c2086kz.A0X(new KS(c0958Hi, interfaceC1777fu, c2086kz, c1758fbA07, z11), new C2079ks(la2.A1r(), la2.A1c()));
            return;
        }
        interfaceC1777fu.AGL();
    }
}
