package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public final /* synthetic */ r0 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ q0(r0 r0Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.c = r0Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        r0 r0Var = this.c;
        switch (i) {
            case 0:
                return new q0(r0Var, n92Var, 0);
            default:
                return new q0(r0Var, n92Var, 1);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
            case 0:
                ((q0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
            default:
                ((q0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
                break;
        }
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        r0 r0Var = this.c;
        switch (i) {
            case 0:
                br7.v(obj);
                if (r0Var.D == null) {
                    sr5 sr5Var = new sr5();
                    m68 m68Var = r0Var.q;
                    if (m68Var != null) {
                        vx0.c0(r0Var.u0(), null, null, new j0(m68Var, sr5Var, n92Var, 0), 3);
                    }
                    r0Var.D = sr5Var;
                }
                break;
            default:
                br7.v(obj);
                sr5 sr5Var2 = r0Var.D;
                if (sr5Var2 != null) {
                    tr5 tr5Var = new tr5(sr5Var2);
                    m68 m68Var2 = r0Var.q;
                    if (m68Var2 != null) {
                        vx0.c0(r0Var.u0(), null, null, new j0(m68Var2, tr5Var, n92Var, 1), 3);
                    }
                    r0Var.D = null;
                }
                break;
        }
        return c1eVar;
    }
}
