package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class u95 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ hx4 d;
    public final /* synthetic */ String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ u95(hx4 hx4Var, String str, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = hx4Var;
        this.e = str;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        String str = this.e;
        hx4 hx4Var = this.d;
        switch (i) {
            case 0:
                return new u95(hx4Var, str, n92Var, 0);
            default:
                return new u95(hx4Var, str, n92Var, 1);
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
        return ((u95) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Object objA;
        Object objO;
        int i = this.b;
        String str = this.e;
        hx4 hx4Var = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    hb5 hb5Var = (hb5) hx4Var.c;
                    this.c = 1;
                    objA = hb5Var.a(str, this);
                    if (objA == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i2 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objA = ((bjb) obj).a;
                }
                return new bjb(objA);
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    kla klaVar = (kla) hx4Var.b;
                    this.c = 1;
                    objO = klaVar.o(str, this);
                    if (objO == tb2Var2) {
                        return tb2Var2;
                    }
                } else {
                    if (i3 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                    objO = ((bjb) obj).a;
                }
                return new bjb(objO);
        }
    }
}
