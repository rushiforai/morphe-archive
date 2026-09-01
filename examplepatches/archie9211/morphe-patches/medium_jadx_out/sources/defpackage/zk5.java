package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zk5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public dl5 d;
    public int e;
    public int f;
    public final /* synthetic */ dl5 g;
    public final /* synthetic */ String h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zk5(dl5 dl5Var, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = dl5Var;
        this.h = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.h;
        dl5 dl5Var = this.g;
        switch (i) {
            case 0:
                return new zk5(dl5Var, str, n92Var, 0);
            default:
                return new zk5(dl5Var, str, n92Var, 1);
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
        return ((zk5) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:67:0x01c1, code lost:
    
        if (r1.a(defpackage.kk5.a, r6) != r13) goto L69;
     */
    /* JADX WARN: Removed duplicated region for block: B:25:0x0094  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00c2 A[PHI: r0
      0x00c2: PHI (r0v31 java.lang.Object) = (r0v29 java.lang.Object), (r0v30 java.lang.Object), (r0v40 java.lang.Object) binds: [B:24:0x0092, B:30:0x00bf, B:13:0x0035] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00c8  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0189  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x01d5  */
    /* JADX WARN: Removed duplicated region for block: B:80:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:85:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r21) {
        /*
            Method dump skipped, instruction units count: 504
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zk5.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
