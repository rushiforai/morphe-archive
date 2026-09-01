package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ei1 extends p4d implements b55 {
    public boolean b;
    public int c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ qi1 f;
    public final /* synthetic */ String g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ei1(qi1 qi1Var, String str, n92 n92Var) {
        super(2, n92Var);
        this.f = qi1Var;
        this.g = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        ei1 ei1Var = new ei1(this.f, this.g, n92Var);
        ei1Var.e = obj;
        return ei1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ei1) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:49:0x00e3, code lost:
    
        if (r0.a(r5, r14) != r1) goto L51;
     */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0096 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x00b3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 233
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ei1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
