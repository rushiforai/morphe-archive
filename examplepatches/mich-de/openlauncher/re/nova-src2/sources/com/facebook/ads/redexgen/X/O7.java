package com.facebook.ads.redexgen.X;

import android.util.Pair;
import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class O7 {
    public static byte[] A0G;

    @MetaExoPlayerCustomization
    public int A00;

    @MetaExoPlayerCustomization
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public int A06;
    public int A07;
    public int A08;
    public int A09;
    public int A0A;
    public int A0B;

    @MetaExoPlayerCustomization
    public int A0C;
    public int A0D;

    @MetaExoPlayerCustomization
    public int A0E;
    public long A0F;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0G, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A0G = new byte[]{113, 80, 86, 90, 81, 80, 71, 118, 90, 64, 91, 65, 80, 71, 70, 21, 78, 63, 21, 81, 80, 86, 90, 81, 80, 71, 124, 91, 92, 65, 70, 8, 16, 70, 25, 63, 21, 81, 80, 86, 90, 81, 80, 71, 103, 80, 89, 80, 84, 70, 80, 70, 8, 16, 70, 63, 21, 68, 64, 80, 64, 80, 81, 124, 91, 69, 64, 65, 119, 64, 83, 83, 80, 71, 70, 8, 16, 70, 63, 21, 70, 94, 92, 69, 69, 80, 81, 124, 91, 69, 64, 65, 119, 64, 83, 83, 80, 71, 70, 8, 16, 70, 63, 21, 71, 80, 91, 81, 80, 71, 80, 81, 122, 64, 65, 69, 64, 65, 119, 64, 83, 83, 80, 71, 70, 8, 16, 70, 63, 21, 70, 94, 92, 69, 69, 80, 81, 122, 64, 65, 69, 64, 65, 119, 64, 83, 83, 80, 71, 70, 8, 16, 70, 63, 21, 81, 71, 90, 69, 69, 80, 81, 119, 64, 83, 83, 80, 71, 70, 8, 16, 70, 63, 21, 81, 71, 90, 69, 69, 80, 81, 124, 91, 69, 64, 65, 119, 64, 83, 83, 80, 71, 70, 8, 16, 70, 63, 21, 88, 84, 77, 118, 90, 91, 70, 80, 86, 64, 65, 92, 67, 80, 113, 71, 90, 69, 69, 80, 81, 119, 64, 83, 83, 80, 71, 70, 8, 16, 70, 63, 21, 81, 71, 90, 69, 69, 80, 81, 97, 90, 126, 80, 76, 83, 71, 84, 88, 80, 112, 67, 80, 91, 65, 70, 8, 16, 70, 63, 21, 65, 90, 65, 84, 89, 99, 92, 81, 80, 90, 115, 71, 84, 88, 80, 101, 71, 90, 86, 80, 70, 70, 92, 91, 82, 122, 83, 83, 70, 80, 65, 96, 70, 8, 16, 70, 63, 21, 67, 92, 81, 80, 90, 115, 71, 84, 88, 80, 101, 71, 90, 86, 80, 70, 70, 92, 91, 82, 122, 83, 83, 70, 80, 65, 118, 90, 64, 91, 65, 8, 16, 70, 63, 72};
    }

    public final synchronized void A02() {
    }

    @MetaExoPlayerCustomization
    public final void A03(long j11) {
        this.A01 = this.A09 == 0 ? -1 : (int) (j11 / this.A09);
    }

    @MetaExoPlayerCustomization
    public final void A04(Pair<Long, Integer> newSamplePerFrameDecodeTimeAndCount) {
        int i5;
        this.A0C += ((Integer) newSamplePerFrameDecodeTimeAndCount.second).intValue();
        long updatedTotalDecodeTime = ((Long) newSamplePerFrameDecodeTimeAndCount.first).longValue() + (this.A0C * this.A00);
        if (this.A0C == 0) {
            i5 = -1;
        } else {
            long currentTotalDecodeTime = this.A0C;
            i5 = (int) (updatedTotalDecodeTime / currentTotalDecodeTime);
        }
        this.A00 = i5;
    }

    public final String toString() {
        return N1.A0n(A00(0, 333, 75), Integer.valueOf(this.A02), Integer.valueOf(this.A03), Integer.valueOf(this.A08), Integer.valueOf(this.A0A), Integer.valueOf(this.A09), Integer.valueOf(this.A0B), Integer.valueOf(this.A04), Integer.valueOf(this.A05), Integer.valueOf(this.A07), Integer.valueOf(this.A06), Long.valueOf(this.A0F), Integer.valueOf(this.A0D));
    }
}
