package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lc1 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public final /* synthetic */ id1 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ lc1(int i, id1 id1Var, n92 n92Var) {
        super(2, n92Var);
        this.b = i;
        this.e = id1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        id1 id1Var = this.e;
        switch (i) {
            case 0:
                return new lc1(0, id1Var, n92Var);
            case 1:
                return new lc1(1, id1Var, n92Var);
            case 2:
                return new lc1(2, id1Var, n92Var);
            default:
                return new lc1(3, id1Var, n92Var);
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
        return ((lc1) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:143:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:148:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:152:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x006f A[PHI: r2
      0x006f: PHI (r2v26 java.lang.Object) = (r2v25 java.lang.Object), (r2v25 java.lang.Object), (r2v31 java.lang.Object) binds: [B:19:0x005d, B:21:0x006c, B:11:0x0029] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0102 A[PHI: r2
      0x0102: PHI (r2v19 java.lang.Object) = (r2v18 java.lang.Object), (r2v20 java.lang.Object) binds: [B:57:0x00ee, B:62:0x0101] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0108  */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0177 A[PHI: r2
      0x0177: PHI (r2v10 java.lang.Object) = (r2v9 java.lang.Object), (r2v9 java.lang.Object), (r2v15 java.lang.Object) binds: [B:86:0x0165, B:88:0x0174, B:78:0x0132] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:92:0x017d  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r16) {
        /*
            Method dump skipped, instruction units count: 604
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lc1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
