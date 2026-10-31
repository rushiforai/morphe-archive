package com.bytedance.sdk.openadsdk.tn;

import java.util.Arrays;

/* loaded from: classes2.dex */
public final class zb {

    /* renamed from: dj, reason: collision with root package name */
    private int[] f27087dj;
    private int sya;
    private int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private int f27088zb;

    public zb(int i5, int i11) {
        if (i5 <= 0 || i11 <= 0) {
            throw new IllegalArgumentException("Both dimensions must be greater than 0");
        }
        this.ycx = i5;
        this.f27088zb = i11;
        int i12 = (i5 + 31) / 32;
        this.sya = i12;
        this.f27087dj = new int[i12 * i11];
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof zb)) {
            return false;
        }
        zb zbVar = (zb) obj;
        return this.ycx == zbVar.ycx && this.f27088zb == zbVar.f27088zb && this.sya == zbVar.sya && Arrays.equals(this.f27087dj, zbVar.f27087dj);
    }

    public int hashCode() {
        int i5 = this.ycx;
        return Arrays.hashCode(this.f27087dj) + (((((((i5 * 31) + i5) * 31) + this.f27088zb) * 31) + this.sya) * 31);
    }

    public boolean ycx(int i5, int i11) {
        return ((this.f27087dj[(i5 / 32) + (i11 * this.sya)] >>> (i5 & 31)) & 1) != 0;
    }

    public void ycx(int i5, int i11, int i12, int i13) {
        if (i11 < 0 || i5 < 0) {
            throw new IllegalArgumentException("Left and top must be nonnegative");
        }
        if (i13 > 0 && i12 > 0) {
            int i14 = i12 + i5;
            int i15 = i13 + i11;
            if (i15 > this.f27088zb || i14 > this.ycx) {
                throw new IllegalArgumentException("The region must fit inside the matrix");
            }
            while (i11 < i15) {
                int i16 = this.sya * i11;
                for (int i17 = i5; i17 < i14; i17++) {
                    int[] iArr = this.f27087dj;
                    int i18 = (i17 / 32) + i16;
                    iArr[i18] = iArr[i18] | (1 << (i17 & 31));
                }
                i11++;
            }
            return;
        }
        throw new IllegalArgumentException("Height and width must be at least 1");
    }
}
