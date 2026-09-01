package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zhd extends p4d implements c55 {
    public int b;
    public /* synthetic */ f0a c;
    public /* synthetic */ long d;
    public final /* synthetic */ sb2 e;
    public final /* synthetic */ l78 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zhd(sb2 sb2Var, l78 l78Var, n92 n92Var) {
        super(3, n92Var);
        this.e = sb2Var;
        this.f = l78Var;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        long j = ((ip8) obj2).a;
        zhd zhdVar = new zhd(this.e, this.f, (n92) obj3);
        zhdVar.c = (f0a) obj;
        zhdVar.d = j;
        return zhdVar.invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        l78 l78Var = this.f;
        sb2 sb2Var = this.e;
        if (i == 0) {
            br7.v(obj);
            f0a f0aVar = this.c;
            vx0.c0(sb2Var, null, null, new jsb(l78Var, this.d, null), 3);
            this.b = 1;
            obj = f0aVar.e(this);
            if (obj == tb2Var) {
                return tb2Var;
            }
        } else {
            if (i != 1) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            br7.v(obj);
        }
        vx0.c0(sb2Var, null, null, new lp0(l78Var, ((Boolean) obj).booleanValue(), (n92) null), 3);
        return c1e.a;
    }
}
