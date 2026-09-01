package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l11 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ou d;
    public final /* synthetic */ float e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ c56 g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l11(ou ouVar, float f, boolean z, Object obj, c56 c56Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = ouVar;
        this.e = f;
        this.f = z;
        this.g = c56Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new l11(this.d, this.e, this.f, null, this.g, n92Var, 0);
            default:
                return new l11(this.d, this.e, this.f, null, this.g, n92Var, 1);
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
        return ((l11) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:44:0x00a7  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r15) {
        /*
            Method dump skipped, instruction units count: 340
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l11.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
