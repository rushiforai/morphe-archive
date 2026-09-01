package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qc1 extends p4d implements b55 {
    public /* synthetic */ Object b;
    public final /* synthetic */ id1 c;
    public final /* synthetic */ String d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qc1(id1 id1Var, n92 n92Var, String str) {
        super(2, n92Var);
        this.c = id1Var;
        this.d = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        qc1 qc1Var = new qc1(this.c, n92Var, this.d);
        qc1Var.b = ((bjb) obj).a;
        return qc1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        Object obj3 = ((bjb) obj).a;
        qc1 qc1Var = new qc1(this.c, (n92) obj2, this.d);
        qc1Var.b = obj3;
        return qc1Var.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object obj2 = this.b;
        br7.v(obj);
        Throwable thB = bjb.b(obj2);
        if (thB != null) {
            return new u50(7, new bjb(new ajb(thB)));
        }
        br7.v(obj2);
        q81 q81Var = (q81) obj2;
        return q81Var.a.getCatalogSummaryData().getCreator().getViewerEdge().isUser() ? new pc1(this.c.d.H(this.d), 0, q81Var) : new u50(7, new bjb(new r81(q81Var, null)));
    }
}
