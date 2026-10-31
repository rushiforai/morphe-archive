package com.bytedance.adsdk.zb.sya.zb;

import b.c0;
import java.util.Arrays;

/* loaded from: classes2.dex */
public class dj {
    private final float[] ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int[] f23039zb;

    public dj(float[] fArr, int[] iArr) {
        this.ycx = fArr;
        this.f23039zb = iArr;
    }

    public int sya() {
        return this.f23039zb.length;
    }

    public float[] ycx() {
        return this.ycx;
    }

    public int[] zb() {
        return this.f23039zb;
    }

    public void ycx(dj djVar, dj djVar2, float f11) {
        if (djVar.f23039zb.length != djVar2.f23039zb.length) {
            StringBuilder sb2 = new StringBuilder("Cannot interpolate between gradients. Lengths vary (");
            sb2.append(djVar.f23039zb.length);
            sb2.append(" vs ");
            throw new IllegalArgumentException(c0.o(sb2, djVar2.f23039zb.length, ")"));
        }
        for (int i5 = 0; i5 < djVar.f23039zb.length; i5++) {
            this.ycx[i5] = com.bytedance.adsdk.zb.lt.lud.ycx(djVar.ycx[i5], djVar2.ycx[i5], f11);
            this.f23039zb[i5] = com.bytedance.adsdk.zb.lt.zb.ycx(f11, djVar.f23039zb[i5], djVar2.f23039zb[i5]);
        }
    }

    public dj ycx(float[] fArr) {
        int[] iArr = new int[fArr.length];
        for (int i5 = 0; i5 < fArr.length; i5++) {
            iArr[i5] = ycx(fArr[i5]);
        }
        return new dj(fArr, iArr);
    }

    private int ycx(float f11) {
        int iBinarySearch = Arrays.binarySearch(this.ycx, f11);
        if (iBinarySearch >= 0) {
            return this.f23039zb[iBinarySearch];
        }
        int i5 = -(iBinarySearch + 1);
        if (i5 == 0) {
            return this.f23039zb[0];
        }
        int[] iArr = this.f23039zb;
        if (i5 == iArr.length - 1) {
            return iArr[iArr.length - 1];
        }
        float[] fArr = this.ycx;
        int i11 = i5 - 1;
        float f12 = fArr[i11];
        return com.bytedance.adsdk.zb.lt.zb.ycx((f11 - f12) / (fArr[i5] - f12), iArr[i11], iArr[i5]);
    }
}
