package p1;

/* loaded from: classes.dex */
public final class d0 implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final t70.j0 f81396a;

    public d0(t70.j0 j0Var) {
        this.f81396a = j0Var;
    }

    @Override // p1.z1
    public final void a() {
    }

    @Override // p1.z1
    public final void g() {
        t70.j0 j0Var = this.f81396a;
        if (j0Var instanceof c2) {
            ((c2) j0Var).b();
        } else {
            t70.k0.c(j0Var, new p0(1));
        }
    }

    @Override // p1.z1
    public final void i() {
        t70.j0 j0Var = this.f81396a;
        if (j0Var instanceof c2) {
            ((c2) j0Var).b();
        } else {
            t70.k0.c(j0Var, new p0(1));
        }
    }
}
