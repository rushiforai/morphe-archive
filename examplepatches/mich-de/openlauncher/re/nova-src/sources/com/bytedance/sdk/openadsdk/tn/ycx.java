package com.bytedance.sdk.openadsdk.tn;

import java.util.Arrays;

/* loaded from: classes2.dex */
public final class ycx {
    private static final int[] ycx = new int[0];
    private int sya = 0;

    /* renamed from: zb, reason: collision with root package name */
    private int[] f27084zb = ycx;

    private static int[] sya(int i5) {
        return new int[(i5 + 31) / 32];
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof ycx)) {
            return false;
        }
        ycx ycxVar = (ycx) obj;
        return this.sya == ycxVar.sya && Arrays.equals(this.f27084zb, ycxVar.f27084zb);
    }

    public int hashCode() {
        return Arrays.hashCode(this.f27084zb) + (this.sya * 31);
    }

    public int ycx() {
        return this.sya;
    }

    public int zb() {
        return (this.sya + 7) / 8;
    }

    private void zb(int i5) {
        if (i5 > this.f27084zb.length * 32) {
            int[] iArrSya = sya((int) Math.ceil(i5 / 0.75f));
            int[] iArr = this.f27084zb;
            System.arraycopy(iArr, 0, iArrSya, 0, iArr.length);
            this.f27084zb = iArrSya;
        }
    }

    public boolean ycx(int i5) {
        return ((1 << (i5 & 31)) & this.f27084zb[i5 / 32]) != 0;
    }

    public void ycx(boolean z11) {
        zb(this.sya + 1);
        if (z11) {
            int[] iArr = this.f27084zb;
            int i5 = this.sya;
            int i11 = i5 / 32;
            iArr[i11] = (1 << (i5 & 31)) | iArr[i11];
        }
        this.sya++;
    }

    public void ycx(int i5, int i11) {
        if (i11 >= 0 && i11 <= 32) {
            int i12 = this.sya;
            zb(i12 + i11);
            for (int i13 = i11 - 1; i13 >= 0; i13--) {
                if (((1 << i13) & i5) != 0) {
                    int[] iArr = this.f27084zb;
                    int i14 = i12 / 32;
                    iArr[i14] = iArr[i14] | (1 << (i12 & 31));
                }
                i12++;
            }
            this.sya = i12;
            return;
        }
        throw new IllegalArgumentException("Num bits must be between 0 and 32");
    }

    public void zb(ycx ycxVar) {
        if (this.sya != ycxVar.sya) {
            throw new IllegalArgumentException("Sizes don't match");
        }
        int i5 = 0;
        while (true) {
            int[] iArr = this.f27084zb;
            if (i5 >= iArr.length) {
                return;
            }
            iArr[i5] = iArr[i5] ^ ycxVar.f27084zb[i5];
            i5++;
        }
    }

    public void ycx(ycx ycxVar) {
        int i5 = ycxVar.sya;
        zb(this.sya + i5);
        for (int i11 = 0; i11 < i5; i11++) {
            ycx(ycxVar.ycx(i11));
        }
    }

    public void ycx(int i5, byte[] bArr, int i11, int i12) {
        for (int i13 = 0; i13 < i12; i13++) {
            int i14 = 0;
            for (int i15 = 0; i15 < 8; i15++) {
                if (ycx(i5)) {
                    i14 |= 1 << (7 - i15);
                }
                i5++;
            }
            bArr[i11 + i13] = (byte) i14;
        }
    }
}
