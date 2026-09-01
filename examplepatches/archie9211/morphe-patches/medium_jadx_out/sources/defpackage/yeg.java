package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yeg extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ tag e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yeg(tag tagVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = tagVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        tag tagVar = this.e;
        switch (i) {
            case 0:
                yeg yegVar = new yeg(tagVar, n92Var, 0);
                yegVar.d = obj;
                return yegVar;
            default:
                yeg yegVar2 = new yeg(tagVar, n92Var, 1);
                yegVar2.d = obj;
                return yegVar2;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        fdg fdgVar = (fdg) obj;
        n92 n92Var = (n92) obj2;
        switch (i) {
        }
        return ((yeg) create(fdgVar, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        fdg fdgVar;
        fdg fdgVar2;
        int i = this.b;
        tag tagVar = this.e;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    fdg fdgVar3 = (fdg) this.d;
                    deg degVar = (deg) tagVar.b;
                    this.d = fdgVar3;
                    this.c = 1;
                    ycg ycgVarC = veg.c(degVar);
                    if (ycgVarC == tb2Var) {
                        return tb2Var;
                    }
                    fdgVar = fdgVar3;
                    obj = ycgVarC;
                } else {
                    if (i2 != 1) {
                        br7.v(obj);
                        return (arf) obj;
                    }
                    fdgVar = (fdg) this.d;
                    br7.v(obj);
                }
                this.d = null;
                this.c = 2;
                obj = ((ycg) obj).a.invoke(fdgVar, this);
                if (obj == tb2Var) {
                    return tb2Var;
                }
                return (arf) obj;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    fdg fdgVar4 = (fdg) this.d;
                    kyc kycVar = new kyc(tagVar, fdgVar4, n92Var, 20);
                    this.d = fdgVar4;
                    this.c = 1;
                    wcg wcgVar = new wcg(75, kycVar, null);
                    if (wcgVar != tb2Var2) {
                        fdgVar2 = fdgVar4;
                        obj = wcgVar;
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    br7.v(obj);
                    return obj;
                }
                fdgVar2 = (fdg) this.d;
                br7.v(obj);
                this.d = null;
                this.c = 2;
                Object objA = ((wcg) obj).a(fdgVar2, this);
                if (objA != tb2Var2) {
                    return objA;
                }
                return tb2Var2;
        }
    }
}
