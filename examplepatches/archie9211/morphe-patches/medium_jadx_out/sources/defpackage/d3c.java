package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class d3c extends p4d implements b55 {
    public final /* synthetic */ int b;
    public Object c;
    public int d;
    public final /* synthetic */ f3c e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ d3c(f3c f3cVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = f3cVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        f3c f3cVar = this.e;
        switch (i) {
            case 0:
                return new d3c(f3cVar, n92Var, 0);
            case 1:
                return new d3c(f3cVar, n92Var, 1);
            default:
                d3c d3cVar = new d3c(f3cVar, n92Var, 2);
                d3cVar.c = obj;
                return d3cVar;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((d3c) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((d3c) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((d3c) create((rj2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:28:0x0092, code lost:
    
        if (r6.a(r9, r10) == r0) goto L29;
     */
    /* JADX WARN: Code restructure failed: missing block: B:45:0x00e5, code lost:
    
        if (r6.a(r9, r10) == r0) goto L46;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            Method dump skipped, instruction units count: 252
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.d3c.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
