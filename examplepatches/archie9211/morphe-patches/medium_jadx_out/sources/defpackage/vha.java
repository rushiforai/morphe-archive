package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vha extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ zha d;
    public final /* synthetic */ String e;
    public final /* synthetic */ String f;
    public final /* synthetic */ SourceParameter g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ vha(zha zhaVar, String str, String str2, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = zhaVar;
        this.e = str;
        this.f = str2;
        this.g = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new vha(this.d, this.e, this.f, this.g, n92Var, 0);
            default:
                return new vha(this.d, this.e, this.f, this.g, n92Var, 1);
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
        return ((vha) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objG;
        int i = this.b;
        c1e c1eVar = c1e.a;
        zha zhaVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    kbe kbeVar = zhaVar.g;
                    String str = zhaVar.b;
                    String str2 = zhaVar.h;
                    this.c = 1;
                    objA = kbeVar.a(this.e, this.f, this.g, str2, str, this);
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
                r6c r6cVar = zhaVar.m;
                oha ohaVar = new oha((n7e) objA);
                this.c = 2;
                if (r6cVar.a(ohaVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    kbe kbeVar2 = zhaVar.g;
                    String str3 = zhaVar.b;
                    String str4 = zhaVar.h;
                    this.c = 1;
                    objG = kbeVar2.g(this.e, this.f, this.g, str4, str3, this);
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
                r6c r6cVar2 = zhaVar.m;
                oha ohaVar2 = new oha((g8e) objG);
                this.c = 2;
                if (r6cVar2.a(ohaVar2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
