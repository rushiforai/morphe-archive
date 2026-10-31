package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Wa, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1316Wa {
    public final int A00;
    public final RY A01;
    public final int[] A02;
    public final int[] A03;
    public final RY[] A04;
    public final String[] A05;
    public final int[][][] A06;

    public C1316Wa(String[] strArr, int[] iArr, RY[] ryArr, int[] iArr2, int[][][] iArr3, RY ry2) {
        this.A05 = strArr;
        this.A03 = iArr;
        this.A04 = ryArr;
        this.A06 = iArr3;
        this.A02 = iArr2;
        this.A01 = ry2;
        this.A00 = iArr.length;
    }

    private final int A00(int i5, int i11, int i12) {
        return this.A06[i5][i11][i12];
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0007 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private final int A01(int i5, int i11, int[] iArr) {
        int i12 = 0;
        int iMin = 16;
        boolean z11 = false;
        String str = null;
        int i13 = 0;
        while (i13 < handledTrackCount) {
            int adaptiveSupport = iArr[i13];
            String firstSampleMimeType = this.A04[i5].A05(i11).A08(adaptiveSupport).A0W;
            int adaptiveSupport2 = i12 + 1;
            if (i12 == 0) {
                str = firstSampleMimeType;
            } else {
                z11 = (!N1.A1E(str, firstSampleMimeType)) | z11;
            }
            iMin = Math.min(iMin, PX.A01(this.A06[i5][i11][i13]));
            i13++;
            i12 = adaptiveSupport2;
        }
        if (z11) {
            int handledTrackCount = this.A02[i5];
            return Math.min(iMin, handledTrackCount);
        }
        return iMin;
    }

    public final int A02() {
        return this.A00;
    }

    public final int A03(int i5) {
        return this.A03[i5];
    }

    public final int A04(int i5, int i11, int i12) {
        return PX.A03(A00(i5, i11, i12));
    }

    public final int A05(int i5, int i11, boolean z11) {
        int i12 = this.A04[i5].A05(i11).A01;
        int[] iArr = new int[i12];
        int i13 = 0;
        for (int trackIndexCount = 0; trackIndexCount < i12; trackIndexCount++) {
            int iA04 = A04(i5, i11, trackIndexCount);
            if (iA04 == 4 || (z11 && iA04 == 3)) {
                int trackCount = i13 + 1;
                iArr[i13] = trackIndexCount;
                i13 = trackCount;
            }
        }
        int trackCount2 = A01(i5, i11, Arrays.copyOf(iArr, i13));
        return trackCount2;
    }

    public final RY A06() {
        return this.A01;
    }

    public final RY A07(int i5) {
        return this.A04[i5];
    }
}
