package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oa extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ua d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ oa(ua uaVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = uaVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new oa(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new oa(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new oa(this.d, this.e, this.f, n92Var, 2);
            default:
                return new oa(this.d, this.e, this.f, n92Var, 3);
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
        return ((oa) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        oa oaVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        ua uaVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    tl tlVar = uaVar.f;
                    String str = uaVar.h;
                    String str2 = uaVar.n;
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
                r6c r6cVar = uaVar.r;
                ha haVar = new ha((xs4) obj);
                this.c = 2;
                if (r6cVar.a(haVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    tl tlVar2 = uaVar.f;
                    String str3 = uaVar.h;
                    String str4 = uaVar.n;
                    this.c = 1;
                    obj = tlVar2.t(this, this.f, this.e, str3, str4);
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
                r6c r6cVar2 = uaVar.r;
                ha haVar2 = new ha((a0e) obj);
                this.c = 2;
                if (r6cVar2.a(haVar2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    tl tlVar3 = uaVar.f;
                    String str5 = uaVar.h;
                    String str6 = uaVar.n;
                    this.c = 1;
                    obj = tlVar3.v(this, this.f, this.e, str5, str6);
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
                r6c r6cVar3 = uaVar.r;
                ha haVar3 = new ha((k0e) obj);
                this.c = 2;
                if (r6cVar3.a(haVar3, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    tl tlVar4 = uaVar.f;
                    String str7 = uaVar.h;
                    String str8 = uaVar.n;
                    this.c = 1;
                    obj = tlVar4.w(this, this.f, this.e, str7, str8);
                    oaVar = this;
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
                oaVar = this;
                r6c r6cVar4 = uaVar.r;
                ha haVar4 = new ha((t0e) obj);
                oaVar.c = 2;
                if (r6cVar4.a(haVar4, oaVar) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
        }
    }
}
