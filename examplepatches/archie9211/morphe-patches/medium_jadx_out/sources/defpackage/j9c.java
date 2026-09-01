package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j9c extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public final /* synthetic */ l9c e;
    public final /* synthetic */ String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ j9c(l9c l9cVar, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = l9cVar;
        this.f = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.f;
        l9c l9cVar = this.e;
        switch (i) {
            case 0:
                return new j9c(l9cVar, str, n92Var, 0);
            default:
                return new j9c(l9cVar, str, n92Var, 1);
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
        return ((j9c) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x007a A[PHI: r0
      0x007a: PHI (r0v17 java.lang.Object) = (r0v16 java.lang.Object), (r0v16 java.lang.Object), (r0v22 java.lang.Object) binds: [B:17:0x0060, B:19:0x0077, B:11:0x002a] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x010f A[PHI: r0 r3
      0x010f: PHI (r0v6 java.lang.Object) = (r0v5 java.lang.Object), (r0v5 java.lang.Object), (r0v11 java.lang.Object) binds: [B:40:0x00f5, B:42:0x010c, B:34:0x00bc] A[DONT_GENERATE, DONT_INLINE]
      0x010f: PHI (r3v4 java.lang.String) = (r3v3 java.lang.String), (r3v3 java.lang.String), (r3v6 java.lang.String) binds: [B:40:0x00f5, B:42:0x010c, B:34:0x00bc] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0115  */
    /* JADX WARN: Removed duplicated region for block: B:52:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:56:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r16) {
        /*
            Method dump skipped, instruction units count: 312
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j9c.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
