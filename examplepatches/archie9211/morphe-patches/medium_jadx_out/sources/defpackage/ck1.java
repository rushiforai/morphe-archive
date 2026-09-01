package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ck1 extends yj1 {
    public final pc1 d;
    public final int e;

    public ck1(pc1 pc1Var, int i, ib2 ib2Var, int i2, nz0 nz0Var) {
        super(ib2Var, i2, nz0Var);
        this.d = pc1Var;
        this.e = i;
    }

    @Override // defpackage.yj1
    public final String d() {
        return "concurrency=" + this.e;
    }

    @Override // defpackage.yj1
    public final Object e(l2a l2aVar, n92 n92Var) {
        int i = pyb.a;
        Object objB = this.d.b(new a9((va6) n92Var.getContext().o0(cd7.g), new oyb(this.e), l2aVar, new hzb(l2aVar), 3), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }

    @Override // defpackage.yj1
    public final yj1 f(ib2 ib2Var, int i, nz0 nz0Var) {
        return new ck1(this.d, this.e, ib2Var, i, nz0Var);
    }

    @Override // defpackage.yj1
    public final wj1 j(sb2 sb2Var) {
        r91 r91Var = new r91(this, (n92) null, 4);
        nz0 nz0Var = nz0.SUSPEND;
        wb2 wb2Var = wb2.DEFAULT;
        l2a l2aVar = new l2a(guc.Q(sb2Var, this.a), pwd.e(this.b, 4, nz0Var));
        wb2Var.invoke(r91Var, l2aVar, l2aVar);
        return l2aVar;
    }
}
