package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lb8 extends p4d implements b55 {
    public final /* synthetic */ dsd b;
    public final /* synthetic */ db8 c;
    public final /* synthetic */ ba8 d;
    public final /* synthetic */ s68 e;
    public final /* synthetic */ upc f;
    public final /* synthetic */ d12 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public lb8(dsd dsdVar, db8 db8Var, ba8 ba8Var, s68 s68Var, upc upcVar, d12 d12Var, n92 n92Var) {
        super(2, n92Var);
        this.b = dsdVar;
        this.c = db8Var;
        this.d = ba8Var;
        this.e = s68Var;
        this.f = upcVar;
        this.g = d12Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new lb8(this.b, this.c, this.d, this.e, this.f, this.g, n92Var);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        lb8 lb8Var = (lb8) create((sb2) obj, (n92) obj2);
        c1e c1eVar = c1e.a;
        lb8Var.invokeSuspend(c1eVar);
        return c1eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x00d1  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r21) {
        /*
            Method dump skipped, instruction units count: 217
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.lb8.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
