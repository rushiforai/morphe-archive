package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nt5 extends ot5 {
    public final x31 d;
    public final boolean e;

    public nt5(ybb ybbVar, u31 u31Var, y92 y92Var, x31 x31Var, boolean z) {
        super(ybbVar, u31Var, y92Var);
        this.d = x31Var;
        this.e = z;
    }

    @Override // defpackage.ot5
    public final Object a(sp8 sp8Var, Object[] objArr) {
        v31 v31Var = (v31) this.d.u(sp8Var);
        n92 n92Var = (n92) objArr[objArr.length - 1];
        try {
            try {
                if (!this.e) {
                    return guc.t(v31Var, n92Var);
                }
                try {
                    v31Var.getClass();
                    return guc.u(v31Var, n92Var);
                } catch (LinkageError e) {
                    throw e;
                } catch (ThreadDeath e2) {
                    throw e2;
                }
            } catch (Throwable th) {
                return guc.W(th, n92Var);
            }
        } catch (LinkageError | ThreadDeath | VirtualMachineError e3) {
            throw e3;
        }
    }
}
