package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@MetaExoPlayerCustomization
/* loaded from: assets/audience_network/classes.dex */
public final class PF extends AbstractC1455ag {
    public static byte[] A03;
    public final long A00;
    public final List<PF> A01;
    public final List<PE> A02;

    static {
        A01();
    }

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A03, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 80);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A03 = new byte[]{-67, 0, 12, 11, 17, -2, 6, 11, 2, 15, 16, -41, -67, -35, 41, 34, 30, 51, 34, 48, -9, -35};
    }

    public PF(int i5, long j11) {
        super(i5);
        this.A00 = j11;
        this.A02 = new ArrayList();
        this.A01 = new ArrayList();
    }

    public final PF A02(int i5) {
        int size = this.A01.size();
        for (int i11 = 0; i11 < size; i11++) {
            PF pf2 = this.A01.get(i11);
            int childrenSize = ((AbstractC1455ag) pf2).A00;
            if (childrenSize == i5) {
                return pf2;
            }
        }
        return null;
    }

    public final PE A03(int i5) {
        int size = this.A02.size();
        for (int i11 = 0; i11 < size; i11++) {
            PE pe2 = this.A02.get(i11);
            int childrenSize = ((AbstractC1455ag) pe2).A00;
            if (childrenSize == i5) {
                return pe2;
            }
        }
        return null;
    }

    public final void A04(PF pf2) {
        this.A01.add(pf2);
    }

    public final void A05(PE pe2) {
        this.A02.add(pe2);
    }

    @Override // com.facebook.ads.redexgen.X.AbstractC1455ag
    public final String toString() {
        return AbstractC1455ag.A04(super.A00) + A00(13, 9, 109) + Arrays.toString(this.A02.toArray()) + A00(0, 13, 77) + Arrays.toString(this.A01.toArray());
    }
}
