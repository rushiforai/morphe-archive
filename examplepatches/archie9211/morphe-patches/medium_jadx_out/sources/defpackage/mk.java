package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mk extends p4d implements d55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ float e;
    public /* synthetic */ Object f;
    public /* synthetic */ Object g;
    public final /* synthetic */ Object h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ mk(Object obj, float f, n92 n92Var, int i) {
        super(4, n92Var);
        this.b = i;
        this.h = obj;
        this.e = f;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        Object obj2 = this.h;
        switch (i) {
            case 0:
                tl tlVar = (tl) obj2;
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 != 0) {
                    if (i2 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                ol olVar = (ol) this.f;
                float fD = ((gh7) this.g).d(this.d);
                if (Float.isNaN(fD)) {
                    return c1eVar;
                }
                oya oyaVar = new oya();
                float fG = Float.isNaN(((g49) tlVar.k).g()) ? 0.0f : ((g49) tlVar.k).g();
                oyaVar.a = fG;
                tj4 tj4Var = ((d9a) tlVar.c).b.d;
                lk lkVar = new lk(olVar, oyaVar, 0);
                this.f = null;
                this.g = null;
                this.c = 1;
                return tr7.i(fG, fD, this.e, tj4Var, lkVar, this) == tb2Var ? tb2Var : c1eVar;
            default:
                sl slVar = (sl) obj2;
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 != 0) {
                    if (i3 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                nl nlVar = (nl) this.f;
                float fC = ((hh7) this.g).c(this.d);
                if (Float.isNaN(fC)) {
                    return c1eVar;
                }
                oya oyaVar2 = new oya();
                float fG2 = Float.isNaN(slVar.i.g()) ? 0.0f : slVar.i.g();
                oyaVar2.a = fG2;
                ww wwVar = slVar.c;
                r rVar = new r(nlVar, 14, oyaVar2);
                this.f = null;
                this.g = null;
                this.c = 1;
                return tr7.i(fG2, fC, this.e, wwVar, rVar, this) == tb2Var2 ? tb2Var2 : c1eVar;
        }
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        float f = this.e;
        Object obj5 = this.h;
        switch (i) {
            case 0:
                mk mkVar = new mk((tl) obj5, f, (n92) obj4, 0);
                mkVar.f = (ol) obj;
                mkVar.g = (gh7) obj2;
                mkVar.d = obj3;
                return mkVar.invokeSuspend(c1eVar);
            default:
                mk mkVar2 = new mk((sl) obj5, f, (n92) obj4, 1);
                mkVar2.f = (nl) obj;
                mkVar2.g = (hh7) obj2;
                mkVar2.d = obj3;
                return mkVar2.invokeSuspend(c1eVar);
        }
    }
}
