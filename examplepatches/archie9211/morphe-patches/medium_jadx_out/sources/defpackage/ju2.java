package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ju2 extends p4d implements x45 {
    public final /* synthetic */ int b = 1;
    public int c;
    public final /* synthetic */ mu2 d;
    public Object e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ju2(rya ryaVar, mu2 mu2Var, pya pyaVar, n92 n92Var) {
        super(1, n92Var);
        this.f = ryaVar;
        this.d = mu2Var;
        this.g = pyaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        int i = this.b;
        Object obj = this.g;
        Object obj2 = this.f;
        mu2 mu2Var = this.d;
        switch (i) {
            case 0:
                return new ju2((rya) obj2, mu2Var, (pya) obj, n92Var);
            default:
                return new ju2(mu2Var, (ib2) obj2, (b55) obj, n92Var);
        }
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = (n92) obj;
        switch (i) {
        }
        return ((ju2) create(n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:29:0x0079, code lost:
    
        if (r6.i(r12, true, r11) == r0) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:59:0x00f9, code lost:
    
        if (r12 != r0) goto L61;
     */
    /* JADX WARN: Removed duplicated region for block: B:22:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x007f  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r12) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 270
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ju2.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ju2(mu2 mu2Var, ib2 ib2Var, b55 b55Var, n92 n92Var) {
        super(1, n92Var);
        this.d = mu2Var;
        this.f = ib2Var;
        this.g = b55Var;
    }
}
