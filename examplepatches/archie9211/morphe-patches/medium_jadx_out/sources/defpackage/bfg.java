package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bfg extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ jrf e;
    public final /* synthetic */ tag f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bfg(jrf jrfVar, tag tagVar, n92 n92Var) {
        super(2, n92Var);
        this.e = jrfVar;
        this.f = tagVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        tag tagVar = this.f;
        jrf jrfVar = this.e;
        switch (i) {
            case 0:
                bfg bfgVar = new bfg(tagVar, jrfVar, n92Var);
                bfgVar.d = obj;
                return bfgVar;
            default:
                bfg bfgVar2 = new bfg(jrfVar, tagVar, n92Var);
                bfgVar2.d = obj;
                return bfgVar2;
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
        return ((bfg) create(fdgVar, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        fdg fdgVar;
        fdg fdgVar2;
        int i = this.b;
        c1e c1eVar = c1e.a;
        tag tagVar = this.f;
        jrf jrfVar = this.e;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    fdg fdgVar3 = (fdg) this.d;
                    peg pegVar = new peg(tagVar, jrfVar, fdgVar3, (n92) null);
                    this.d = fdgVar3;
                    this.c = 1;
                    wcg wcgVar = new wcg(74, pegVar, null);
                    if (wcgVar != tb2Var) {
                        fdgVar = fdgVar3;
                        obj = wcgVar;
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                fdgVar = (fdg) this.d;
                br7.v(obj);
                this.d = null;
                this.c = 2;
                if (((wcg) obj).a(fdgVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    fdg fdgVar4 = (fdg) this.d;
                    zqf zqfVarA = arf.A();
                    String strW = jrfVar.y().w();
                    zqfVarA.c();
                    ((arf) zqfVarA.b).C(strW);
                    pmf pmfVarV = jrfVar.A().v();
                    zqfVarA.c();
                    ((arf) zqfVarA.b).G(pmfVarV);
                    pmf pmfVarY = jrfVar.y().y();
                    zqfVarA.c();
                    ((arf) zqfVarA.b).D(pmfVarY);
                    String strZ = jrfVar.y().z();
                    zqfVarA.c();
                    ((arf) zqfVarA.b).E(strZ);
                    String strA = jrfVar.y().A();
                    zqfVarA.c();
                    ((arf) zqfVarA.b).F(strA);
                    arf arfVar = (arf) zqfVarA.e();
                    deg degVar = (deg) tagVar.b;
                    this.d = fdgVar4;
                    this.c = 1;
                    wcg wcgVar2 = new wcg(degVar.g, new peg(degVar, arfVar, (n92) null, 2), null);
                    if (wcgVar2 != tb2Var2) {
                        fdgVar2 = fdgVar4;
                        obj = wcgVar2;
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                fdgVar2 = (fdg) this.d;
                br7.v(obj);
                this.d = null;
                this.c = 2;
                if (((wcg) obj).a(fdgVar2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public bfg(tag tagVar, jrf jrfVar, n92 n92Var) {
        super(2, n92Var);
        this.f = tagVar;
        this.e = jrfVar;
    }
}
