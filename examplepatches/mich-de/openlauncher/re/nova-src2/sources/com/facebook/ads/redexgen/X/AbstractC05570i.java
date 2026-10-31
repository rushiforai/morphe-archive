package com.facebook.ads.redexgen.X;

import java.util.Arrays;
import kotlin.Metadata;

@Metadata
/* renamed from: com.facebook.ads.redexgen.X.0i, reason: invalid class name and case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC05570i extends AbstractC05761b {
    public static byte[] A00;

    static {
        A02();
    }

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 26);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A00 = new byte[]{61, -122, -112, 61, -119, -126, -112, -112, 61, -111, -123, 126, -117, 61, -118, -122, -117, -122, -118, -110, -118, 61, 117, -109, -96, -96, -95, -90, 82, -107, -95, -105, -92, -107, -105, 82, -88, -109, -98, -89, -105, 82, -90, -95, 82, -109, -96, 82, -105, -97, -94, -90, -85, 82, -92, -109, -96, -103, -105, 108, 82, -97, -109, -86, -101, -97, -89, -97, 82};
    }

    public static final long A00(long j11, long j12, long j13) {
        if (j12 <= j13) {
            return j11 < j12 ? j12 : j11 > j13 ? j13 : j11;
        }
        throw new IllegalArgumentException(A01(22, 47, 24) + j13 + A01(0, 22, 3) + j12 + '.');
    }
}
