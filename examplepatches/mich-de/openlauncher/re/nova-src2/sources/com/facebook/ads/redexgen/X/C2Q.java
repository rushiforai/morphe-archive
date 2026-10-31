package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.2Q, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C2Q {
    public static C2Q A01;
    public static byte[] A02;
    public static String[] A03 = {"VI8hjgkCTuK0gegCOSLm2M5yBQFUyzp6", "vI6SSNmjSdM4taa", "DsALIhQqAk", "aECPGBCOnLh2MFi", "LRwXB4r1b3NkZcuSMUlDWuGAyqmqt4w0", "vcji5ievxfJLSgIp0MzAXEU6thWbwSAk", "wPlf8HhZ63u03oFRZwjDKzOoWqKpi2cr", "nSZqyTbkmK06R5E30Mm40RRLxTjzDRiB"};
    public static final C2R A04;
    public final boolean A00;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] - i12;
            String[] strArr = A03;
            if (strArr[0].charAt(11) != strArr[6].charAt(11)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[7] = "Kuz1u4n4V82mdvem0Ds6wxMhr7Dx0xQQ";
            strArr2[5] = "A734f6wDuJDGFpzm0G05rZVOtk77GwEz";
            bArrCopyOfRange[i13] = (byte) (i14 - 21);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{-30, -13, -24, -12, -67, -81, -83, -66, -77, -71, -72, -104, -85, -73, -81};
    }

    static {
        A01();
        A04 = new C2R(null);
        A01 = new C2Q();
    }

    public final void A02(String str) {
        C1h.A09(str, A00(4, 11, 53));
    }

    public final void A03(String str, String[] strArr) {
        C1h.A09(str, A00(4, 11, 53));
        C1h.A09(strArr, A00(0, 4, 108));
        A02(str);
    }

    public final boolean A04() {
        return this.A00;
    }
}
