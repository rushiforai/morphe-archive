package defpackage;

import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class frb extends z0 implements ub2 {
    public final n92 d;

    public frb(n92 n92Var, ib2 ib2Var) {
        super(ib2Var, true);
        this.d = n92Var;
    }

    @Override // defpackage.db6
    public final boolean S() {
        return true;
    }

    @Override // defpackage.db6
    public void g(Object obj) throws DispatchException {
        op8.k0(pwd.Q(this.d), bgf.H(obj));
    }

    @Override // defpackage.ub2
    public final ub2 getCallerFrame() {
        n92 n92Var = this.d;
        if (n92Var instanceof ub2) {
            return (ub2) n92Var;
        }
        return null;
    }

    @Override // defpackage.db6
    public void h(Object obj) {
        this.d.resumeWith(bgf.H(obj));
    }

    public void l0() {
    }
}
