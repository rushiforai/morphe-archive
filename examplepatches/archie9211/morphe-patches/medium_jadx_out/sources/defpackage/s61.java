package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s61 extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public int c;
    public final /* synthetic */ ou d;
    public final /* synthetic */ float e;
    public final /* synthetic */ boolean f;
    public final /* synthetic */ c56 g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s61(ou ouVar, float f, boolean z, t61 t61Var, c56 c56Var, n92 n92Var) {
        super(2, n92Var);
        this.d = ouVar;
        this.e = f;
        this.f = z;
        this.h = t61Var;
        this.g = c56Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.h;
        switch (i) {
            case 0:
                c56 c56Var = this.g;
                return new s61(this.d, this.e, this.f, (t61) obj2, c56Var, n92Var);
            default:
                return new s61(this.d, this.e, this.f, this.g, (l78) obj2, n92Var);
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
        return ((s61) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x004c, code lost:
    
        if (r4.f(r12, r13) == r0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:18:0x005b, code lost:
    
        if (defpackage.lw3.a(r4, r5, r13, r9, r12) == r0) goto L19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:53:?, code lost:
    
        return r0;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r13) {
        /*
            Method dump skipped, instruction units count: 242
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.s61.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s61(ou ouVar, float f, boolean z, c56 c56Var, l78 l78Var, n92 n92Var) {
        super(2, n92Var);
        this.d = ouVar;
        this.e = f;
        this.f = z;
        this.g = c56Var;
        this.h = l78Var;
    }
}
