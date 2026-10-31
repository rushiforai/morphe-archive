package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;

@MetaExoPlayerCustomization
/* renamed from: com.facebook.ads.redexgen.X.ag, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1455ag {
    public static byte[] A01;

    @MetaExoPlayerCustomization
    public static final int A02;
    public final int A00;

    public static String A05(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 105);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A06() {
        A01 = new byte[]{52, 33, 32, 108};
    }

    static {
        A06();
        A02 = N1.A0D(A05(0, 4, 37));
    }

    public AbstractC1455ag(int i5) {
        this.A00 = i5;
    }

    public static int A02(int i5) {
        return 16777215 & i5;
    }

    public static int A03(int i5) {
        return (i5 >> 24) & 255;
    }

    public static String A04(int i5) {
        return A05(0, 0, 17) + ((char) ((i5 >> 24) & 255)) + ((char) ((i5 >> 16) & 255)) + ((char) ((i5 >> 8) & 255)) + ((char) (i5 & 255));
    }

    public String toString() {
        return A04(this.A00);
    }
}
