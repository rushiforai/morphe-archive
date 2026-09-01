package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oza extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sza d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ oza(sza szaVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = szaVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new oza(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new oza(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new oza(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new oza(this.d, this.e, this.f, n92Var, 3);
            default:
                return new oza(this.d, this.e, this.f, n92Var, 4);
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
        return ((oza) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        oza ozaVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        sza szaVar = this.d;
        switch (i) {
            case 0:
                oza ozaVar2 = this;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = ozaVar2.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = szaVar.l;
                    String str = szaVar.b;
                    String str2 = szaVar.n;
                    ozaVar2.c = 1;
                    obj = n0cVar.I(ozaVar2, ozaVar2.f, ozaVar2.e, str, str2);
                    ozaVar2 = ozaVar2;
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
                r6c r6cVar = szaVar.v;
                wya wyaVar = new wya((oq1) obj);
                ozaVar2.c = 2;
                if (r6cVar.a(wyaVar, ozaVar2) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    mya myaVar = szaVar.m;
                    String str3 = szaVar.b;
                    String str4 = szaVar.n;
                    this.c = 1;
                    obj = myaVar.p(this.e, str3, this.f, str4, this);
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
                r6c r6cVar2 = szaVar.v;
                xya xyaVar = new xya((x7d) obj);
                this.c = 2;
                if (r6cVar2.a(xyaVar, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = szaVar.l;
                    String str5 = szaVar.b;
                    String str6 = szaVar.n;
                    this.c = 1;
                    obj = n0cVar2.k0(this.e, str5, this.f, str6, this);
                    if (obj != tb2Var3) {
                    }
                    return tb2Var3;
                }
                if (i4 != 1) {
                    if (i4 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar3 = szaVar.v;
                wya wyaVar2 = new wya((xq1) obj);
                this.c = 2;
                if (r6cVar3.a(wyaVar2, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    mya myaVar2 = szaVar.m;
                    String str7 = szaVar.b;
                    String str8 = szaVar.n;
                    this.c = 1;
                    obj = myaVar2.K(this.e, str7, this.f, str8, this);
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
                r6c r6cVar4 = szaVar.v;
                xya xyaVar2 = new xya((a8d) obj);
                this.c = 2;
                if (r6cVar4.a(xyaVar2, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            default:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    kbe kbeVar = szaVar.k;
                    String str9 = szaVar.b;
                    String str10 = szaVar.n;
                    this.c = 1;
                    obj = kbeVar.h(this, this.f, this.e, str9, str10);
                    ozaVar = this;
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
                ozaVar = this;
                r6c r6cVar5 = szaVar.v;
                yya yyaVar = new yya((b8e) obj);
                ozaVar.c = 2;
                if (r6cVar5.a(yyaVar, ozaVar) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
        }
    }
}
