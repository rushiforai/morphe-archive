package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.3S, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public final class C3S extends AbstractC06093e {
    public static byte[] A00;
    public static String[] A01 = {"TB3w", "A6vQw3N0vI6qCYn8umiCCWw7EEW5", "jhudRQwL", "VsLv9h3htjMp3pv", "sSJ8pC", "Yus348b0XK65C7Y", "AQ5cSW3HhZZpAb6Cwtui8tsxRbQsPCp9", "lLw0OBgM5QBnJzCi"};
    public static final A7 A02;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] - i12;
            String[] strArr = A01;
            if (strArr[0].length() == strArr[4].length()) {
                throw new RuntimeException();
            }
            A01[7] = "D2GoC68isE8fqKLx";
            bArrCopyOfRange[i13] = (byte) (i14 - 75);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A00 = new byte[]{-77, -40, -47, -30, -67, -47, -28, -45, -40, -43, -30, -98, -34, -33, -34, -43, -104, -103};
        String[] strArr = A01;
        if (strArr[0].length() == strArr[4].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[2] = "YQD1ADm9";
        strArr2[1] = "k98w40brX9MhaPvc3hWHAkkWhOwy";
    }

    static {
        A01();
        A02 = new C3S();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public C3S() {
        final String strA00 = A00(0, 18, 37);
        new AbstractC06424m(strA00) { // from class: com.facebook.ads.redexgen.X.3e
            public final String A00;

            {
                this.A00 = (String) AbstractC1335Wu.A04(strA00);
            }

            public final String toString() {
                return this.A00;
            }
        };
    }

    @Override // com.facebook.ads.redexgen.X.A7
    public final int A08(CharSequence sequence, int start) {
        int length = sequence.length();
        AbstractC1335Wu.A01(start, length);
        return -1;
    }

    @Override // com.facebook.ads.redexgen.X.A7
    public final boolean A09(char c11) {
        return false;
    }
}
