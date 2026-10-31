package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public final class HQ implements InterfaceC1534bx {
    public static byte[] A01;
    public final C0957Hh A00;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 127);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A01 = new byte[]{-2, -45, -20, -24, -45, -10, 21, 21, 18, -45, -8, 21, 27, 26, 15, 20, 13, -45, -6, 21, 17, 11, 20, 102, 100, 86, 99, 30, 82, 88, 86, 95, 101};
    }

    public HQ(C0957Hh c0957Hh) {
        this.A00 = c0957Hh;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1534bx
    public final Map<String, String> A7G(boolean z11) {
        HashMap map = new HashMap();
        if (!AbstractC2063kb.A00().A04()) {
            map.put(A00(0, 23, 39), C2165mJ.A00().A01(this.A00, true).A04());
        }
        map.put(A00(23, 10, 114), AbstractC2168mM.A06(new C2137lq(this.A00), this.A00, z11));
        return map;
    }
}
