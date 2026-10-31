package com.facebook.ads.redexgen.X;

import java.io.IOException;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.bI, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1493bI {
    public static String[] A05 = {"7HPX5QbBl7E5EbUQPcKmEzjWCG4LrmwT", "ygyGCkLJvoZBhmle1B6JVDDau9ImKpku", "DHdl1NsMKs5M8l", "rSeDRL8ka", "MxStOy49MCB4pDgnTOrwxDHe8KkSLg5r", "7C69duVQ4AUme6rB11qfzHoDidqUT7yE", "uwct2hFMWSb4Fkjvm", "vR4EpVshYRBKG4fumVmPB58VuXbddHmx"};
    public int A01;
    public boolean A02;
    public final C1494bJ A04 = new C1494bJ();
    public final C1084Mk A03 = new C1084Mk(new byte[65025], 0);
    public int A00 = -1;

    /* JADX WARN: Incorrect condition in loop: B:4:0x000b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private int A00(int i5) {
        this.A01 = 0;
        int i11 = 0;
        while (i < size) {
            int[] iArr = this.A04.A09;
            int i12 = this.A01;
            int size = i12 + 1;
            this.A01 = size;
            int segmentLength = iArr[i12 + i5];
            i11 += segmentLength;
            if (segmentLength != 255) {
                break;
            }
        }
        return i11;
    }

    public final C1084Mk A01() {
        return this.A03;
    }

    public final C1494bJ A02() {
        return this.A04;
    }

    public final void A03() {
        this.A04.A02();
        this.A03.A0d(0);
        this.A00 = -1;
        this.A02 = false;
    }

    public final void A04() {
        if (this.A03.A0l().length == 65025) {
            return;
        }
        this.A03.A0j(Arrays.copyOf(this.A03.A0l(), Math.max(65025, this.A03.A0A())), this.A03.A0A());
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x0067, code lost:
    
        return false;
     */
    /* JADX WARN: Removed duplicated region for block: B:20:0x005f  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean A05(Q9 q92) throws IOException {
        AbstractC1062Ln.A08(q92 != null);
        if (this.A02) {
            this.A02 = false;
            this.A03.A0d(0);
        }
        while (true) {
            boolean z11 = this.A02;
            String[] strArr = A05;
            if (strArr[1].charAt(21) != strArr[4].charAt(21)) {
                throw new RuntimeException();
            }
            A05[2] = "bWktL1Cb6EOJU2";
            if (z11) {
                return true;
            }
            if (this.A00 < 0) {
                boolean zA03 = this.A04.A03(q92);
                String[] strArr2 = A05;
                if (strArr2[5].charAt(27) == strArr2[0].charAt(27)) {
                    if (!zA03) {
                        break;
                    }
                } else {
                    A05[2] = "dPJCyuH";
                    if (!zA03) {
                        break;
                    }
                    if (!this.A04.A05(q92, true)) {
                        break;
                    }
                    int segmentIndex = 0;
                    int iA00 = this.A04.A01;
                    if ((this.A04.A04 & 1) == 1 && this.A03.A0A() == 0) {
                        iA00 += A00(0);
                        segmentIndex = 0 + this.A01;
                    }
                    if (!AbstractC1385Yx.A02(q92, iA00)) {
                        return false;
                    }
                    this.A00 = segmentIndex;
                }
            }
            int iA002 = A00(this.A00);
            int size = this.A00 + this.A01;
            if (iA002 > 0) {
                this.A03.A0c(this.A03.A0A() + iA002);
                if (!AbstractC1385Yx.A03(q92, this.A03.A0l(), this.A03.A0A(), iA002)) {
                    return false;
                }
                this.A03.A0e(this.A03.A0A() + iA002);
                this.A02 = this.A04.A09[size + (-1)] != 255;
            }
            if (size == this.A04.A02) {
                size = -1;
            }
            this.A00 = size;
        }
    }
}
