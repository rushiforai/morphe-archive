package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class uac extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ wac d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ uac(wac wacVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = wacVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        wac wacVar = this.d;
        switch (i) {
            case 0:
                return new uac(wacVar, n92Var, 0);
            default:
                return new uac(wacVar, n92Var, 1);
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
        return ((uac) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        wac wacVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    r6c r6cVar = wacVar.o;
                    this.c = 1;
                    return r6cVar.a(kac.a, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1 || i3 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                fj6[] fj6VarArr = wac.p;
                if (huc.b(wacVar.e().a.b)) {
                    wacVar.f.b(wacVar.k, wacVar.i, gp7.u(new SourceParameter(wacVar.i, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null)), wacVar.c, "email");
                    this.c = 1;
                    if (wacVar.f(this) != tb2Var2) {
                        return c1eVar;
                    }
                } else {
                    r6c r6cVar2 = wacVar.o;
                    this.c = 2;
                    if (r6cVar2.a(iac.a, this) != tb2Var2) {
                        return c1eVar;
                    }
                }
                return tb2Var2;
        }
    }
}
