package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class bfd extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ efd d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bfd(efd efdVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = efdVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new bfd(this.d, this.e, this.f, n92Var, 0);
            default:
                return new bfd(this.d, this.e, this.f, n92Var, 1);
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
        return ((bfd) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        bfd bfdVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        efd efdVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    mya myaVar = efdVar.d;
                    String str = efdVar.b;
                    String str2 = efdVar.n;
                    this.c = 1;
                    obj = myaVar.p(this.e, str, this.f, str2, this);
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
                r6c r6cVar = efdVar.h;
                ued uedVar = new ued((x7d) obj);
                this.c = 2;
                if (r6cVar.a(uedVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    mya myaVar2 = efdVar.d;
                    String str3 = efdVar.b;
                    String str4 = efdVar.n;
                    this.c = 1;
                    obj = myaVar2.K(this.e, str3, this.f, str4, this);
                    bfdVar = this;
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
                bfdVar = this;
                r6c r6cVar2 = efdVar.h;
                ued uedVar2 = new ued((a8d) obj);
                bfdVar.c = 2;
                if (r6cVar2.a(uedVar2, bfdVar) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
