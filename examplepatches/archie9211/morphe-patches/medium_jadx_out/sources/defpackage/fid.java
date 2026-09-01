package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fid extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ lid d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ fid(lid lidVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = lidVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        lid lidVar = this.d;
        switch (i) {
            case 0:
                fid fidVar = new fid(lidVar, n92Var, 0);
                long j = ((ip8) obj).a;
                return fidVar;
            case 1:
                return new fid(lidVar, n92Var, 1);
            default:
                return new fid(lidVar, n92Var, 2);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                long j = ((ip8) obj).a;
                break;
        }
        return ((fid) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:144:0x02b5, code lost:
    
        if (r0 == r1) goto L145;
     */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0148  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r46) {
        /*
            Method dump skipped, instruction units count: 1086
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.fid.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
