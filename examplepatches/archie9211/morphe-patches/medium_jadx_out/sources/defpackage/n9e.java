package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n9e extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ q9e d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ n9e(q9e q9eVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = q9eVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new n9e(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new n9e(this.d, this.e, this.f, n92Var, 1);
            case 2:
                return new n9e(this.d, this.e, this.f, n92Var, 2);
            default:
                return new n9e(this.d, this.e, this.f, n92Var, 3);
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
        return ((n9e) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        n9e n9eVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        q9e q9eVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    tl tlVar = q9eVar.f;
                    String str = q9eVar.c;
                    String str2 = q9eVar.t;
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
                r6c r6cVar = q9eVar.n;
                l9e l9eVar = new l9e((xs4) obj);
                this.c = 2;
                if (r6cVar.a(l9eVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    tl tlVar2 = q9eVar.f;
                    String str3 = q9eVar.c;
                    String str4 = q9eVar.t;
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
                r6c r6cVar2 = q9eVar.n;
                l9e l9eVar2 = new l9e((a0e) obj);
                this.c = 2;
                if (r6cVar2.a(l9eVar2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            case 2:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    tl tlVar3 = q9eVar.f;
                    String str5 = q9eVar.c;
                    String str6 = q9eVar.t;
                    this.c = 1;
                    obj = tlVar3.w(this, this.f, this.e, str5, str6);
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
                r6c r6cVar3 = q9eVar.n;
                l9e l9eVar3 = new l9e((t0e) obj);
                this.c = 2;
                if (r6cVar3.a(l9eVar3, this) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
            default:
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i5 = this.c;
                if (i5 == 0) {
                    br7.v(obj);
                    tl tlVar4 = q9eVar.f;
                    String str7 = q9eVar.c;
                    String str8 = q9eVar.t;
                    this.c = 1;
                    obj = tlVar4.v(this, this.f, this.e, str7, str8);
                    n9eVar = this;
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
                n9eVar = this;
                r6c r6cVar4 = q9eVar.n;
                l9e l9eVar4 = new l9e((k0e) obj);
                n9eVar.c = 2;
                if (r6cVar4.a(l9eVar4, n9eVar) != tb2Var4) {
                    return c1eVar;
                }
                return tb2Var4;
        }
    }
}
