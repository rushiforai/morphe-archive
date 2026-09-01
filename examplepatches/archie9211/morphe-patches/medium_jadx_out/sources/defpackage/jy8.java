package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jy8 implements hy8 {
    public final float a;
    public final float b;
    public final float c;
    public final float d;

    public jy8(float f, float f2, float f3, float f4) {
        this.a = f;
        this.b = f2;
        this.c = f3;
        this.d = f4;
        if (!((f >= 0.0f) & (f2 >= 0.0f) & (f3 >= 0.0f)) || !(f4 >= 0.0f)) {
            z16.a("Padding must be non-negative");
        }
    }

    @Override // defpackage.hy8
    public final float a() {
        return this.d;
    }

    @Override // defpackage.hy8
    public final float b(ip6 ip6Var) {
        return ip6Var == ip6.Ltr ? this.a : this.c;
    }

    @Override // defpackage.hy8
    public final float c(ip6 ip6Var) {
        return ip6Var == ip6.Ltr ? this.c : this.a;
    }

    @Override // defpackage.hy8
    public final float d() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof jy8)) {
            return false;
        }
        jy8 jy8Var = (jy8) obj;
        return vj3.b(this.a, jy8Var.a) && vj3.b(this.b, jy8Var.b) && vj3.b(this.c, jy8Var.c) && vj3.b(this.d, jy8Var.d);
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.d) + km4.p(this.c, km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31), 31);
    }

    public final String toString() {
        return "PaddingValues(start=" + ((Object) vj3.c(this.a)) + ", top=" + ((Object) vj3.c(this.b)) + ", end=" + ((Object) vj3.c(this.c)) + ", bottom=" + ((Object) vj3.c(this.d)) + ')';
    }
}
