package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zv1 extends p4d implements b55 {
    public Object[] b;
    public wj1 c;
    public byte[] d;
    public int e;
    public int f;
    public int g;
    public int h;
    public /* synthetic */ Object i;
    public final /* synthetic */ bo4[] j;
    public final /* synthetic */ m45 k;
    public final /* synthetic */ c55 l;
    public final /* synthetic */ do4 m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zv1(n92 n92Var, do4 do4Var, m45 m45Var, c55 c55Var, bo4[] bo4VarArr) {
        super(2, n92Var);
        this.j = bo4VarArr;
        this.k = m45Var;
        this.l = c55Var;
        this.m = do4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        zv1 zv1Var = new zv1(n92Var, this.m, this.k, this.l, this.j);
        zv1Var.i = obj;
        return zv1Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((zv1) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:46:0x0135, code lost:
    
        if (r15.f(r14, r8, r20) == r3) goto L47;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x00c0  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00d0 A[LOOP:0: B:29:0x00d0->B:37:0x00f1, LOOP_START, PHI: r4 r14
      0x00d0: PHI (r4v4 int) = (r4v3 int), (r4v5 int) binds: [B:26:0x00cb, B:37:0x00f1] A[DONT_GENERATE, DONT_INLINE]
      0x00d0: PHI (r14v6 r06) = (r14v5 r06), (r14v10 r06) binds: [B:26:0x00cb, B:37:0x00f1] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:46:0x0135 -> B:8:0x002e). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:49:0x013a -> B:44:0x011a). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r21) {
        /*
            Method dump skipped, instruction units count: 318
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zv1.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
