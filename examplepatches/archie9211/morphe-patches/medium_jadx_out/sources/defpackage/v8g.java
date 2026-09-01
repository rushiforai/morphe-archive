package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class v8g extends p4d implements x45 {
    public int b;
    public final /* synthetic */ long c;
    public final /* synthetic */ h9g d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public v8g(long j, n92 n92Var, h9g h9gVar) {
        super(1, n92Var);
        this.c = j;
        this.d = h9gVar;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new v8g(this.c, n92Var, this.d);
    }

    @Override // defpackage.x45
    public final /* bridge */ /* synthetic */ Object invoke(Object obj) {
        return ((v8g) create((n92) obj)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        br7.v(obj);
        if (i == 0) {
            ood oodVar = new ood(this.d, null, 12);
            this.b = 1;
            if (wo7.z(this.c, oodVar, this) == tb2Var) {
                return tb2Var;
            }
        }
        return c1e.a;
    }
}
