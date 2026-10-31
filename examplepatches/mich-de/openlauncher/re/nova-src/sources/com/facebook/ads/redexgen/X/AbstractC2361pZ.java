package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.pZ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2361pZ {
    public static byte[] A00;
    public static String[] A01 = {"qlsA4b", "67e9iwzDrWlSyrDJbKSCmibkhy79S6", "PGi2Xb0wv", "J3ucdY8b8p3u3V6sA2PqEAJioQHUL0", "SJ5yf7X3dl1YMLufO1Dqs6IGxXnF", "EpW0UnvJeecOqPtxyPHdBfv9qvjqcM", "7jpxoFlH6T04gMSo5Hymor2x0z0Gqz", "P5sy298PFyff2D1X1NbXkEJYzuYuZ05R"};

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[4].length() == 32) {
                throw new RuntimeException();
            }
            A01[3] = "3CeGKeDXQp3iPDSxma";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 48);
            i13++;
        }
    }

    public static void A02() {
        A00 = new byte[]{53, 50, 62, 61, 120, 115, 120, 79, 65, 78, 35, 32, 43, 44};
    }

    static {
        A02();
    }

    public static String A00(float f11) {
        if (A03(f11)) {
            if (A01[5].length() == 12) {
                throw new RuntimeException();
            }
            A01[2] = "LWaKw2Hdc";
            return A01(10, 4, 42);
        }
        if (A05(f11)) {
            return A01(0, 4, 52);
        }
        if (A04(f11)) {
            return A01(4, 3, Sdk.SDKError.Reason.TPAT_ERROR_VALUE);
        }
        return A01(7, 3, 75);
    }

    public static boolean A03(float f11) {
        return f11 <= 0.7f;
    }

    public static boolean A04(float f11) {
        return f11 == 1.0f;
    }

    public static boolean A05(float f11) {
        return f11 >= 1.2f;
    }
}
