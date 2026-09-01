package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class av extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public int c;
    public final /* synthetic */ float d;
    public Object e;
    public Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public av(ub7 ub7Var, bc7 bc7Var, float f, zb7 zb7Var, l78 l78Var, n92 n92Var) {
        super(2, n92Var);
        this.e = ub7Var;
        this.f = bc7Var;
        this.d = f;
        this.g = zb7Var;
        this.h = l78Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.h;
        Object obj3 = this.g;
        switch (i) {
            case 0:
                return new av((ub7) this.e, (bc7) this.f, this.d, (zb7) obj3, (l78) obj2, n92Var);
            case 1:
                return new av(this.d, (az2) obj3, (xrb) obj2, n92Var);
            default:
                return new av((iic) this.f, this.d, (x45) obj3, (xrb) obj2, n92Var);
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
        return ((av) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:72:0x01b0, code lost:
    
        if (defpackage.f76.y(r0, (defpackage.bc7) r16.f, r16.d, null, r0.e(), (defpackage.zb7) r5, r16, 514) == r12) goto L73;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v7, types: [fic] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 444
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.av.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public av(float f, az2 az2Var, xrb xrbVar, n92 n92Var) {
        super(2, n92Var);
        this.d = f;
        this.g = az2Var;
        this.h = xrbVar;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public av(iic iicVar, float f, x45 x45Var, xrb xrbVar, n92 n92Var) {
        super(2, n92Var);
        this.f = iicVar;
        this.d = f;
        this.g = x45Var;
        this.h = xrbVar;
    }
}
