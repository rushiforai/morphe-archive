package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Mo, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1088Mo {
    public static byte[] A02;
    public static String[] A03 = {"vCHHF0VL", "3jhs7ZLAQaLiOcR1w0QDar83", "CFqGzNx98Uzl52VNq0gNyh5DtRfYAist", "PtncAqgLSvtq7typvCVbKSCp", "yQCgbFJV", "Aja6BrCLjMvqZZjZ", "3yHK", "eWIZfSfIhRE6guNZuM"};
    public static final C1088Mo A04;
    public static final C1088Mo A05;
    public final int A00;
    public final int A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            byte b11 = (byte) ((bArrCopyOfRange[i13] - i12) - 119);
            String[] strArr = A03;
            if (strArr[3].length() != strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A03;
            strArr2[0] = "oSPz2SV9";
            strArr2[4] = "gJyS5YCv";
            bArrCopyOfRange[i13] = b11;
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{68};
    }

    static {
        A01();
        A04 = new C1088Mo(-1, -1);
        A05 = new C1088Mo(0, 0);
    }

    public C1088Mo(int i5, int i11) {
        AbstractC1062Ln.A07((i5 == -1 || i5 >= 0) && (i11 == -1 || i11 >= 0));
        this.A01 = i5;
        this.A00 = i11;
    }

    public final int A02() {
        return this.A00;
    }

    public final int A03() {
        return this.A01;
    }

    public final boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C1088Mo)) {
            return false;
        }
        C1088Mo c1088Mo = (C1088Mo) obj;
        return this.A01 == c1088Mo.A01 && this.A00 == c1088Mo.A00;
    }

    public final int hashCode() {
        return this.A00 ^ ((this.A01 << 16) | (this.A01 >>> 16));
    }

    public final String toString() {
        return this.A01 + A00(0, 1, 85) + this.A00;
    }
}
