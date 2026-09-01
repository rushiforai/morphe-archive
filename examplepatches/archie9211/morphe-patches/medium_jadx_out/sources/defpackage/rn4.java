package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rn4 {
    public final float a;
    public final float b;
    public final float c;
    public final float d;

    public rn4(float f, float f2, float f3, float f4) {
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof rn4)) {
            return false;
        }
        rn4 rn4Var = (rn4) obj;
        if (vj3.b(this.a, rn4Var.a) && vj3.b(this.b, rn4Var.b) && vj3.b(this.c, rn4Var.c)) {
            return vj3.b(this.d, rn4Var.d);
        }
        return false;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + km4.p(this.c, km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31), 31);
    }
}
