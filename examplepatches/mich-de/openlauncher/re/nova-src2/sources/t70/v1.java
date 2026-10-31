package t70;

/* loaded from: classes.dex */
public final class v1 extends t1 {

    /* renamed from: e, reason: collision with root package name */
    public final x1 f88871e;

    /* renamed from: f, reason: collision with root package name */
    public final w1 f88872f;

    /* renamed from: g, reason: collision with root package name */
    public final q f88873g;

    /* renamed from: h, reason: collision with root package name */
    public final Object f88874h;

    public v1(x1 x1Var, w1 w1Var, q qVar, Object obj) {
        this.f88871e = x1Var;
        this.f88872f = w1Var;
        this.f88873g = qVar;
        this.f88874h = obj;
    }

    @Override // t70.t1
    public final boolean j() {
        return false;
    }

    @Override // t70.t1
    public final void k(Throwable th2) {
        q qVar = this.f88873g;
        q qVarA0 = x1.a0(qVar);
        x1 x1Var = this.f88871e;
        w1 w1Var = this.f88872f;
        Object obj = this.f88874h;
        if (qVarA0 == null || !x1Var.i0(w1Var, qVarA0, obj)) {
            w1Var.f88880a.d(new y70.i(2), 2);
            q qVarA02 = x1.a0(qVar);
            if (qVarA02 == null || !x1Var.i0(w1Var, qVarA02, obj)) {
                x1Var.u(x1Var.I(w1Var, obj));
            }
        }
    }
}
