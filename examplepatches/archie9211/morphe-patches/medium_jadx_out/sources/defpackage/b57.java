package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b57 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ m45 d;
    public final /* synthetic */ v7c e;
    public final /* synthetic */ m45 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ b57(m45 m45Var, v7c v7cVar, m45 m45Var2, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.d = m45Var;
        this.e = v7cVar;
        this.f = m45Var2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                return new b57(this.d, this.e, this.f, n92Var, 0);
            default:
                return new b57(this.d, this.e, this.f, n92Var, 1);
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
        return ((b57) create(sb2Var, n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        m45 m45Var = this.f;
        v7c v7cVar = this.e;
        m45 m45Var2 = this.d;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i2 = this.c;
                if (i2 == 0) {
                    br7.v(obj);
                    m45Var2.invoke();
                    this.c = 1;
                    if (v7cVar.d(this) == tb2Var) {
                    }
                } else if (i2 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                m45Var.invoke();
                break;
            default:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i3 = this.c;
                if (i3 == 0) {
                    br7.v(obj);
                    m45Var2.invoke();
                    this.c = 1;
                    if (v7cVar.d(this) == tb2Var2) {
                    }
                } else if (i3 != 1) {
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                } else {
                    br7.v(obj);
                }
                m45Var.invoke();
                break;
        }
        return c1eVar;
    }
}
