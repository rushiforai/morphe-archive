package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fdd extends p4d implements d55 {
    public final /* synthetic */ int b;
    public /* synthetic */ Object c;
    public /* synthetic */ Object d;
    public /* synthetic */ Object e;
    public final /* synthetic */ que f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fdd(int i, n92 n92Var, que queVar) {
        super(4, n92Var);
        this.b = i;
        this.f = queVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x0090  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r60) {
        /*
            Method dump skipped, instruction units count: 812
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fdd.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        que queVar = this.f;
        switch (i) {
            case 0:
                fdd fddVar = new fdd(0, (n92) obj4, (odd) queVar);
                fddVar.c = (l2b) obj;
                fddVar.d = (s2b) obj2;
                fddVar.e = (s2b) obj3;
                return fddVar.invokeSuspend(c1eVar);
            case 1:
                fdd fddVar2 = new fdd(1, (n92) obj4, (cie) queVar);
                fddVar2.c = (qz8) obj;
                fddVar2.d = (uhe) obj2;
                fddVar2.e = (os0) obj3;
                return fddVar2.invokeSuspend(c1eVar);
            default:
                fdd fddVar3 = new fdd(2, (n92) obj4, (ref) queVar);
                fddVar3.c = (qz8) obj;
                fddVar3.d = (wdf) obj2;
                fddVar3.e = (String) obj3;
                return fddVar3.invokeSuspend(c1eVar);
        }
    }
}
