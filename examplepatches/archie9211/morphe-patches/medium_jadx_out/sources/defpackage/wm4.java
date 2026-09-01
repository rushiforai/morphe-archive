package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wm4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public int d;
    public Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wm4(que queVar, int i, Object obj, n92 n92Var, int i2) {
        super(2, n92Var);
        this.b = i2;
        this.e = queVar;
        this.d = i;
        this.f = obj;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                return new wm4((xm4) this.e, this.d, (String) obj2, n92Var, 0);
            case 1:
                return new wm4((x47) obj2, n92Var);
            case 2:
                return new wm4((rv2) this.e, (wp9) obj2, this.d, n92Var, 2);
            case 3:
                return new wm4((sw9) this.e, this.d, (bhc) obj2, n92Var, 3);
            default:
                return new wm4((ide) this.e, (String) obj2, this.d, n92Var, 4);
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
        return ((wm4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:25:0x00ef, code lost:
    
        if (r12.a(r1, r64) == r13) goto L37;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x01a7, code lost:
    
        if (r12.a(r2, r64) == r13) goto L37;
     */
    /* JADX WARN: Removed duplicated region for block: B:100:0x0335  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x02c8 A[PHI: r4
      0x02c8: PHI (r4v6 java.lang.Object) = (r4v5 java.lang.Object), (r4v8 java.lang.Object) binds: [B:73:0x02c4, B:67:0x02a1] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x02db A[PHI: r4 r5
      0x02db: PHI (r4v9 java.util.List) = (r4v7 java.util.List), (r4v13 java.util.List) binds: [B:76:0x02d7, B:66:0x0297] A[DONT_GENERATE, DONT_INLINE]
      0x02db: PHI (r5v4 java.lang.Object) = (r5v3 java.lang.Object), (r5v7 java.lang.Object) binds: [B:76:0x02d7, B:66:0x0297] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:81:0x02ed A[PHI: r4
      0x02ed: PHI (r4v14 java.lang.Object) = (r4v11 java.lang.Object), (r4v18 java.lang.Object) binds: [B:79:0x02ea, B:65:0x0291] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x02fe  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x0308  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x0320  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0325  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r65) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 952
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wm4.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wm4(x47 x47Var, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.f = x47Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wm4(Object obj, Object obj2, int i, n92 n92Var, int i2) {
        super(2, n92Var);
        this.b = i2;
        this.e = obj;
        this.f = obj2;
        this.d = i;
    }
}
