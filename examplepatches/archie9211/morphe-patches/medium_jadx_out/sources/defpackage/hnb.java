package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hnb extends p92 implements do4 {
    public final do4 b;
    public final ib2 c;
    public final int d;
    public ib2 e;
    public n92 f;

    public hnb(do4 do4Var, ib2 ib2Var) {
        super(by1.c, zx3.a);
        this.b = do4Var;
        this.c = ib2Var;
        this.d = ((Number) ib2Var.N(new sw8(19), 0)).intValue();
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        try {
            Object objI = i(n92Var, obj);
            return objI == tb2.COROUTINE_SUSPENDED ? objI : c1e.a;
        } catch (Throwable th) {
            this.e = new uj3(n92Var.getContext(), th);
            throw th;
        }
    }

    @Override // defpackage.kn0, defpackage.ub2
    public final ub2 getCallerFrame() {
        n92 n92Var = this.f;
        if (n92Var instanceof ub2) {
            return (ub2) n92Var;
        }
        return null;
    }

    @Override // defpackage.p92, defpackage.n92
    public final ib2 getContext() {
        ib2 ib2Var = this.e;
        return ib2Var == null ? zx3.a : ib2Var;
    }

    @Override // defpackage.kn0
    public final StackTraceElement getStackTraceElement() {
        return null;
    }

    public final Object i(n92 n92Var, Object obj) {
        ib2 context = n92Var.getContext();
        bo.N(context);
        ib2 ib2Var = this.e;
        if (ib2Var != context) {
            if (ib2Var instanceof uj3) {
                throw new IllegalStateException(nuc.B("\n            Flow exception transparency is violated:\n                Previous 'emit' call has thrown exception " + ((uj3) ib2Var).b + ", but then emission attempt of value '" + obj + "' has been detected.\n                Emissions from 'catch' blocks are prohibited in order to avoid unspecified behaviour, 'Flow.catch' operator can be used instead.\n                For a more detailed explanation, please refer to Flow documentation.\n            ").toString());
            }
            if (((Number) context.N(new h9b(7, this), 0)).intValue() != this.d) {
                throw new IllegalStateException(("Flow invariant is violated:\n\t\tFlow was collected in " + this.c + ",\n\t\tbut emission happened in " + context + ".\n\t\tPlease refer to 'flow' documentation or use 'flowOn' instead").toString());
            }
            this.e = context;
        }
        this.f = n92Var;
        c55 c55Var = jnb.a;
        do4 do4Var = this.b;
        do4Var.getClass();
        Object objF = c55Var.f(do4Var, obj, this);
        if (!g76.L(objF, tb2.COROUTINE_SUSPENDED)) {
            this.f = null;
        }
        return objF;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Throwable thB = bjb.b(obj);
        if (thB != null) {
            this.e = new uj3(getContext(), thB);
        }
        n92 n92Var = this.f;
        if (n92Var != null) {
            n92Var.resumeWith(obj);
        }
        return tb2.COROUTINE_SUSPENDED;
    }
}
