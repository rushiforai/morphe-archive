package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q3b extends a1 implements lb2 {
    public final /* synthetic */ o22 b;
    public final /* synthetic */ r3b c;

    /* JADX WARN: Illegal instructions before constructor call */
    public q3b(o22 o22Var, r3b r3bVar) {
        u3b u3bVar = u3b.d;
        this.b = o22Var;
        this.c = r3bVar;
        super(u3bVar);
    }

    @Override // defpackage.lb2
    public final void I(ib2 ib2Var, Throwable th) throws Throwable {
        o22 o22Var = this.b;
        r3b r3bVar = this.c;
        hlg.V(th, new n(o22Var, 28, r3bVar));
        lb2 lb2Var = (lb2) r3bVar.a.o0(u3b.d);
        if (lb2Var == null) {
            throw th;
        }
        lb2Var.I(ib2Var, th);
    }
}
