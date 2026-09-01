package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tb7 extends p4d implements x45 {
    public final /* synthetic */ ub7 b;
    public final /* synthetic */ bc7 c;
    public final /* synthetic */ float d;
    public final /* synthetic */ int e;
    public final /* synthetic */ boolean f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tb7(ub7 ub7Var, bc7 bc7Var, float f, int i, boolean z, n92 n92Var) {
        super(1, n92Var);
        this.b = ub7Var;
        this.c = bc7Var;
        this.d = f;
        this.e = i;
        this.f = z;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new tb7(this.b, this.c, this.d, this.e, this.f, n92Var);
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        tb7 tb7Var = (tb7) create((n92) obj);
        c1e c1eVar = c1e.a;
        tb7Var.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        bc7 bc7Var = this.c;
        ub7 ub7Var = this.b;
        ub7Var.i.setValue(bc7Var);
        ub7Var.j(this.d);
        ub7Var.h(this.e);
        ub7Var.i(false);
        if (this.f) {
            ub7Var.l.setValue(Long.MIN_VALUE);
        }
        return c1e.a;
    }
}
