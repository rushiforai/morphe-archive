package defpackage;

import sun.misc.Unsafe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class p92 extends kn0 {
    private final ib2 _context;
    private transient n92<Object> intercepted;

    public p92(n92 n92Var) {
        this(n92Var, n92Var != null ? n92Var.getContext() : null);
    }

    @Override // defpackage.n92
    public ib2 getContext() {
        ib2 ib2Var = this._context;
        ib2Var.getClass();
        return ib2Var;
    }

    public final n92<Object> intercepted() {
        n92<Object> n92Var = this.intercepted;
        if (n92Var != null) {
            return n92Var;
        }
        kb2 kb2Var = (kb2) getContext().o0(wz7.d);
        n92<Object> rg3Var = kb2Var != null ? new rg3(kb2Var, this) : this;
        this.intercepted = rg3Var;
        return rg3Var;
    }

    @Override // defpackage.kn0
    public void releaseIntercepted() {
        Unsafe unsafe;
        long j;
        n92<Object> n92Var = this.intercepted;
        if (n92Var != null && n92Var != this) {
            gb2 gb2VarO0 = getContext().o0(wz7.d);
            gb2VarO0.getClass();
            rg3 rg3Var = (rg3) n92Var;
            do {
                unsafe = m80.a;
                j = rg3.h;
            } while (unsafe.getObjectVolatile(rg3Var, j) == op8.f);
            Object objectVolatile = unsafe.getObjectVolatile(rg3Var, j);
            x51 x51Var = objectVolatile instanceof x51 ? (x51) objectVolatile : null;
            if (x51Var != null) {
                x51Var.n();
            }
        }
        this.intercepted = by1.b;
    }

    public p92(n92 n92Var, ib2 ib2Var) {
        super(n92Var);
        this._context = ib2Var;
    }
}
