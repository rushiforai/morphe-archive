package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a9g extends p4d implements x45 {
    public int b;
    public final /* synthetic */ fdg c;
    public final /* synthetic */ h9g d;
    public final /* synthetic */ long e;
    public final /* synthetic */ vx1 f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a9g(long j, vx1 vx1Var, n92 n92Var, h9g h9gVar, fdg fdgVar) {
        super(1, n92Var);
        this.c = fdgVar;
        this.d = h9gVar;
        this.e = j;
        this.f = vx1Var;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        return new a9g(this.e, this.f, n92Var, this.d, this.c);
    }

    @Override // defpackage.x45
    public final /* bridge */ /* synthetic */ Object invoke(Object obj) {
        return ((a9g) create((n92) obj)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.b;
        br7.v(obj);
        if (i != 0) {
            return obj;
        }
        j82 j82Var = new j82(this.d, this.e, this.f, (n92) null);
        this.b = 1;
        fdg fdgVar = this.c;
        fdgVar.getClass();
        Object objA = new wcg(41, j82Var, null).a(fdgVar, this);
        return objA == tb2Var ? tb2Var : objA;
    }
}
