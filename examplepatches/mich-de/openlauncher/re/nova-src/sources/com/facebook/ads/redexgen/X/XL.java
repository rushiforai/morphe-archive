package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import java.util.EnumMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.JvmStatic;

@Metadata
/* loaded from: assets/audience_network/classes.dex */
public final class XL {
    public static byte[] A00;
    public static String[] A01 = {"0jExEk3vUyUPDq2mXs9i7CjDAbMzMZ1V", "N2n5XiOjQGU5khKoAGptGx4mwB0u8DRu", "resp06pXrpgrV6CIpEQDGv5j1qPgZGdx", "NMJj0cg3gGeCUywRgatE5qc85hbhTF7H", "WmMiqOFk", "tPnLiNRq1Ash1dzEMf1RNf7rxIM2vZlD", "a2DU8xzS9MiI9kTeMeBg6CGRquwdJWvb", "qCwF4vW7JFuDlchxEU53PHpfD0dNOWKs"};
    public static final XL A02;
    public static final Map<XQ, Boolean> A03;
    public static final Map<XP, Integer> A04;
    public static final Map<XO, Long> A05;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        int i13 = 0;
        while (true) {
            int length = bArrCopyOfRange.length;
            if (A01[4].length() != 8) {
                throw new RuntimeException();
            }
            A01[0] = "Wxb8869CUA3PW7Pka76CxSNnrhCrgYel";
            if (i13 >= length) {
                return new String(bArrCopyOfRange);
            }
            int i14 = (bArrCopyOfRange[i13] - i12) - 127;
            String[] strArr = A01;
            if (strArr[7].charAt(29) == strArr[5].charAt(29)) {
                throw new RuntimeException();
            }
            String[] strArr2 = A01;
            strArr2[1] = "NXEgAqXZpHN6WJo4cWO5I5jR2jnCkkNq";
            strArr2[3] = "N52oFcNKMlMo0DuF5mHkzzMPiX7VPgn1";
            bArrCopyOfRange[i13] = (byte) i14;
            i13++;
        }
    }

    public static void A02() {
        byte[] bArr = {-13, 6, 18, 22, 10, 19, 6, 5, -63, 23, 2, 13, 22, 6, -63, 24, 2, 20, -63, 15, 22, 13, 13, -49, 37, 32, 23, 34, 17, 20, 21, -7, 20, 21, 30, 36, 25, 22, 25, 21, 34};
        String[] strArr = A01;
        if (strArr[1].charAt(0) != strArr[3].charAt(0)) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[1] = "NmsikXUzAO8QGJXdreecvw5A7J7m0GR9";
        strArr2[3] = "NdfzphoOqiw5xnhYShAlCS4F0fmh1hmh";
        A00 = bArr;
    }

    static {
        A02();
        A02 = new XL();
        A03 = new EnumMap(XQ.class);
        A04 = new EnumMap(XP.class);
        A05 = new EnumMap(XO.class);
        for (XQ xq2 : XQ.values()) {
            A03.put(xq2, false);
        }
        for (XP xp2 : XP.values()) {
            A04.put(xp2, -1);
        }
        for (XO xo2 : XO.values()) {
            A05.put(xo2, -1L);
        }
        A03.put(XQ.A0f, true);
        A03.put(XQ.A0V, true);
        A03.put(XQ.A2M, true);
        A03.put(XQ.A1a, true);
        A04.put(XP.A06, 100);
    }

    @JvmStatic
    public static final int A00(XP xp2) {
        C1h.A09(xp2, A01(24, 17, 49));
        Integer num = A04.get(xp2);
        if (num != null) {
            return num.intValue();
        }
        throw new IllegalStateException(A01(0, 24, 34).toString());
    }

    @JvmStatic
    public static final boolean A03(XQ xq2) {
        C1h.A09(xq2, A01(24, 17, 49));
        return C1h.A0C(true, A03.get(xq2));
    }
}
