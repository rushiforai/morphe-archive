package l1;

/* loaded from: classes.dex */
public final class o0 {

    /* renamed from: a, reason: collision with root package name */
    public final float f73724a;

    /* renamed from: b, reason: collision with root package name */
    public final float f73725b;

    /* renamed from: c, reason: collision with root package name */
    public final float f73726c;

    /* renamed from: d, reason: collision with root package name */
    public final float f73727d;

    /* renamed from: e, reason: collision with root package name */
    public final float f73728e;

    public o0(float f11, float f12, float f13, float f14, float f15) {
        this.f73724a = f11;
        this.f73725b = f12;
        this.f73726c = f13;
        this.f73727d = f14;
        this.f73728e = f15;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof o0)) {
            return false;
        }
        o0 o0Var = (o0) obj;
        return y3.f.a(this.f73724a, o0Var.f73724a) && y3.f.a(this.f73725b, o0Var.f73725b) && y3.f.a(this.f73726c, o0Var.f73726c) && y3.f.a(this.f73727d, o0Var.f73727d) && y3.f.a(this.f73728e, o0Var.f73728e);
    }

    public final int hashCode() {
        return Float.hashCode(this.f73728e) + a80.m.d(this.f73727d, a80.m.d(this.f73726c, a80.m.d(this.f73725b, Float.hashCode(this.f73724a) * 31, 31), 31), 31);
    }
}
