package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yxf extends p4d implements b55 {
    public final /* synthetic */ int b = 0;
    public String c;
    public long d;
    public int e;
    public final /* synthetic */ String f;
    public Object g;
    public Object h;
    public Object i;
    public final /* synthetic */ Object j;
    public final /* synthetic */ Object k;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yxf(nig nigVar, String str, String str2, arf arfVar, long j, n92 n92Var) {
        super(2, n92Var);
        this.j = nigVar;
        this.c = str;
        this.f = str2;
        this.k = arfVar;
        this.d = j;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.k;
        Object obj3 = this.j;
        switch (i) {
            case 0:
                long j = this.d;
                yxf yxfVar = new yxf((nig) obj3, this.c, this.f, (arf) obj2, j, n92Var);
                yxfVar.i = obj;
                return yxfVar;
            default:
                return new yxf((o2b) obj3, (fa4) obj2, this.f, n92Var);
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((yxf) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((yxf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:49:0x0159, code lost:
    
        if (r0 != r3) goto L50;
     */
    /* JADX WARN: Removed duplicated region for block: B:48:0x014f  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x016e  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r23) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 406
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yxf.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yxf(o2b o2bVar, fa4 fa4Var, String str, n92 n92Var) {
        super(2, n92Var);
        this.j = o2bVar;
        this.k = fa4Var;
        this.f = str;
    }
}
