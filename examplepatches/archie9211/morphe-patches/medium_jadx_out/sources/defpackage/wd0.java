package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wd0 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ boolean d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wd0(Object obj, boolean z, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.d = z;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        boolean z = this.d;
        Object obj2 = this.e;
        switch (i) {
            case 0:
                return new wd0((yd0) obj2, z, n92Var, 0);
            case 1:
                return new wd0((ph3) obj2, z, n92Var, 1);
            case 2:
                return new wd0((sg7) obj2, z, n92Var, 2);
            case 3:
                return new wd0((m98) obj2, z, n92Var, 3);
            case 4:
                return new wd0(z, (ko9) obj2, n92Var, 4);
            case 5:
                return new wd0(z, (v7c) obj2, n92Var, 5);
            case 6:
                return new wd0(z, (sl) obj2, n92Var, 6);
            default:
                return new wd0((lid) obj2, z, n92Var, 7);
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
        return ((wd0) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:119:0x0271  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x0286  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x02a9  */
    /* JADX WARN: Removed duplicated region for block: B:171:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:172:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:176:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:83:0x017e  */
    /* JADX WARN: Removed duplicated region for block: B:96:0x021c  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r60) {
        /*
            Method dump skipped, instruction units count: 872
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wd0.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ wd0(boolean z, Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = z;
        this.e = obj;
    }
}
