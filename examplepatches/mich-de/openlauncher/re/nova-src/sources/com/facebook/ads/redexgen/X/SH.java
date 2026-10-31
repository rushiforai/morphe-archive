package com.facebook.ads.redexgen.X;

import java.math.RoundingMode;

/* loaded from: assets/audience_network/classes.dex */
public final class SH implements R4 {
    public static String[] A06 = {"vVoc5jcdJe2LFOFlAirLALNERYvZ", "DPCZBvkIhTWcn2GI8rqdpX8BFDsy3eq4", "HiiLLUtP6tI8QxYT4tmnS0JrICDK6dk7", "fBHaVoXc674rH5GSwFfIC1ARKs84JuJK", "6OtP1Rm2JuYqTNiTJGDHmmDJE1qpGXzT", "gX0MsemDdUduU6ozFSe6nLCHbSkQOWJi", "oYgRL2moXUWAzw8fTfKC6KPOnPaR16wM", "iHkxWo"};
    public final int A00;
    public final int A01;
    public final int A02;
    public final int A03;
    public final int A04;
    public final int A05;

    public SH(RE re2) {
        this.A02 = re2.A02;
        this.A01 = re2.A01;
        this.A05 = re2.A05;
        this.A04 = re2.A04;
        this.A03 = re2.A03;
        this.A00 = re2.A00;
    }

    public static int A00(int i5) {
        switch (i5) {
            case 5:
                return 80000;
            case 6:
            case 18:
                if (A06[7].length() == 8) {
                    throw new RuntimeException();
                }
                A06[2] = "uPw02FGMQS2L9yJBYxI8Noq2zCvZ632B";
                return 768000;
            case 7:
                return 192000;
            case 8:
                return 2250000;
            case 9:
                return 40000;
            case 10:
                return 100000;
            case 11:
                return 16000;
            case 12:
                return 7000;
            case 13:
            case 19:
            default:
                throw new IllegalArgumentException();
            case 14:
                return 3062500;
            case 15:
                return 8000;
            case 16:
                return 256000;
            case 17:
                return 336000;
            case 20:
                return 63750;
        }
    }

    private final int A01(int i5) {
        int iA00 = A00(i5);
        int maxByteRate = this.A03;
        return AnonymousClass19.A02((maxByteRate * iA00) / 1000000);
    }

    private final int A02(int i5, int i11) {
        int bufferSizeUs;
        int i12 = this.A04;
        if (i5 == 5) {
            int bufferSizeUs2 = this.A00;
            i12 *= bufferSizeUs2;
        }
        if (i11 != -1) {
            bufferSizeUs = C3E.A00(i11, 8, RoundingMode.CEILING);
        } else {
            bufferSizeUs = A00(i5);
        }
        return AnonymousClass19.A02((i12 * bufferSizeUs) / 1000000);
    }

    public static int A03(int i5, int i11, int i12) {
        return AnonymousClass19.A02(((i5 * i11) * i12) / 1000000);
    }

    private final int A04(int i5, int i11, int i12) {
        int maxAppBufferSize = this.A05 * i5;
        int targetBufferSize = this.A02;
        int minAppBufferSize = A03(targetBufferSize, i11, i12);
        int targetBufferSize2 = this.A01;
        return N1.A07(maxAppBufferSize, minAppBufferSize, A03(targetBufferSize2, i11, i12));
    }

    private final int A05(int i5, int i11, int i12, int i13, int i14, int i15) {
        switch (i12) {
            case 0:
                return A04(i5, i14, i13);
            case 1:
                return A01(i11);
            case 2:
                return A02(i11, i15);
            default:
                throw new IllegalArgumentException();
        }
    }

    @Override // com.facebook.ads.redexgen.X.R4
    public final int A7f(int i5, int i11, int i12, int i13, int i14, int i15, double d5) {
        int bufferSize = A05(i5, i11, i12, i13, i14, i15);
        return (((Math.max(i5, (int) (bufferSize * d5)) + i13) - 1) / i13) * i13;
    }
}
