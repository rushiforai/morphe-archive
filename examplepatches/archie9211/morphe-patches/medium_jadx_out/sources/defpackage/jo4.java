package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jo4 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ bo4 e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jo4(bo4 bo4Var, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = bo4Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        bo4 bo4Var = this.e;
        switch (i) {
            case 0:
                jo4 jo4Var = new jo4(bo4Var, n92Var, 0);
                jo4Var.d = obj;
                return jo4Var;
            case 1:
                jo4 jo4Var2 = new jo4(bo4Var, n92Var, 1);
                jo4Var2.d = obj;
                return jo4Var2;
            default:
                jo4 jo4Var3 = new jo4(bo4Var, n92Var, 2);
                jo4Var3.d = obj;
                return jo4Var3;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((jo4) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((jo4) create((do4) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((jo4) create((l2a) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        bo4 bo4Var = this.e;
        switch (i) {
            case 0:
                do4 do4Var = (do4) this.d;
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
                rya ryaVarP = ev6.p(obj);
                ro4 ro4Var = new ro4(bo4Var, new yk(ryaVarP, (n92) null, 7), 1);
                be4 be4Var = new be4(ryaVarP, do4Var, 1);
                this.d = null;
                this.c = 1;
                return ro4Var.b(be4Var, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                do4 do4Var2 = (do4) this.d;
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
                yh yhVar = new yh(do4Var2, 27);
                this.d = null;
                this.c = 1;
                return bo4Var.b(yhVar, this) == tb2Var2 ? tb2Var2 : c1eVar;
            default:
                l2a l2aVar = (l2a) this.d;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i4 = this.c;
                if (i4 != 0) {
                    if (i4 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                d00 d00Var = new d00(l2aVar, 2);
                this.d = null;
                this.c = 1;
                return bo4Var.b(d00Var, this) == tb2Var3 ? tb2Var3 : c1eVar;
        }
    }
}
