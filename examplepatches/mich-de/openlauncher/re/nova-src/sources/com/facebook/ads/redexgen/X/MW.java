package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class MW {
    public static byte[] A02;
    public static String[] A03 = {"n75oYGFtTuGt2YJaCez2YbXfKlRn3vY9", "Hf0r08oLMm8RX", "qHu3e7WEGyARpnInFf5oGKXaypsG6w4V", "fhLP6kjmi5Gj1MqqNE0k4MnQT6IGLVD6", "N1fKv13", "qBI1Ust2gVyUXax5EpDE0loBHoBPs7GC", "3nQQ7LAdDtlLNQI7eZ5AXwCigqn4NxNo", "W8B22LYFohqQsOaA3iJ1CURzmZTfsGj4"};
    public int A00;
    public long[] A01;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 24);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A02 = new byte[]{107, 95, -78, -88, -71, -92, 95, -88, -78, 95, -32, 5, 13, -8, 3, 0, -5, -73, 0, 5, -5, -4, 15, -73};
    }

    static {
        A01();
    }

    public MW() {
        this(32);
    }

    public MW(int i5) {
        this.A01 = new long[i5];
    }

    public final int A02() {
        return this.A00;
    }

    public final long A03(int i5) {
        if (i5 >= 0 && i5 < this.A00) {
            return this.A01[i5];
        }
        throw new IndexOutOfBoundsException(A00(10, 14, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) + i5 + A00(0, 10, 39) + this.A00);
    }

    public final void A04(long j11) {
        if (this.A00 == this.A01.length) {
            this.A01 = Arrays.copyOf(this.A01, this.A00 * 2);
        }
        long[] jArr = this.A01;
        int i5 = this.A00;
        this.A00 = i5 + 1;
        jArr[i5] = j11;
        if (A03[1].length() == 6) {
            throw new RuntimeException();
        }
        A03[3] = "b7q39rG5ZVH5MtiYGPDltqUaSTW5SWPr";
    }

    public final long[] A05() {
        return Arrays.copyOf(this.A01, this.A00);
    }
}
