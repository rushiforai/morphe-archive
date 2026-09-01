package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dme extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ime d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dme(ime imeVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = imeVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new dme(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new dme(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new dme(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new dme(this.d, this.e, this.f, n92Var, 3);
            case 4:
                return new dme(this.d, this.e, this.f, n92Var, 4);
            case 5:
                return new dme(this.d, this.e, this.f, n92Var, 5);
            default:
                return new dme(this.d, this.e, this.f, n92Var, 6);
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
        return ((dme) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        dme dmeVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        ime imeVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    tl tlVar = imeVar.e;
                    g08 g08Var = imeVar.r;
                    String str = g08Var.a;
                    String str2 = g08Var.c;
                    this.c = 1;
                    obj = tlVar.f(this, this.f, this.e, str, str2);
                    if (obj != tb2Var) {
                    }
                    return tb2Var;
                }
                if (i2 != 1) {
                    if (i2 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar = imeVar.l;
                qle qleVar = new qle((xs4) obj);
                this.c = 2;
                if (r6cVar.a(qleVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                dme dmeVar2 = this;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = dmeVar2.c;
                if (i3 == 0) {
                    br7.v(obj);
                    pkf pkfVar = imeVar.f;
                    g08 g08Var2 = imeVar.r;
                    String str3 = g08Var2.a;
                    String str4 = g08Var2.c;
                    dmeVar2.c = 1;
                    obj = pkfVar.n(dmeVar2.e, str3, dmeVar2.f, str4, dmeVar2);
                    dmeVar2 = dmeVar2;
                    if (obj != tb2Var2) {
                    }
                    return tb2Var2;
                }
                if (i3 != 1) {
                    if (i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = imeVar.l;
                ule uleVar = new ule((t7b) obj);
                dmeVar2.c = 2;
                if (r6cVar2.a(uleVar, dmeVar2) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xpc xpcVar = imeVar.n;
                mle mleVar = new mle(new ms0(this.e, this.f));
                this.c = 1;
                xpcVar.a(mleVar, this);
                return c1eVar == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                dme dmeVar3 = this;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = dmeVar3.c;
                if (i5 == 0) {
                    br7.v(obj);
                    pkf pkfVar2 = imeVar.f;
                    g08 g08Var3 = imeVar.r;
                    String str5 = g08Var3.a;
                    String str6 = g08Var3.c;
                    dmeVar3.c = 1;
                    obj = pkfVar2.L(dmeVar3.e, str5, dmeVar3.f, str6, dmeVar3);
                    dmeVar3 = dmeVar3;
                    if (obj != tb2Var4) {
                    }
                    return tb2Var4;
                }
                if (i5 != 1) {
                    if (i5 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar3 = imeVar.l;
                ule uleVar2 = new ule((t7b) obj);
                dmeVar3.c = 2;
                if (r6cVar3.a(uleVar2, dmeVar3) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    tl tlVar2 = imeVar.e;
                    g08 g08Var4 = imeVar.r;
                    String str7 = g08Var4.a;
                    String str8 = g08Var4.c;
                    this.c = 1;
                    obj = tlVar2.t(this, this.f, this.e, str7, str8);
                    if (obj != tb2Var5) {
                    }
                    return tb2Var5;
                }
                if (i6 != 1) {
                    if (i6 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar4 = imeVar.l;
                qle qleVar2 = new qle((a0e) obj);
                this.c = 2;
                if (r6cVar4.a(qleVar2, this) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    tl tlVar3 = imeVar.e;
                    g08 g08Var5 = imeVar.r;
                    String str9 = g08Var5.a;
                    String str10 = g08Var5.c;
                    this.c = 1;
                    obj = tlVar3.w(this, this.f, this.e, str9, str10);
                    if (obj != tb2Var6) {
                    }
                    return tb2Var6;
                }
                if (i7 != 1) {
                    if (i7 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar5 = imeVar.l;
                qle qleVar3 = new qle((t0e) obj);
                this.c = 2;
                if (r6cVar5.a(qleVar3, this) != tb2Var6) {
                    return c1eVar;
                }
                return tb2Var6;
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    tl tlVar4 = imeVar.e;
                    g08 g08Var6 = imeVar.r;
                    String str11 = g08Var6.a;
                    String str12 = g08Var6.c;
                    this.c = 1;
                    obj = tlVar4.v(this, this.f, this.e, str11, str12);
                    dmeVar = this;
                    if (obj != tb2Var7) {
                    }
                    return tb2Var7;
                }
                if (i8 != 1) {
                    if (i8 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                dmeVar = this;
                r6c r6cVar6 = imeVar.l;
                qle qleVar4 = new qle((k0e) obj);
                dmeVar.c = 2;
                if (r6cVar6.a(qleVar4, dmeVar) != tb2Var7) {
                    return c1eVar;
                }
                return tb2Var7;
        }
    }
}
