package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ox2 extends p4d implements b55 {
    public int b;
    public final /* synthetic */ xx2 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ox2(xx2 xx2Var, n92 n92Var) {
        super(2, n92Var);
        this.c = xx2Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new ox2(this.c, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ox2) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:36:0x00e2, code lost:
    
        if (r0.h(r9) == r2) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:23:0x008d A[PHI: r10
      0x008d: PHI (r10v15 java.lang.Object) = (r10v14 java.lang.Object), (r10v0 java.lang.Object) binds: [B:21:0x008a, B:11:0x0022] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00e5  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r10) {
        /*
            Method dump skipped, instruction units count: 235
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ox2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
