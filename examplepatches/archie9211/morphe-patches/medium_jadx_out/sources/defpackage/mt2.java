package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mt2 extends p4d implements x45 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mt2(Object obj, n92 n92Var, int i) {
        super(1, n92Var);
        this.b = i;
        this.d = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        int i = this.b;
        Object obj = this.d;
        switch (i) {
            case 0:
                return new mt2((w6c) obj, n92Var, 0);
            case 1:
                return new mt2((ju2) obj, n92Var, 1);
            case 2:
                return new mt2((xx2) obj, n92Var, 2);
            case 3:
                return new mt2((lid) obj, n92Var, 3);
            default:
                return new mt2((pod) obj, n92Var, 4);
        }
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = (n92) obj;
        switch (i) {
        }
        return ((mt2) create(n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:37:0x00a8, code lost:
    
        if (r14 == r0) goto L38;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 452
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mt2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
