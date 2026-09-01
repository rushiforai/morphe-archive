package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cl5 extends p4d implements b55 {
    public rya b;
    public rya c;
    public Object d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ dl5 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cl5(dl5 dl5Var, n92 n92Var) {
        super(2, n92Var);
        this.g = dl5Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        cl5 cl5Var = new cl5(this.g, n92Var);
        cl5Var.f = obj;
        return cl5Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((cl5) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:120:0x029a, code lost:
    
        if (defpackage.r6c.m(r6, r7, r32) != r5) goto L122;
     */
    /* JADX WARN: Code restructure failed: missing block: B:66:0x0186, code lost:
    
        if (r1.a(defpackage.ik5.a, r32) == r5) goto L121;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:116:0x0265  */
    /* JADX WARN: Type inference failed for: r11v0, types: [ey3, java.lang.Object] */
    /* JADX WARN: Type inference failed for: r11v1, types: [java.util.Collection] */
    /* JADX WARN: Type inference failed for: r11v8, types: [java.util.ArrayList] */
    /* JADX WARN: Type inference failed for: r9v1 */
    /* JADX WARN: Type inference failed for: r9v11 */
    /* JADX WARN: Type inference failed for: r9v2, types: [java.lang.Iterable] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r33) {
        /*
            Method dump skipped, instruction units count: 673
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cl5.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
