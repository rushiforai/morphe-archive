package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class dv9 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sw9 d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ dv9(sw9 sw9Var, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sw9Var;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.e;
        sw9 sw9Var = this.d;
        switch (i) {
            case 0:
                return new dv9(sw9Var, str, n92Var, 0);
            case 1:
                return new dv9(sw9Var, str, n92Var, 1);
            case 2:
                return new dv9(sw9Var, str, n92Var, 2);
            case 3:
                return new dv9(sw9Var, str, n92Var, 3);
            case 4:
                return new dv9(sw9Var, str, n92Var, 4);
            case 5:
                return new dv9(sw9Var, str, n92Var, 5);
            case 6:
                return new dv9(sw9Var, str, n92Var, 6);
            default:
                return new dv9(sw9Var, str, n92Var, 7);
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
        return ((dv9) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objC;
        int i = this.b;
        String str = this.e;
        c1e c1eVar = c1e.a;
        sw9 sw9Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar = sw9Var.x0;
                jt9 jt9Var = new jt9(str, sw9Var.F0);
                this.c = 1;
                return r6cVar.a(jt9Var, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar2 = sw9Var.x0;
                ((i03) sw9Var.g0).getClass();
                it9 it9Var = new it9(i03.t, str);
                this.c = 1;
                return r6cVar2.a(it9Var, this) == tb2Var2 ? tb2Var2 : c1eVar;
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
                r6c r6cVar3 = sw9Var.x0;
                ((i03) sw9Var.g0).getClass();
                it9 it9Var2 = new it9(i03.w, str);
                this.c = 1;
                return r6cVar3.a(it9Var2, this) == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 != 0) {
                    if (i5 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar4 = sw9Var.x0;
                ns9 ns9Var = new ns9(str, sw9Var.F0);
                this.c = 1;
                return r6cVar4.a(ns9Var, this) == tb2Var4 ? tb2Var4 : c1eVar;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar5 = sw9Var.x0;
                ys9 ys9Var = new ys9(str);
                this.c = 1;
                return r6cVar5.a(ys9Var, this) == tb2Var5 ? tb2Var5 : c1eVar;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                r6c r6cVar6 = sw9Var.x0;
                ws9 ws9Var = new ws9(str);
                this.c = 1;
                return r6cVar6.a(ws9Var, this) == tb2Var6 ? tb2Var6 : c1eVar;
            case 6:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 != 0) {
                    if (i8 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                xpc xpcVar = sw9Var.z0;
                pr9 pr9Var = new pr9(new j4b(str));
                this.c = 1;
                xpcVar.a(pr9Var, this);
                return c1eVar == tb2Var7 ? tb2Var7 : c1eVar;
            default:
                r6c r6cVar7 = sw9Var.x0;
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                if (i9 == 0) {
                    br7.v(obj);
                    a1a a1aVar = sw9Var.U;
                    g08 g08Var = sw9Var.G0;
                    this.c = 1;
                    objC = a1aVar.C(this.e, "", null, g08Var, this);
                    if (objC != tb2Var8) {
                    }
                    return tb2Var8;
                }
                if (i9 != 1) {
                    if (i9 == 2 || i9 == 3 || i9 == 4) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                objC = obj;
                c9b c9bVar = (c9b) objC;
                if (c9bVar instanceof b9b) {
                    this.c = 2;
                    if (r6cVar7.a(vt9.a, this) != tb2Var8) {
                        return c1eVar;
                    }
                } else if (c9bVar instanceof a9b) {
                    this.c = 3;
                    if (r6cVar7.a(ut9.a, this) != tb2Var8) {
                        return c1eVar;
                    }
                } else {
                    if (!(c9bVar instanceof z8b)) {
                        ygf.a();
                        return null;
                    }
                    tt9 tt9Var = new tt9(m4.I(((z8b) c9bVar).a));
                    this.c = 4;
                    if (r6cVar7.a(tt9Var, this) != tb2Var8) {
                        return c1eVar;
                    }
                }
                return tb2Var8;
        }
    }
}
