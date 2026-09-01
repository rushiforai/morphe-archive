package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gb4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public final /* synthetic */ ib4 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ gb4(ib4 ib4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = ib4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        ib4 ib4Var = this.e;
        switch (i) {
            case 0:
                return new gb4(ib4Var, n92Var, 0);
            default:
                return new gb4(ib4Var, n92Var, 1);
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
        return ((gb4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x009a A[PHI: r1 r11
      0x009a: PHI (r1v15 java.lang.Object) = (r1v14 java.lang.Object), (r1v14 java.lang.Object), (r1v19 java.lang.Object) binds: [B:18:0x0073, B:22:0x0093, B:11:0x0030] A[DONT_GENERATE, DONT_INLINE]
      0x009a: PHI (r11v5 tb2) = (r11v3 tb2), (r11v3 tb2), (r11v7 tb2) binds: [B:18:0x0073, B:22:0x0093, B:11:0x0030] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:28:0x00a0  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0136 A[PHI: r0
      0x0136: PHI (r0v6 java.lang.Object) = (r0v5 java.lang.Object), (r0v5 java.lang.Object), (r0v13 java.lang.Object) binds: [B:46:0x010f, B:50:0x012f, B:40:0x00d5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x013c  */
    /* JADX WARN: Removed duplicated region for block: B:62:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:66:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r19) {
        /*
            Method dump skipped, instruction units count: 346
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gb4.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
