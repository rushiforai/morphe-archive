package h6;

/* loaded from: classes.dex */
public final class h0 extends i0 implements y {

    /* renamed from: e, reason: collision with root package name */
    public final a0 f59370e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ j0 f59371f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h0(j0 j0Var, a0 a0Var, n0 n0Var) {
        super(j0Var, n0Var);
        this.f59371f = j0Var;
        this.f59370e = a0Var;
    }

    @Override // h6.i0
    public final void b() {
        this.f59370e.getLifecycle().c(this);
    }

    @Override // h6.i0
    public final boolean c(a0 a0Var) {
        return this.f59370e == a0Var;
    }

    @Override // h6.y
    public final void d(a0 a0Var, s sVar) {
        a0 a0Var2 = this.f59370e;
        t tVarB = a0Var2.getLifecycle().b();
        if (tVarB == t.f59440a) {
            this.f59371f.i(this.f59378a);
            return;
        }
        t tVar = null;
        while (tVar != tVarB) {
            a(e());
            tVar = tVarB;
            tVarB = a0Var2.getLifecycle().b();
        }
    }

    @Override // h6.i0
    public final boolean e() {
        return this.f59370e.getLifecycle().b().compareTo(t.f59443d) >= 0;
    }
}
