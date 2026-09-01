package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sld extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ tld d;
    public final /* synthetic */ float e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ sld(tld tldVar, float f, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = tldVar;
        this.e = f;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        float f = this.e;
        tld tldVar = this.d;
        switch (i) {
            case 0:
                return new sld(tldVar, f, n92Var, 0);
            default:
                return new sld(tldVar, f, n92Var, 1);
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
        return ((sld) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        float f = this.e;
        tld tldVar = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    ou ouVar = tldVar.t;
                    if (ouVar != null) {
                        Float f2 = new Float(f);
                        ww wwVar = tldVar.r ? o5d.f : tldVar.q;
                        this.c = 1;
                        obj = ou.a(ouVar, f2, wwVar, null, this, 12);
                        if (obj == tb2Var) {
                        }
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    ou ouVar2 = tldVar.s;
                    if (ouVar2 != null) {
                        Float f3 = new Float(f);
                        ww wwVar2 = tldVar.r ? o5d.f : tldVar.q;
                        this.c = 1;
                        obj = ou.a(ouVar2, f3, wwVar2, null, this, 12);
                        if (obj == tb2Var2) {
                        }
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                break;
        }
        return c1eVar;
    }
}
