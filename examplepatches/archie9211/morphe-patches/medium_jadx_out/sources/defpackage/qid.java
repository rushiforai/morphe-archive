package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qid extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ x45 d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ qid(int i, n92 n92Var, x45 x45Var) {
        super(2, n92Var);
        this.b = i;
        this.d = x45Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        x45 x45Var = this.d;
        switch (i) {
            case 0:
                return new qid(0, n92Var, x45Var);
            default:
                return new qid(1, n92Var, x45Var);
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
        return ((qid) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        switch (this.b) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i = this.c;
                if (i == 0) {
                    br7.v(obj);
                    this.c = 1;
                    if (this.d.invoke(this) == tb2Var) {
                        return tb2Var;
                    }
                } else {
                    if (i != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                return c1e.a;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                br7.v(obj);
                if (i2 != 0) {
                    return obj;
                }
                uob uobVar = uob.j;
                this.c = 1;
                Object objT = uobVar.t(20, 100L, 1000L, 2.0d, this.d, this);
                return objT == tb2Var2 ? tb2Var2 : objT;
        }
    }
}
