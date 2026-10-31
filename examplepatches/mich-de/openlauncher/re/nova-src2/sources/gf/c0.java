package gf;

/* loaded from: classes3.dex */
public final class c0 implements tf.q {

    /* renamed from: a, reason: collision with root package name */
    public final tf.q f57464a;

    /* renamed from: b, reason: collision with root package name */
    public final x0 f57465b;

    public c0(tf.q qVar, x0 x0Var) {
        this.f57464a = qVar;
        this.f57465b = x0Var;
    }

    @Override // tf.q
    public final int a(int i5) {
        return this.f57464a.a(i5);
    }

    @Override // tf.q
    public final void b() {
        this.f57464a.b();
    }

    @Override // tf.q
    public final void c(float f11) {
        this.f57464a.c(f11);
    }

    @Override // tf.q
    public final void d() {
        this.f57464a.d();
    }

    @Override // tf.q
    public final int e(int i5) {
        return this.f57464a.e(i5);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c0)) {
            return false;
        }
        c0 c0Var = (c0) obj;
        return this.f57464a.equals(c0Var.f57464a) && this.f57465b.equals(c0Var.f57465b);
    }

    @Override // tf.q
    public final x0 f() {
        return this.f57465b;
    }

    @Override // tf.q
    public final void g(boolean z11) {
        this.f57464a.g(z11);
    }

    @Override // tf.q
    public final fe.k0 getFormat(int i5) {
        return this.f57464a.getFormat(i5);
    }

    @Override // tf.q
    public final void h() {
        this.f57464a.h();
    }

    public final int hashCode() {
        return this.f57464a.hashCode() + ((this.f57465b.hashCode() + 527) * 31);
    }

    @Override // tf.q
    public final fe.k0 i() {
        return this.f57464a.i();
    }

    @Override // tf.q
    public final void j() {
        this.f57464a.j();
    }

    @Override // tf.q
    public final int length() {
        return this.f57464a.length();
    }
}
