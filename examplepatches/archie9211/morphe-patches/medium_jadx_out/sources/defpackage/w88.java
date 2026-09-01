package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w88 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ x88 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ w88(x88 x88Var, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = x88Var;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new w88(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new w88(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new w88(this.d, this.e, this.f, n92Var, 2);
            default:
                return new w88(this.d, this.e, this.f, n92Var, 3);
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
        return ((w88) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        w88 w88Var;
        int i = this.b;
        c1e c1eVar = c1e.a;
        x88 x88Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = x88Var.i;
                    String str = x88Var.b;
                    String str2 = x88Var.k;
                    this.c = 1;
                    obj = n0cVar.X(this.e, str, this.f, str2, this);
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
                r6c r6cVar = x88Var.r;
                k88 k88Var = new k88((rq1) obj);
                this.c = 2;
                if (r6cVar.a(k88Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    kbe kbeVar = x88Var.h;
                    String str3 = x88Var.b;
                    String str4 = x88Var.k;
                    this.c = 1;
                    obj = kbeVar.c(this.e, str3, this.f, str4, this);
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
                r6c r6cVar2 = x88Var.r;
                l88 l88Var = new l88((r7e) obj);
                this.c = 2;
                if (r6cVar2.a(l88Var, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    kbe kbeVar2 = x88Var.h;
                    String str5 = x88Var.b;
                    String str6 = x88Var.k;
                    this.c = 1;
                    obj = kbeVar2.f(this.e, str5, this.f, str6, this);
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
                r6c r6cVar3 = x88Var.r;
                l88 l88Var2 = new l88((w7e) obj);
                this.c = 2;
                if (r6cVar3.a(l88Var2, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = x88Var.i;
                    String str7 = x88Var.b;
                    String str8 = x88Var.k;
                    this.c = 1;
                    obj = n0cVar2.i0(this.e, str7, this.f, str8, this);
                    w88Var = this;
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
                w88Var = this;
                r6c r6cVar4 = x88Var.r;
                k88 k88Var2 = new k88((uq1) obj);
                w88Var.c = 2;
                if (r6cVar4.a(k88Var2, w88Var) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
        }
    }
}
