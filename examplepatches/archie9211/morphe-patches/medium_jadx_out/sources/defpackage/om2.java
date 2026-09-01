package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class om2 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public ird c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ boolean g;
    public final /* synthetic */ elb h;
    public final /* synthetic */ x45 i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ om2(boolean z, boolean z2, elb elbVar, n92 n92Var, x45 x45Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = z;
        this.g = z2;
        this.h = elbVar;
        this.i = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                om2 om2Var = new om2(this.f, this.g, this.h, n92Var, this.i, 0);
                om2Var.e = obj;
                return om2Var;
            default:
                om2 om2Var2 = new om2(this.f, this.g, this.h, n92Var, this.i, 1);
                om2Var2.e = obj;
                return om2Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        jrd jrdVar = (jrd) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((om2) create(jrdVar, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:103:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:39:0x00a9 A[PHI: r1 r15
      0x00a9: PHI (r1v21 jrd) = (r1v18 jrd), (r1v24 jrd) binds: [B:37:0x00a6, B:12:0x0031] A[DONT_GENERATE, DONT_INLINE]
      0x00a9: PHI (r15v30 java.lang.Object) = (r15v29 java.lang.Object), (r15v0 java.lang.Object) binds: [B:37:0x00a6, B:12:0x0031] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00ab  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00c1  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00cf  */
    /* JADX WARN: Removed duplicated region for block: B:85:0x0173 A[PHI: r1 r15
      0x0173: PHI (r1v9 jrd) = (r1v6 jrd), (r1v12 jrd) binds: [B:83:0x0170, B:58:0x00fa] A[DONT_GENERATE, DONT_INLINE]
      0x0173: PHI (r15v13 java.lang.Object) = (r15v12 java.lang.Object), (r15v0 java.lang.Object) binds: [B:83:0x0170, B:58:0x00fa] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x0175  */
    /* JADX WARN: Removed duplicated region for block: B:92:0x018b  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x0199  */
    /* JADX WARN: Removed duplicated region for block: B:98:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 432
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.om2.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
