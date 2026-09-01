package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dwb extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ float e;
    public final /* synthetic */ Object f;
    public final /* synthetic */ Object g;
    public final /* synthetic */ Object h;
    public final /* synthetic */ Object i;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dwb(c5d c5dVar, float f, boc bocVar, koc kocVar, ou ouVar, ou ouVar2, n92 n92Var) {
        super(2, n92Var);
        this.d = c5dVar;
        this.e = f;
        this.f = bocVar;
        this.g = kocVar;
        this.h = ouVar;
        this.i = ouVar2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.g;
        Object obj3 = this.f;
        Object obj4 = this.i;
        Object obj5 = this.h;
        switch (i) {
            case 0:
                float f = this.e;
                dwb dwbVar = new dwb(this.f, this.g, (hwb) obj5, (dsd) obj4, f, n92Var);
                dwbVar.d = obj;
                return dwbVar;
            case 1:
                dwb dwbVar2 = new dwb(this.e, (boc) obj3, (koc) obj2, (ou) obj5, (ou) obj4, n92Var);
                dwbVar2.d = obj;
                return dwbVar2;
            default:
                return new dwb((c5d) this.d, this.e, (boc) obj3, (koc) obj2, (ou) obj5, (ou) obj4, n92Var);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((dwb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((dwb) create((z4d) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((dwb) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00bf  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r22) {
        /*
            Method dump skipped, instruction units count: 338
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.dwb.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dwb(float f, boc bocVar, koc kocVar, ou ouVar, ou ouVar2, n92 n92Var) {
        super(2, n92Var);
        this.e = f;
        this.f = bocVar;
        this.g = kocVar;
        this.h = ouVar;
        this.i = ouVar2;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public dwb(Object obj, Object obj2, hwb hwbVar, dsd dsdVar, float f, n92 n92Var) {
        super(2, n92Var);
        this.f = obj;
        this.g = obj2;
        this.h = hwbVar;
        this.i = dsdVar;
        this.e = f;
    }
}
