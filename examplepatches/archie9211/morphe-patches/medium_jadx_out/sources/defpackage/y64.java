package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y64 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ f74 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ y64(f74 f74Var, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = f74Var;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new y64(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new y64(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new y64(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new y64(this.d, this.e, this.f, n92Var, 3);
            case 4:
                return new y64(this.d, this.e, this.f, n92Var, 4);
            case 5:
                return new y64(this.d, this.e, this.f, n92Var, 5);
            default:
                return new y64(this.d, this.e, this.f, n92Var, 6);
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
        return ((y64) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        y64 y64Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        f74 f74Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    tl tlVar = f74Var.e;
                    String str = f74Var.b;
                    String str2 = f74Var.o;
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
                r6c r6cVar = f74Var.r;
                q64 q64Var = new q64((xs4) obj);
                this.c = 2;
                if (r6cVar.a(q64Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    n0c n0cVar = f74Var.d;
                    String str3 = f74Var.b;
                    String str4 = f74Var.o;
                    this.c = 1;
                    obj = n0cVar.I(this, this.f, this.e, str3, str4);
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
                r6c r6cVar2 = f74Var.r;
                r64 r64Var = new r64((oq1) obj);
                this.c = 2;
                if (r6cVar2.a(r64Var, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    tl tlVar2 = f74Var.e;
                    String str5 = f74Var.b;
                    String str6 = f74Var.o;
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
                r6c r6cVar3 = f74Var.r;
                q64 q64Var2 = new q64((a0e) obj);
                this.c = 2;
                if (r6cVar3.a(q64Var2, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            case 3:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    tl tlVar3 = f74Var.e;
                    String str7 = f74Var.b;
                    String str8 = f74Var.o;
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
                r6c r6cVar4 = f74Var.r;
                q64 q64Var3 = new q64((t0e) obj);
                this.c = 2;
                if (r6cVar4.a(q64Var3, this) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    tl tlVar4 = f74Var.e;
                    String str9 = f74Var.b;
                    String str10 = f74Var.o;
                    this.c = 1;
                    obj = tlVar4.v(this, this.f, this.e, str9, str10);
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
                r6c r6cVar5 = f74Var.r;
                q64 q64Var4 = new q64((k0e) obj);
                this.c = 2;
                if (r6cVar5.a(q64Var4, this) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
            case 5:
                y64 y64Var2 = this;
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = y64Var2.c;
                if (i7 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = f74Var.d;
                    String str11 = f74Var.b;
                    String str12 = f74Var.o;
                    y64Var2.c = 1;
                    obj = n0cVar2.k0(y64Var2.e, str11, y64Var2.f, str12, y64Var2);
                    y64Var2 = y64Var2;
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
                r6c r6cVar6 = f74Var.r;
                r64 r64Var2 = new r64((xq1) obj);
                y64Var2.c = 2;
                if (r6cVar6.a(r64Var2, y64Var2) != tb2Var6) {
                    return c1eVar;
                }
                return tb2Var6;
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    kbe kbeVar = f74Var.f;
                    String str13 = f74Var.b;
                    String str14 = f74Var.o;
                    this.c = 1;
                    obj = kbeVar.h(this, this.f, this.e, str13, str14);
                    y64Var = this;
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
                y64Var = this;
                r6c r6cVar7 = f74Var.r;
                s64 s64Var = new s64((b8e) obj);
                y64Var.c = 2;
                if (r6cVar7.a(s64Var, y64Var) != tb2Var7) {
                    return c1eVar;
                }
                return tb2Var7;
        }
    }
}
