package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class add extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ odd d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ add(odd oddVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = oddVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new add(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new add(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new add(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new add(this.d, this.e, this.f, n92Var, 3);
            case 4:
                return new add(this.d, this.e, this.f, n92Var, 4);
            case 5:
                return new add(this.d, this.e, this.f, n92Var, 5);
            default:
                return new add(this.d, this.e, this.f, n92Var, 6);
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
        return ((add) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        add addVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        odd oddVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = oddVar.t;
                    String str = oddVar.c;
                    String str2 = oddVar.P;
                    this.c = 1;
                    obj = n0cVar.I(this, this.f, this.e, str, str2);
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
                r6c r6cVar = oddVar.M;
                ecd ecdVar = new ecd((oq1) obj);
                this.c = 2;
                if (r6cVar.a(ecdVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    tl tlVar = oddVar.u;
                    String str3 = oddVar.c;
                    String str4 = oddVar.P;
                    this.c = 1;
                    obj = tlVar.f(this, this.f, this.e, str3, str4);
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
                r6c r6cVar2 = oddVar.M;
                gcd gcdVar = new gcd((xs4) obj);
                this.c = 2;
                if (r6cVar2.a(gcdVar, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    tl tlVar2 = oddVar.u;
                    String str5 = oddVar.c;
                    String str6 = oddVar.P;
                    this.c = 1;
                    obj = tlVar2.t(this, this.f, this.e, str5, str6);
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
                r6c r6cVar3 = oddVar.M;
                gcd gcdVar2 = new gcd((a0e) obj);
                this.c = 2;
                if (r6cVar3.a(gcdVar2, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    tl tlVar3 = oddVar.u;
                    String str7 = oddVar.c;
                    String str8 = oddVar.P;
                    this.c = 1;
                    obj = tlVar3.w(this, this.f, this.e, str7, str8);
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
                r6c r6cVar4 = oddVar.M;
                gcd gcdVar3 = new gcd((t0e) obj);
                this.c = 2;
                if (r6cVar4.a(gcdVar3, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            case 4:
                add addVar2 = this;
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = addVar2.c;
                if (i6 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = oddVar.t;
                    String str9 = oddVar.c;
                    String str10 = oddVar.P;
                    addVar2.c = 1;
                    obj = n0cVar2.k0(addVar2.e, str9, addVar2.f, str10, addVar2);
                    addVar2 = addVar2;
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
                r6c r6cVar5 = oddVar.M;
                ecd ecdVar2 = new ecd((xq1) obj);
                addVar2.c = 2;
                if (r6cVar5.a(ecdVar2, addVar2) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    tl tlVar4 = oddVar.u;
                    String str11 = oddVar.c;
                    String str12 = oddVar.P;
                    this.c = 1;
                    obj = tlVar4.v(this, this.f, this.e, str11, str12);
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
                r6c r6cVar6 = oddVar.M;
                gcd gcdVar4 = new gcd((k0e) obj);
                this.c = 2;
                if (r6cVar6.a(gcdVar4, this) != tb2Var6) {
                    return c1eVar;
                }
                return tb2Var6;
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    kbe kbeVar = oddVar.v;
                    String str13 = oddVar.c;
                    String str14 = oddVar.P;
                    this.c = 1;
                    obj = kbeVar.h(this, this.f, this.e, str13, str14);
                    addVar = this;
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
                addVar = this;
                r6c r6cVar7 = oddVar.M;
                icd icdVar = new icd((b8e) obj);
                addVar.c = 2;
                if (r6cVar7.a(icdVar, addVar) != tb2Var7) {
                    return c1eVar;
                }
                return tb2Var7;
        }
    }
}
