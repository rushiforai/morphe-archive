package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class AW extends AbstractC1480b5 {
    public static byte[] A00;
    public static String[] A01 = {"x1upgZXDLUGlAyhy7DGGwHp2l8UXrMJ", "w4M8bIm9HpfoZCMUjb0ePrDqnQtDNqOe", "mEFtUYvTdrtqJkfNbQ3wWQOT4SGkCLD2", "EtX", "rtvu6ekil8Z3VXYvPqhT23y1", "6KzUNTPri9jzm843zU8Zqe2", "qRdKDSfccG8GpccBiRfNcqPjIPY", "bqOt9bcOhX2wBXwn8IPm6Zsnj1RjvZrX"};

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            String[] strArr = A01;
            if (strArr[5].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            A01[3] = "ElNIZYilZdjip";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 68);
            i13++;
        }
    }

    public static void A01() {
        A00 = new byte[]{93, 74, 94, 90, 74, 92, 91, 108, 64, 65, 73, 70, 72, 90, 93, 78, 91, 70, 64, 65};
    }

    static {
        A01();
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AW(String str, C1474az c1474az, C1501bQ c1501bQ) {
        super(str, c1474az, c1501bQ);
        C1h.A09(c1501bQ, A00(0, 20, 107));
        this.A01 = EnumC1481b6.A05;
    }
}
