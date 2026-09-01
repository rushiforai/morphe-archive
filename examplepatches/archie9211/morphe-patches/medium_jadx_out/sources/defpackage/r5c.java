package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class r5c extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public final /* synthetic */ v5c e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ r5c(v5c v5cVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = v5cVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        v5c v5cVar = this.e;
        switch (i) {
            case 0:
                return new r5c(v5cVar, n92Var, 0);
            default:
                return new r5c(v5cVar, n92Var, 1);
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
        return ((r5c) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0074 A[PHI: r2
      0x0074: PHI (r2v5 java.lang.Object) = (r2v4 java.lang.Object), (r2v4 java.lang.Object), (r2v6 java.lang.Object) binds: [B:18:0x0046, B:20:0x0071, B:11:0x0029] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:24:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00f5 A[PHI: r2
      0x00f5: PHI (r2v2 java.lang.Object) = (r2v1 java.lang.Object), (r2v1 java.lang.Object), (r2v3 java.lang.Object) binds: [B:42:0x00c7, B:44:0x00f2, B:35:0x00aa] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00fb  */
    /* JADX WARN: Removed duplicated region for block: B:54:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:58:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) {
        /*
            Method dump skipped, instruction units count: 280
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r5c.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
