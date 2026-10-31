package com.facebook.ads.redexgen.X;

import com.facebook.ads.NativeAdBase;
import java.util.Arrays;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.nc, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public enum EnumC2246nc {
    A05(0, NativeAdBase.MediaCacheFlag.NONE),
    A04(1, NativeAdBase.MediaCacheFlag.ALL);

    public static byte[] A02;
    public final long A00;
    public final NativeAdBase.MediaCacheFlag A01;

    public static String A01(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A02, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 111);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A02() {
        A02 = new byte[]{70, 75, 75, 34, 35, 34, 41};
    }

    static {
        A02();
    }

    EnumC2246nc(long j11, NativeAdBase.MediaCacheFlag mediaCacheFlag) {
        this.A00 = j11;
        this.A01 = mediaCacheFlag;
    }

    @Nullable
    public static EnumC2246nc A00(NativeAdBase.MediaCacheFlag mediaCacheFlag) {
        for (EnumC2246nc enumC2246nc : values()) {
            if (enumC2246nc.A01 == mediaCacheFlag) {
                return enumC2246nc;
            }
        }
        return null;
    }
}
