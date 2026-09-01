package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u7c extends p4d implements d55 {
    public int b;
    public /* synthetic */ ol c;
    public /* synthetic */ gh7 d;
    public /* synthetic */ w7c e;
    public final /* synthetic */ v7c f;
    public final /* synthetic */ float g;
    public final /* synthetic */ tj4 h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u7c(v7c v7cVar, float f, tj4 tj4Var, n92 n92Var) {
        super(4, n92Var);
        this.f = v7cVar;
        this.g = f;
        this.h = tj4Var;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        int i2 = 1;
        if (i == 0) {
            br7.v(obj);
            ol olVar = this.c;
            float fD = this.d.d(this.e);
            if (!Float.isNaN(fD)) {
                oya oyaVar = new oya();
                v7c v7cVar = this.f;
                float fG = Float.isNaN(((g49) v7cVar.e.k).g()) ? 0.0f : ((g49) v7cVar.e.k).g();
                oyaVar.a = fG;
                lk lkVar = new lk(olVar, oyaVar, i2);
                this.c = null;
                this.d = null;
                this.b = 1;
                if (tr7.i(fG, fD, this.g, this.h, lkVar, this) == tb2Var) {
                    return tb2Var;
                }
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        return c1e.a;
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        float f = this.g;
        tj4 tj4Var = this.h;
        u7c u7cVar = new u7c(this.f, f, tj4Var, (n92) obj4);
        u7cVar.c = (ol) obj;
        u7cVar.d = (gh7) obj2;
        u7cVar.e = (w7c) obj3;
        return u7cVar.invokeSuspend(c1e.a);
    }
}
