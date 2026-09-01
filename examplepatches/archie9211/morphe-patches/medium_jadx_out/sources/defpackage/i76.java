package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i76 extends p92 {
    public int b;
    public final /* synthetic */ b55 c;
    public final /* synthetic */ Object d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i76(n92 n92Var, ib2 ib2Var, b55 b55Var, Object obj) {
        super(n92Var, ib2Var);
        this.c = b55Var;
        this.d = obj;
        n92Var.getClass();
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        int i = this.b;
        if (i != 0) {
            if (i != 1) {
                ygf.f("This coroutine had already completed");
                return null;
            }
            this.b = 2;
            br7.v(obj);
            return obj;
        }
        this.b = 1;
        br7.v(obj);
        b55 b55Var = this.c;
        b55Var.getClass();
        pwd.B(2, b55Var);
        return b55Var.invoke(this.d, this);
    }
}
