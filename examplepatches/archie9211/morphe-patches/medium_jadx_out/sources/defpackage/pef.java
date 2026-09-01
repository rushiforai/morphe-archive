package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pef extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ ref d;
    public final /* synthetic */ boolean e;
    public final /* synthetic */ String f;
    public final /* synthetic */ String g;
    public final /* synthetic */ SourceParameter h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ pef(ref refVar, boolean z, String str, String str2, SourceParameter sourceParameter, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = refVar;
        this.e = z;
        this.f = str;
        this.g = str2;
        this.h = sourceParameter;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new pef(this.d, this.e, this.f, this.g, this.h, n92Var, 0);
            default:
                return new pef(this.d, this.e, this.f, this.g, this.h, n92Var, 1);
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
        return ((pef) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objO;
        Object objP;
        int i = this.b;
        c1e c1eVar = c1e.a;
        ref refVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    tl tlVar = refVar.m;
                    String str = refVar.b;
                    String str2 = refVar.q;
                    this.c = 1;
                    objO = tlVar.o(this.e, this.f, this.g, str, this.h, str2, this);
                    if (objO != tb2Var) {
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
                objO = obj;
                r6c r6cVar = refVar.s;
                fdf fdfVar = new fdf((and) objO);
                this.c = 2;
                if (r6cVar.a(fdfVar, this) != tb2Var) {
                    return c1eVar;
                }
                return tb2Var;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    tl tlVar2 = refVar.m;
                    String str3 = refVar.b;
                    String str4 = refVar.q;
                    this.c = 1;
                    objP = tlVar2.p(this.e, this.f, this.g, str3, this.h, str4, this);
                    if (objP != tb2Var2) {
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
                objP = obj;
                r6c r6cVar2 = refVar.s;
                fdf fdfVar2 = new fdf((and) objP);
                this.c = 2;
                if (r6cVar2.a(fdfVar2, this) != tb2Var2) {
                    return c1eVar;
                }
                return tb2Var2;
        }
    }
}
