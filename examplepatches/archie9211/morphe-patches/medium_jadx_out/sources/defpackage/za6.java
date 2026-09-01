package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class za6 extends x51 {
    public final db6 i;

    public za6(n92 n92Var, db6 db6Var) {
        super(1, n92Var);
        this.i = db6Var;
    }

    @Override // defpackage.x51
    public final String A() {
        return "AwaitContinuation";
    }

    @Override // defpackage.x51
    public final Throwable p(db6 db6Var) {
        Throwable thB;
        Object objH = this.i.H();
        return (!(objH instanceof bb6) || (thB = ((bb6) objH).b()) == null) ? objH instanceof cy1 ? ((cy1) objH).a : db6Var.L() : thB;
    }
}
