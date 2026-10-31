package h6;

/* loaded from: classes.dex */
public final class v0 implements y {

    /* renamed from: a, reason: collision with root package name */
    public final z0 f59460a;

    public v0(z0 z0Var) {
        this.f59460a = z0Var;
    }

    @Override // h6.y
    public final void d(a0 a0Var, s sVar) {
        if (sVar == s.ON_CREATE) {
            a0Var.getLifecycle().c(this);
            this.f59460a.b();
        } else {
            throw new IllegalStateException(("Next event must be ON_CREATE, it was " + sVar).toString());
        }
    }
}
