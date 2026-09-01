package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yz4 implements wz4 {
    public final float[] a;
    public final float[] b;

    public yz4(float[] fArr, float[] fArr2) {
        if (fArr.length != fArr2.length || fArr.length == 0) {
            ay0.e("Array lengths must match and be nonzero");
            throw null;
        }
        this.a = fArr;
        this.b = fArr2;
    }

    @Override // defpackage.wz4
    public final float a(float f) {
        return wgf.G(f, this.b, this.a);
    }

    @Override // defpackage.wz4
    public final float b(float f) {
        return wgf.G(f, this.a, this.b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof yz4)) {
            return false;
        }
        yz4 yz4Var = (yz4) obj;
        return Arrays.equals(this.a, yz4Var.a) && Arrays.equals(this.b, yz4Var.b);
    }

    public final int hashCode() {
        return Arrays.hashCode(this.b) + (Arrays.hashCode(this.a) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("FontScaleConverter{fromSpValues=");
        String string = Arrays.toString(this.a);
        string.getClass();
        sb.append(string);
        sb.append(", toDpValues=");
        String string2 = Arrays.toString(this.b);
        string2.getClass();
        sb.append(string2);
        sb.append('}');
        return sb.toString();
    }
}
