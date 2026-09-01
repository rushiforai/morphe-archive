package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class cdd extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ odd d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ cdd(odd oddVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = oddVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        odd oddVar = this.d;
        switch (i) {
            case 0:
                return new cdd(oddVar, n92Var, 0);
            case 1:
                return new cdd(oddVar, n92Var, 1);
            case 2:
                return new cdd(oddVar, n92Var, 2);
            case 3:
                return new cdd(oddVar, n92Var, 3);
            default:
                return new cdd(oddVar, n92Var, 4);
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((cdd) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((cdd) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((cdd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((cdd) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((cdd) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:111:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x005a  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x009b  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x009f  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00b7  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x00bb  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00bf  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r8) {
        /*
            Method dump skipped, instruction units count: 390
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cdd.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
