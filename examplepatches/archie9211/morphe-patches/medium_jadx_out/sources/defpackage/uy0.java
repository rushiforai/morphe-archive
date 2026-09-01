package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uy0 extends q28 implements my0, fp6 {
    public k82 o;
    public boolean p;

    public static final zwa I0(uy0 uy0Var, eh8 eh8Var, cn cnVar) {
        zwa zwaVar;
        if (uy0Var.n && uy0Var.p) {
            eh8 eh8VarU0 = flb.u0(uy0Var);
            if (!eh8Var.O0().n) {
                eh8Var = null;
            }
            if (eh8Var != null && (zwaVar = (zwa) cnVar.invoke()) != null) {
                return zwaVar.i(eh8VarU0.H(eh8Var, false).d());
            }
        }
        return null;
    }

    @Override // defpackage.my0
    public final Object G(eh8 eh8Var, cn cnVar, p92 p92Var) {
        Object objS = o7f.s(new ty0(this, eh8Var, cnVar, new le0(this, eh8Var, cnVar, 8), null, 0), p92Var);
        return objS == tb2.COROUTINE_SUSPENDED ? objS : c1e.a;
    }

    @Override // defpackage.fp6
    public final void l(hp6 hp6Var) {
        this.p = true;
    }

    @Override // defpackage.q28
    public final boolean v0() {
        return false;
    }

    @Override // defpackage.fl7
    public final void p(long j) {
    }
}
