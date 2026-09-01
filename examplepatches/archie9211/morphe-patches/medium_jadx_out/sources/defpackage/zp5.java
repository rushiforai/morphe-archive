package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zp5 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ bq5 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zp5(bq5 bq5Var, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = bq5Var;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new zp5(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new zp5(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new zp5(this.d, this.e, this.f, n92Var, 2);
            case 3:
                return new zp5(this.d, this.e, this.f, n92Var, 3);
            case 4:
                return new zp5(this.d, this.e, this.f, n92Var, 4);
            case 5:
                return new zp5(this.d, this.e, this.f, n92Var, 5);
            default:
                return new zp5(this.d, this.e, this.f, n92Var, 6);
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
        return ((zp5) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        zp5 zp5Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        bq5 bq5Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    tl tlVar = bq5Var.d;
                    String str = bq5Var.b;
                    String str2 = bq5Var.q;
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
                r6c r6cVar = bq5Var.m;
                rp5 rp5Var = new rp5((xs4) obj);
                this.c = 2;
                if (r6cVar.a(rp5Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                zp5 zp5Var2 = this;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = zp5Var2.c;
                if (i3 == 0) {
                    br7.v(obj);
                    pkf pkfVar = bq5Var.e;
                    String str3 = bq5Var.b;
                    String str4 = bq5Var.q;
                    zp5Var2.c = 1;
                    obj = pkfVar.n(zp5Var2.e, str3, zp5Var2.f, str4, zp5Var2);
                    zp5Var2 = zp5Var2;
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
                r6c r6cVar2 = bq5Var.m;
                sp5 sp5Var = new sp5((t7b) obj);
                zp5Var2.c = 2;
                if (r6cVar2.a(sp5Var, zp5Var2) != tb2Var2) {
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
                xpc xpcVar = bq5Var.k;
                qp5 qp5Var = new qp5(new ms0(this.e, this.f));
                this.c = 1;
                xpcVar.a(qp5Var, this);
                return c1eVar == tb2Var3 ? tb2Var3 : c1eVar;
            case 3:
                zp5 zp5Var3 = this;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = zp5Var3.c;
                if (i5 == 0) {
                    br7.v(obj);
                    pkf pkfVar2 = bq5Var.e;
                    String str5 = bq5Var.b;
                    String str6 = bq5Var.q;
                    zp5Var3.c = 1;
                    obj = pkfVar2.L(zp5Var3.e, str5, zp5Var3.f, str6, zp5Var3);
                    zp5Var3 = zp5Var3;
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
                r6c r6cVar3 = bq5Var.m;
                sp5 sp5Var2 = new sp5((t7b) obj);
                zp5Var3.c = 2;
                if (r6cVar3.a(sp5Var2, zp5Var3) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
            case 4:
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 == 0) {
                    br7.v(obj);
                    tl tlVar2 = bq5Var.d;
                    String str7 = bq5Var.b;
                    String str8 = bq5Var.q;
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
                r6c r6cVar4 = bq5Var.m;
                rp5 rp5Var2 = new rp5((a0e) obj);
                this.c = 2;
                if (r6cVar4.a(rp5Var2, this) != tb2Var5) {
                    return c1eVar;
                }
                return tb2Var5;
            case 5:
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 == 0) {
                    br7.v(obj);
                    tl tlVar3 = bq5Var.d;
                    String str9 = bq5Var.b;
                    String str10 = bq5Var.q;
                    this.c = 1;
                    obj = tlVar3.v(this, this.f, this.e, str9, str10);
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
                r6c r6cVar5 = bq5Var.m;
                rp5 rp5Var3 = new rp5((k0e) obj);
                this.c = 2;
                if (r6cVar5.a(rp5Var3, this) != tb2Var6) {
                    return c1eVar;
                }
                return tb2Var6;
            default:
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    tl tlVar4 = bq5Var.d;
                    String str11 = bq5Var.b;
                    String str12 = bq5Var.q;
                    this.c = 1;
                    obj = tlVar4.w(this, this.f, this.e, str11, str12);
                    zp5Var = this;
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
                zp5Var = this;
                r6c r6cVar6 = bq5Var.m;
                rp5 rp5Var4 = new rp5((t0e) obj);
                zp5Var.c = 2;
                if (r6cVar6.a(rp5Var4, zp5Var) != tb2Var7) {
                    return c1eVar;
                }
                return tb2Var7;
        }
    }
}
