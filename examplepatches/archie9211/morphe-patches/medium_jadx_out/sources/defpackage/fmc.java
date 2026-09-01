package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fmc implements n92, ub2 {
    public final ak1 a;
    public final ib2 b;

    public fmc(ak1 ak1Var, ib2 ib2Var) {
        this.a = ak1Var;
        this.b = ib2Var;
    }

    @Override // defpackage.ub2
    public final ub2 getCallerFrame() {
        return this.a;
    }

    @Override // defpackage.n92
    public final ib2 getContext() {
        return this.b;
    }

    @Override // defpackage.n92
    public final void resumeWith(Object obj) {
        this.a.resumeWith(obj);
    }
}
