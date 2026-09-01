package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class re5 {
    public final float[] a;
    public final int[] b;

    public re5(float[] fArr, int[] iArr) {
        this.a = fArr;
        this.b = iArr;
    }

    public final void a(re5 re5Var) {
        int i = 0;
        while (true) {
            int[] iArr = re5Var.b;
            if (i >= iArr.length) {
                return;
            }
            this.a[i] = re5Var.a[i];
            this.b[i] = iArr[i];
            i++;
        }
    }

    public final re5 b(float[] fArr) {
        int iO;
        int[] iArr = new int[fArr.length];
        for (int i = 0; i < fArr.length; i++) {
            float f = fArr[i];
            float[] fArr2 = this.a;
            int iBinarySearch = Arrays.binarySearch(fArr2, f);
            int[] iArr2 = this.b;
            if (iBinarySearch >= 0) {
                iO = iArr2[iBinarySearch];
            } else {
                int i2 = -(iBinarySearch + 1);
                if (i2 == 0) {
                    iO = iArr2[0];
                } else if (i2 == iArr2.length - 1) {
                    iO = iArr2[iArr2.length - 1];
                } else {
                    int i3 = i2 - 1;
                    float f2 = fArr2[i3];
                    iO = g01.O((f - f2) / (fArr2[i2] - f2), iArr2[i3], iArr2[i2]);
                }
            }
            iArr[i] = iO;
        }
        return new re5(fArr, iArr);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || re5.class != obj.getClass()) {
            return false;
        }
        re5 re5Var = (re5) obj;
        return Arrays.equals(this.a, re5Var.a) && Arrays.equals(this.b, re5Var.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) + (Arrays.hashCode(this.a) * 31);
    }
}
