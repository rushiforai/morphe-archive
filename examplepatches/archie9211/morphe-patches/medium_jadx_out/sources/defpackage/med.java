package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class med extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ qed d;
    public final /* synthetic */ String e;
    public final /* synthetic */ SourceParameter f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ med(qed qedVar, String str, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = qedVar;
        this.e = str;
        this.f = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new med(this.d, this.e, this.f, n92Var, 0);
            case 1:
                return new med(this.d, this.e, this.f, n92Var, 1);
            default:
                return new med(this.d, this.e, this.f, n92Var, 2);
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
        return ((med) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        med medVar;
        int i = this.b;
        c1e c1eVar = c1e.a;
        qed qedVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    n0c n0cVar = qedVar.h;
                    String str = qedVar.c;
                    String str2 = qedVar.p;
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
                r6c r6cVar = qedVar.n;
                ced cedVar = new ced((oq1) obj);
                this.c = 2;
                if (r6cVar.a(cedVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            case 1:
                med medVar2 = this;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = medVar2.c;
                if (i3 == 0) {
                    br7.v(obj);
                    n0c n0cVar2 = qedVar.h;
                    String str3 = qedVar.c;
                    String str4 = qedVar.p;
                    medVar2.c = 1;
                    obj = n0cVar2.k0(medVar2.e, str3, medVar2.f, str4, medVar2);
                    medVar2 = medVar2;
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
                r6c r6cVar2 = qedVar.n;
                ced cedVar2 = new ced((xq1) obj);
                medVar2.c = 2;
                if (r6cVar2.a(cedVar2, medVar2) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 == 0) {
                    br7.v(obj);
                    kbe kbeVar = qedVar.i;
                    String str5 = qedVar.c;
                    String str6 = qedVar.p;
                    this.c = 1;
                    obj = kbeVar.h(this, this.f, this.e, str5, str6);
                    medVar = this;
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
                medVar = this;
                r6c r6cVar3 = qedVar.n;
                ded dedVar = new ded((b8e) obj);
                medVar.c = 2;
                if (r6cVar3.a(dedVar, medVar) != tb2Var3) {
                    return c1eVar;
                }
                return tb2Var3;
        }
    }
}
