package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.List;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.7h, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C07157h extends LA {
    public static byte[] A00 = null;
    public static String[] A01 = {"jMc", "F9KJU5nWCxEJfH1MtrJPQ98rlg2xhqhb", "7jNlYgKw34wypv3TsOCVRM97qni1IFkS", "W5gvHzH3tQhCbbf1Q7sr07NWbFeRHxz0", "QDsxhdyObZs2LD8uuSUlwesP8VUImdt4", "RqkZZA1TQwwc7Sj8gFRGBwQRvCLKOG1p", "3", "FXFS7BhAGvbRYPXLgdilxhgSLH2Ol13Z"};
    public static final long serialVersionUID = 5751287062553772012L;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[0].length() == 16) {
                throw new RuntimeException();
            }
            A01[0] = "basKOcZiobbMvO07tra14WeVIAzrAzDF";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 105);
            i13++;
        }
    }

    public static void A02() {
        A00 = new byte[]{5, -8, 11, 0, 13, -4};
    }

    static {
        A02();
    }

    public C07157h(List<C1735fE> list) {
        super(list);
    }

    public static C07157h A00(JSONObject jSONObject, C0958Hi c0958Hi) {
        C07157h c07157h = new C07157h(LA.A07(jSONObject, c0958Hi, new C1046Kx()));
        c07157h.A3B(jSONObject);
        c07157h.A23(A01(0, 6, 46));
        return c07157h;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1734fD
    public final int A1L() {
        return 0;
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1734fD
    public final int A1M() {
        return 0;
    }
}
