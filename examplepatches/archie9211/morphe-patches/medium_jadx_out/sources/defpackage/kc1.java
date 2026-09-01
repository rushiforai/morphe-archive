package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class kc1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ id1 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ kc1(int i, id1 id1Var, n92 n92Var) {
        super(2, n92Var);
        this.b = i;
        this.d = id1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        id1 id1Var = this.d;
        switch (i) {
            case 0:
                return new kc1(0, id1Var, n92Var);
            case 1:
                return new kc1(1, id1Var, n92Var);
            case 2:
                return new kc1(2, id1Var, n92Var);
            case 3:
                return new kc1(3, id1Var, n92Var);
            case 4:
                return new kc1(4, id1Var, n92Var);
            case 5:
                return new kc1(5, id1Var, n92Var);
            case 6:
                return new kc1(6, id1Var, n92Var);
            case 7:
                return new kc1(7, id1Var, n92Var);
            case 8:
                return new kc1(8, id1Var, n92Var);
            case 9:
                return new kc1(9, id1Var, n92Var);
            case 10:
                return new kc1(10, id1Var, n92Var);
            case 11:
                return new kc1(11, id1Var, n92Var);
            case 12:
                return new kc1(12, id1Var, n92Var);
            case 13:
                return new kc1(13, id1Var, n92Var);
            default:
                return new kc1(14, id1Var, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        sb2 sb2Var = (sb2) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((kc1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:109:0x0231, code lost:
    
        if (r1.a(r2, r64) == r5) goto L143;
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x031c, code lost:
    
        if (r1.a(r2, r64) == r5) goto L143;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r65) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1180
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.kc1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
