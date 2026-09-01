package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ezf extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public Object d;
    public Object e;
    public Object f;
    public final /* synthetic */ Object g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ezf(xbg xbgVar, nig nigVar, ntf ntfVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 7;
        this.d = xbgVar;
        this.e = nigVar;
        this.g = ntfVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.g;
        switch (i) {
            case 0:
                return new ezf((vwa) this.e, (xbg) this.f, (osf) obj2, n92Var, 0);
            case 1:
                ezf ezfVar = new ezf((xzf) this.e, (String) this.f, (arf) obj2, n92Var, 1);
                ezfVar.d = obj;
                return ezfVar;
            case 2:
                return new ezf((arf) this.e, (fdg) this.f, (b2g) obj2, n92Var, 2);
            case 3:
                ezf ezfVar2 = new ezf((x2g) obj2, n92Var, 3);
                ezfVar2.f = obj;
                return ezfVar2;
            case 4:
                ezf ezfVar3 = new ezf((w3g) this.f, (String) obj2, n92Var, 4);
                ezfVar3.e = obj;
                return ezfVar3;
            case 5:
                ezf ezfVar4 = new ezf((w3g) this.f, (jrf) obj2, n92Var, 5);
                ezfVar4.e = obj;
                return ezfVar4;
            case 6:
                return new ezf((fdg) this.e, (w3g) this.f, (jrf) obj2, n92Var, 6);
            case 7:
                return new ezf((xbg) this.d, (nig) this.e, (ntf) obj2, n92Var);
            default:
                ezf ezfVar5 = new ezf((veg) obj2, n92Var, 8);
                ezfVar5.f = obj;
                return ezfVar5;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((ezf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((ezf) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 2:
                return ((ezf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 3:
                return ((ezf) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 4:
                return ((ezf) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 5:
                return ((ezf) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 6:
                return ((ezf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 7:
                return ((ezf) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((ezf) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:227:0x04b3  */
    /* JADX WARN: Removed duplicated region for block: B:256:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:258:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:261:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:266:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:272:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0130  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0131  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x0155  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r19) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 1228
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ezf.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ezf(Object obj, Object obj2, Object obj3, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = obj;
        this.f = obj2;
        this.g = obj3;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ezf(w3g w3gVar, Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = w3gVar;
        this.g = obj;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ezf(Object obj, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.g = obj;
    }
}
