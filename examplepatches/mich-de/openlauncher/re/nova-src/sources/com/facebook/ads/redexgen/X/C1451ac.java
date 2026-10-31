package com.facebook.ads.redexgen.X;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.ac, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1451ac {
    public static byte[] A03;
    public static String[] A04 = {"Vs06DC9LHlP6nyu6Er7ul", "jn2l57RtHEsBzWvf", "sK4KgX9TYmFIqf4rNQDI4", "mbkGbmAZhWCeA1cnyzo8UhyYoFRvOSTP", "33xs35lHLZRpHyyr", "7pUFieMu9", "ApWal8vdP111uvOqJz2mkeUtKmBZZfpN", "4x5wKXs3ZKwzqSUsfKBflT081d"};
    public static final long[] A05;
    public int A00;
    public int A01;
    public final byte[] A02 = new byte[8];

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] - i12;
            String[] strArr = A04;
            if (strArr[1].length() != strArr[4].length()) {
                throw new RuntimeException();
            }
            A04[7] = "22rUvuXjwgyrpPKYGMZNZI1h4r";
            bArrCopyOfRange[i13] = (byte) (i14 - 34);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A03() {
        A03 = new byte[]{-19, 14, -65, 21, 0, 11, 8, 3, -65, 21, 0, 17, 8, 13, 19, -65, 11, 4, 13, 6, 19, 7, -65, 12, 0, 18, 10, -65, 5, 14, 20, 13, 3};
    }

    static {
        A03();
        A05 = new long[]{128, 64, 32, 16, 8, 4, 2, 1};
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static int A00(int i5) {
        for (int i11 = 0; i11 < varIntLength; i11++) {
            if ((A05[i11] & i5) != 0) {
                return i11 + 1;
            }
        }
        return -1;
    }

    public static long A01(byte[] bArr, int i5, boolean z11) {
        long j11 = bArr[0] & 255;
        if (z11) {
            long varint = ~A05[i5 - 1];
            j11 &= varint;
        }
        for (int i11 = 1; i11 < i5; i11++) {
            long varint2 = bArr[i11];
            j11 = (j11 << 8) | (varint2 & 255);
        }
        return j11;
    }

    public final int A04() {
        return this.A00;
    }

    public final long A05(Q9 q92, boolean z11, boolean z12, int i5) throws IOException {
        if (this.A01 == 0) {
            if (!q92.AIe(this.A02, 0, 1, z11)) {
                if (A04[7].length() != 26) {
                    throw new RuntimeException();
                }
                A04[7] = "1gfFMCzlWRYZYIL0Sl6pryqlN6";
                return -1L;
            }
            int firstByte = this.A02[0] & 255;
            this.A00 = A00(firstByte);
            if (this.A00 != -1) {
                this.A01 = 1;
            } else {
                throw new IllegalStateException(A02(0, 33, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE));
            }
        }
        int firstByte2 = this.A00;
        if (firstByte2 > i5) {
            this.A01 = 0;
            return -2L;
        }
        if (this.A00 != 1) {
            q92.readFully(this.A02, 1, this.A00 - 1);
        }
        this.A01 = 0;
        return A01(this.A02, this.A00, z12);
    }

    public final void A06() {
        this.A01 = 0;
        this.A00 = 0;
    }
}
