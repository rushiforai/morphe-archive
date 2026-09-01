package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vea extends p4d implements b55 {
    public Object b;
    public rya c;
    public int d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ wea g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vea(wea weaVar, n92 n92Var) {
        super(2, n92Var);
        this.g = weaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        vea veaVar = new vea(this.g, n92Var);
        veaVar.f = obj;
        return veaVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((vea) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x00c7, code lost:
    
        if (defpackage.r6c.m(r4, r6, r10) != r1) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x00e2, code lost:
    
        if (r0.a(r2, r10) == r1) goto L36;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            Method dump skipped, instruction units count: 232
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vea.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
