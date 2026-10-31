package k0;

/* loaded from: classes.dex */
public final class p1 implements o1 {

    /* renamed from: a, reason: collision with root package name */
    public final float f70703a;

    /* renamed from: b, reason: collision with root package name */
    public final float f70704b;

    /* renamed from: c, reason: collision with root package name */
    public final float f70705c;

    /* renamed from: d, reason: collision with root package name */
    public final float f70706d;

    public p1(float f11, float f12, float f13, float f14) {
        this.f70703a = f11;
        this.f70704b = f12;
        this.f70705c = f13;
        this.f70706d = f14;
        if (!((f11 >= 0.0f) & (f12 >= 0.0f) & (f13 >= 0.0f)) || !(f14 >= 0.0f)) {
            l0.a.a("Padding must be non-negative");
        }
    }

    @Override // k0.o1
    public final float a() {
        return this.f70706d;
    }

    @Override // k0.o1
    public final float b(y3.n nVar) {
        return nVar == y3.n.f96612a ? this.f70703a : this.f70705c;
    }

    @Override // k0.o1
    public final float c(y3.n nVar) {
        return nVar == y3.n.f96612a ? this.f70705c : this.f70703a;
    }

    @Override // k0.o1
    public final float d() {
        return this.f70704b;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof p1)) {
            return false;
        }
        p1 p1Var = (p1) obj;
        return y3.f.a(this.f70703a, p1Var.f70703a) && y3.f.a(this.f70704b, p1Var.f70704b) && y3.f.a(this.f70705c, p1Var.f70705c) && y3.f.a(this.f70706d, p1Var.f70706d);
    }

    public final int hashCode() {
        return Float.hashCode(this.f70706d) + a80.m.d(this.f70705c, a80.m.d(this.f70704b, Float.hashCode(this.f70703a) * 31, 31), 31);
    }

    public final String toString() {
        return "PaddingValues(start=" + ((Object) y3.f.b(this.f70703a)) + ", top=" + ((Object) y3.f.b(this.f70704b)) + ", end=" + ((Object) y3.f.b(this.f70705c)) + ", bottom=" + ((Object) y3.f.b(this.f70706d)) + ')';
    }
}
