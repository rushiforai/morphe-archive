package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ga5 extends p4d implements b55 {
    public o33 b;
    public Object c;
    public int d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ hx4 g;
    public final /* synthetic */ String h;
    public final /* synthetic */ String i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ga5(hx4 hx4Var, String str, String str2, n92 n92Var) {
        super(2, n92Var);
        this.g = hx4Var;
        this.h = str;
        this.i = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        ga5 ga5Var = new ga5(this.g, this.h, this.i, n92Var);
        ga5Var.f = obj;
        return ga5Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ga5) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x0080, code lost:
    
        if (r0 == r2) goto L21;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r19) {
        /*
            Method dump skipped, instruction units count: 333
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ga5.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
