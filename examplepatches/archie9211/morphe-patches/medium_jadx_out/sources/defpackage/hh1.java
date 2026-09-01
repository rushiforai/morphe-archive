package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hh1 extends p4d implements b55 {
    public int b;
    public /* synthetic */ Object c;
    public final /* synthetic */ qi1 d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public hh1(qi1 qi1Var, String str, n92 n92Var) {
        super(2, n92Var);
        this.d = qi1Var;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        hh1 hh1Var = new hh1(this.d, this.e, n92Var);
        hh1Var.c = obj;
        return hh1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((hh1) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:35:0x00fd, code lost:
    
        if (r6.a(r1, r14) != r7) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x00af A[PHI: r0
      0x00af: PHI (r0v13 java.lang.Object) = (r0v12 java.lang.Object), (r0v24 java.lang.Object) binds: [B:25:0x00ac, B:11:0x0024] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00b3  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 259
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.hh1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
