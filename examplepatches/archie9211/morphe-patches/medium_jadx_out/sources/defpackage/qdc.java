package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qdc extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ sdc d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qdc(sdc sdcVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = sdcVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        sdc sdcVar = this.d;
        switch (i) {
            case 0:
                return new qdc(sdcVar, n92Var, 0);
            case 1:
                return new qdc(sdcVar, n92Var, 1);
            default:
                return new qdc(sdcVar, n92Var, 2);
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
        return ((qdc) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        jdc jdcVar = jdc.a;
        c1e c1eVar = c1e.a;
        sdc sdcVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    r6c r6cVar = sdcVar.q;
                    this.c = 1;
                    return r6cVar.a(jdcVar, this) == tb2Var ? tb2Var : c1eVar;
                }
                if (i2 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    r6c r6cVar2 = sdcVar.q;
                    this.c = 1;
                    return r6cVar2.a(jdcVar, this) == tb2Var2 ? tb2Var2 : c1eVar;
                }
                if (i3 == 1) {
                    br7.v(obj);
                    return c1eVar;
                }
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            default:
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1 || i4 == 2) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                fj6[] fj6VarArr = sdc.r;
                uid uidVarF = sdcVar.f();
                if (muc.b0(uidVarF.a.b) || muc.y0(uidVarF.a.b).toString().length() > 50 || !huc.b(sdcVar.e().a.b)) {
                    r6c r6cVar3 = sdcVar.q;
                    this.c = 2;
                    if (r6cVar3.a(hdc.a, this) != tb2Var3) {
                        return c1eVar;
                    }
                } else {
                    sdcVar.g.b(sdcVar.m, sdcVar.k, gp7.u(new SourceParameter(sdcVar.k, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, -2, 8191, null)), sdcVar.d, "email");
                    this.c = 1;
                    if (sdcVar.g(this) != tb2Var3) {
                        return c1eVar;
                    }
                }
                return tb2Var3;
        }
    }
}
