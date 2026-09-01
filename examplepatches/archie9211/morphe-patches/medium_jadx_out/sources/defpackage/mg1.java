package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mg1 implements pg1 {
    public final float a;
    public final String b;

    public mg1(float f, String str) {
        this.a = f;
        this.b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mg1)) {
            return false;
        }
        mg1 mg1Var = (mg1) obj;
        return Float.compare(this.a, mg1Var.a) == 0 && g76.L(this.b, mg1Var.b);
    }

    public final int hashCode() {
        int iFloatToIntBits = Float.floatToIntBits(this.a) * 31;
        String str = this.b;
        return iFloatToIntBits + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "Downloading(downloadProgress=" + this.a + ", postId=" + this.b + ")";
    }
}
