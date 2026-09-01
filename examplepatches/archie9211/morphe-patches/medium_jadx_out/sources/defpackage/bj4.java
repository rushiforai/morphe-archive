package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bj4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ fj4 d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ SourceParameter g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ bj4(fj4 fj4Var, String str, String str2, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = fj4Var;
        this.e = str;
        this.f = str2;
        this.g = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new bj4(this.d, this.e, this.f, this.g, n92Var, 0);
            default:
                return new bj4(this.d, this.e, this.f, this.g, n92Var, 1);
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
        return ((bj4) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objG;
        int i = this.b;
        c1e c1eVar = c1e.a;
        String str = this.f;
        fj4 fj4Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    kbe kbeVar = fj4Var.g;
                    String str2 = fj4Var.b;
                    String str3 = fj4Var.y;
                    this.c = 1;
                    objA = kbeVar.a(this.e, this.f, this.g, str3, str2, this);
                    if (objA != tb2Var) {
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
                objA = obj;
                n7e n7eVar = (n7e) objA;
                if (n7eVar instanceof m7e) {
                    fj4Var.m.put(str, Boolean.TRUE);
                    fj4Var.e();
                }
                r6c r6cVar = fj4Var.w;
                li4 li4Var = new li4(n7eVar);
                this.c = 2;
                if (r6cVar.a(li4Var, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    kbe kbeVar2 = fj4Var.g;
                    String str4 = fj4Var.b;
                    String str5 = fj4Var.y;
                    this.c = 1;
                    objG = kbeVar2.g(this.e, this.f, this.g, str5, str4, this);
                    if (objG != tb2Var2) {
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
                objG = obj;
                g8e g8eVar = (g8e) objG;
                if (g8eVar instanceof a8e) {
                    fj4Var.m.put(str, Boolean.FALSE);
                    fj4Var.e();
                }
                r6c r6cVar2 = fj4Var.w;
                li4 li4Var2 = new li4(g8eVar);
                this.c = 2;
                if (r6cVar2.a(li4Var2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
