package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ml extends p4d implements x45 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ml(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(1, n92Var);
        this.b = i;
        this.f = obj;
        this.d = obj2;
        this.e = obj3;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        int i = this.b;
        Object obj = this.d;
        Object obj2 = this.e;
        Object obj3 = this.f;
        switch (i) {
            case 0:
                return new ml((sl) obj3, this.d, (d55) obj2, n92Var, 0);
            case 1:
                return new ml((tl) obj3, this.d, (d55) obj2, n92Var, 1);
            case 2:
                return new ml((ul) obj3, this.d, (d55) obj2, n92Var, 2);
            case 3:
                return new ml((b59) obj3, (ird) obj, (b55) obj2, n92Var, 3);
            default:
                return new ml((pod) obj3, (mt2) obj, (s78) obj2, n92Var, 4);
        }
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = (n92) obj;
        switch (i) {
        }
        return ((ml) create(n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Code restructure failed: missing block: B:20:0x004c, code lost:
    
        if (defpackage.wo7.z(1500, r11, r10) == r0) goto L21;
     */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r11) {
        /*
            Method dump skipped, instruction units count: 326
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ml.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
