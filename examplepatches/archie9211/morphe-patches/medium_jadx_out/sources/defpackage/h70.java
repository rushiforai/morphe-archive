package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class h70 implements g70, j70 {
    public final float a;
    public final boolean b;
    public final i70 c;
    public final float d;

    public h70(float f, boolean z, i70 i70Var) {
        this.a = f;
        this.b = z;
        this.c = i70Var;
        this.d = f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h70)) {
            return false;
        }
        h70 h70Var = (h70) obj;
        return vj3.b(this.a, h70Var.a) && this.b == h70Var.b && g76.L(this.c, h70Var.c);
    }

    @Override // defpackage.g70, defpackage.j70
    public final float f() {
        return this.d;
    }

    @Override // defpackage.j70
    public final void f0(m73 m73Var, int i, int[] iArr, int[] iArr2) {
        w(m73Var, i, iArr, ip6.Ltr, iArr2);
    }

    public final int hashCode() {
        int iFloatToIntBits = ((Float.floatToIntBits(this.a) * 31) + (this.b ? 1231 : 1237)) * 31;
        i70 i70Var = this.c;
        return iFloatToIntBits + (i70Var == null ? 0 : i70Var.hashCode());
    }

    public final String toString() {
        return (this.b ? "" : "Absolute") + "Arrangement#spacedAligned(" + ((Object) vj3.c(this.a)) + ", " + this.c + ')';
    }

    @Override // defpackage.g70
    public final void w(m73 m73Var, int i, int[] iArr, ip6 ip6Var, int[] iArr2) {
        int i2;
        if (iArr.length == 0) {
            return;
        }
        int iI0 = m73Var.i0(this.a);
        boolean z = this.b && ip6Var == ip6.Rtl;
        if (z) {
            int length = iArr.length;
            int i3 = 0;
            int iMin = 0;
            int i4 = 0;
            while (i3 < length) {
                int iMax = Math.max(0, i - iArr[i3]);
                iArr2[i4] = iMax;
                iMin = Math.min(iI0, iMax);
                i = iArr2[i4] - iMin;
                i3++;
                i4++;
            }
            i2 = i + iMin;
        } else {
            int length2 = iArr.length;
            int i5 = 0;
            int i6 = 0;
            int i7 = 0;
            int i8 = 0;
            while (i5 < length2) {
                int i9 = iArr[i5];
                int iMin2 = Math.min(i6, i - i9);
                iArr2[i8] = iMin2;
                int iMin3 = Math.min(iI0, (i - iMin2) - i9);
                int i10 = iArr2[i8] + i9 + iMin3;
                i5++;
                i7 = iMin3;
                i6 = i10;
                i8++;
            }
            i2 = i - (i6 - i7);
        }
        i70 i70Var = this.c;
        if (i70Var == null || i2 <= 0) {
            return;
        }
        int iD = i70Var.d(i2, ip6Var);
        if (z) {
            iD -= i2;
        }
        if (iD != 0) {
            int length3 = iArr2.length;
            for (int i11 = 0; i11 < length3; i11++) {
                iArr2[i11] = iArr2[i11] + iD;
            }
        }
    }
}
