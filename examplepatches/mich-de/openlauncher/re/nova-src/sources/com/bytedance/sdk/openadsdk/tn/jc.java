package com.bytedance.sdk.openadsdk.tn;

/* loaded from: classes2.dex */
final class jc {
    private final jw ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int[] f27046zb;

    public jc(jw jwVar, int[] iArr) {
        if (iArr.length == 0) {
            throw new IllegalArgumentException();
        }
        this.ycx = jwVar;
        int length = iArr.length;
        int i5 = 1;
        if (length <= 1 || iArr[0] != 0) {
            this.f27046zb = iArr;
            return;
        }
        while (i5 < length && iArr[i5] == 0) {
            i5++;
        }
        if (i5 == length) {
            this.f27046zb = new int[]{0};
            return;
        }
        int[] iArr2 = new int[length - i5];
        this.f27046zb = iArr2;
        System.arraycopy(iArr, i5, iArr2, 0, iArr2.length);
    }

    public boolean sya() {
        return this.f27046zb[0] == 0;
    }

    public int[] ycx() {
        return this.f27046zb;
    }

    public int zb() {
        return this.f27046zb.length - 1;
    }

    public jc[] sya(jc jcVar) {
        if (!this.ycx.equals(jcVar.ycx)) {
            throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
        }
        if (jcVar.sya()) {
            throw new IllegalArgumentException("Divide by 0");
        }
        jc jcVarYcx = this.ycx.ycx();
        int iZb = this.ycx.zb(jcVar.ycx(jcVar.zb()));
        jc jcVarYcx2 = this;
        while (jcVarYcx2.zb() >= jcVar.zb() && !jcVarYcx2.sya()) {
            int iZb2 = jcVarYcx2.zb() - jcVar.zb();
            int iSya = this.ycx.sya(jcVarYcx2.ycx(jcVarYcx2.zb()), iZb);
            jc jcVarYcx3 = jcVar.ycx(iZb2, iSya);
            jcVarYcx = jcVarYcx.ycx(this.ycx.ycx(iZb2, iSya));
            jcVarYcx2 = jcVarYcx2.ycx(jcVarYcx3);
        }
        return new jc[]{jcVarYcx, jcVarYcx2};
    }

    public int ycx(int i5) {
        return this.f27046zb[(r0.length - 1) - i5];
    }

    public jc zb(jc jcVar) {
        if (!this.ycx.equals(jcVar.ycx)) {
            throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
        }
        if (sya() || jcVar.sya()) {
            return this.ycx.ycx();
        }
        int[] iArr = this.f27046zb;
        int length = iArr.length;
        int[] iArr2 = jcVar.f27046zb;
        int length2 = iArr2.length;
        int[] iArr3 = new int[(length + length2) - 1];
        for (int i5 = 0; i5 < length; i5++) {
            int i11 = iArr[i5];
            for (int i12 = 0; i12 < length2; i12++) {
                int i13 = i5 + i12;
                iArr3[i13] = jw.zb(iArr3[i13], this.ycx.sya(i11, iArr2[i12]));
            }
        }
        return new jc(this.ycx, iArr3);
    }

    public jc ycx(jc jcVar) {
        if (this.ycx.equals(jcVar.ycx)) {
            if (sya()) {
                return jcVar;
            }
            if (jcVar.sya()) {
                return this;
            }
            int[] iArr = this.f27046zb;
            int[] iArr2 = jcVar.f27046zb;
            if (iArr.length <= iArr2.length) {
                iArr = iArr2;
                iArr2 = iArr;
            }
            int[] iArr3 = new int[iArr.length];
            int length = iArr.length - iArr2.length;
            System.arraycopy(iArr, 0, iArr3, 0, length);
            for (int i5 = length; i5 < iArr.length; i5++) {
                iArr3[i5] = jw.zb(iArr2[i5 - length], iArr[i5]);
            }
            return new jc(this.ycx, iArr3);
        }
        throw new IllegalArgumentException("GenericGFPolys do not have same GenericGF field");
    }

    public jc ycx(int i5, int i11) {
        if (i5 < 0) {
            throw new IllegalArgumentException();
        }
        if (i11 == 0) {
            return this.ycx.ycx();
        }
        int length = this.f27046zb.length;
        int[] iArr = new int[i5 + length];
        for (int i12 = 0; i12 < length; i12++) {
            iArr[i12] = this.ycx.sya(this.f27046zb[i12], i11);
        }
        return new jc(this.ycx, iArr);
    }
}
