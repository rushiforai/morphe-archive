package k0;

/* loaded from: classes2.dex */
public final class j0 implements g2 {

    /* renamed from: a, reason: collision with root package name */
    public final float f70647a;

    /* renamed from: b, reason: collision with root package name */
    public final float f70648b;

    /* renamed from: c, reason: collision with root package name */
    public final float f70649c;

    /* renamed from: d, reason: collision with root package name */
    public final float f70650d;

    public j0(float f11, float f12, float f13, float f14) {
        this.f70647a = f11;
        this.f70648b = f12;
        this.f70649c = f13;
        this.f70650d = f14;
    }

    @Override // k0.g2
    public final int a(y3.c cVar, y3.n nVar) {
        return cVar.mo96roundToPx0680j_4(this.f70647a);
    }

    @Override // k0.g2
    public final int b(y3.c cVar, y3.n nVar) {
        return cVar.mo96roundToPx0680j_4(this.f70649c);
    }

    @Override // k0.g2
    public final int c(y3.c cVar) {
        return cVar.mo96roundToPx0680j_4(this.f70650d);
    }

    @Override // k0.g2
    public final int d(y3.c cVar) {
        return cVar.mo96roundToPx0680j_4(this.f70648b);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j0)) {
            return false;
        }
        j0 j0Var = (j0) obj;
        return y3.f.a(this.f70647a, j0Var.f70647a) && y3.f.a(this.f70648b, j0Var.f70648b) && y3.f.a(this.f70649c, j0Var.f70649c) && y3.f.a(this.f70650d, j0Var.f70650d);
    }

    public final int hashCode() {
        return Float.hashCode(this.f70650d) + a80.m.d(this.f70649c, a80.m.d(this.f70648b, Float.hashCode(this.f70647a) * 31, 31), 31);
    }

    public final String toString() {
        return "Insets(left=" + ((Object) y3.f.b(this.f70647a)) + ", top=" + ((Object) y3.f.b(this.f70648b)) + ", right=" + ((Object) y3.f.b(this.f70649c)) + ", bottom=" + ((Object) y3.f.b(this.f70650d)) + ')';
    }
}
