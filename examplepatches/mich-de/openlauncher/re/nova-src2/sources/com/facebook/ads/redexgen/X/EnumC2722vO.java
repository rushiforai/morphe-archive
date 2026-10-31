package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.vO, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2722vO {
    A05,
    A06,
    A04;

    public static byte[] A00;
    public static String[] A01 = {"D152H60LDBo1XA0LKxgrpfLc9gxh7YFB", "3CEc5B3EKtwM", "tf5KmfSOCP3sj5BBxwm9vD", "nyc14MiKihVX8xqCa1O8AYBb4nlYjuB6", "gq9u5hr4it32AU8V3kIUKa5nb4llnE9I", "xnWpFCJLa8g8vIhMmnC4MA1hIPUrJ69y", "WAV5OyrbtNSby8pfG6OlQAS3kavD6ZMz", "Lnm0Af8qlP49mRX6EdU58"};
    public static final /* synthetic */ InterfaceC05640p A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[1].length() == strArr[3].length()) {
                throw new RuntimeException();
            }
            A01[7] = "FADVGLwpg2vwvvsJyvEQ5";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 123);
            i13++;
        }
    }

    public static void A01() {
        byte[] bArr = {-17, -28, -15, -25, -10, -26, -28, -13, -24, 2, -10, -26, -11, -24, -24, -15, -10, -21, -14, -9, -10, -18, -17, -18, -27, 0, -1, 2, 4, 2, -15, -7, 4, 15, 3, -13, 2, -11, -11, -2, 3, -8, -1, 4, 3};
        if (A01[7].length() != 21) {
            throw new RuntimeException();
        }
        A01[7] = "r4MRfu9HCIqutXRInlnyK";
        A00 = bArr;
    }

    static {
        A01();
        A02 = C1q.A01(A03);
    }
}
