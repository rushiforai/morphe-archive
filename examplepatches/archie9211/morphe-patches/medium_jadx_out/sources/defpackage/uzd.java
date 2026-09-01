package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class uzd extends frb {
    public final ThreadLocal e;
    private volatile boolean threadLocalIsSet;

    /* JADX WARN: Illegal instructions before constructor call */
    public uzd(n92 n92Var, ib2 ib2Var) {
        d61 d61Var = d61.d;
        super(n92Var, ib2Var.o0(d61Var) == null ? ib2Var.j0(d61Var) : ib2Var);
        this.e = new ThreadLocal();
        if (n92Var.getContext().o0(wz7.d) instanceof kb2) {
            return;
        }
        Object objF0 = gx1.f0(ib2Var, null);
        gx1.Z(ib2Var, objF0);
        q0(ib2Var, objF0);
    }

    @Override // defpackage.frb, defpackage.db6
    public final void h(Object obj) {
        n0();
        Object objH = bgf.H(obj);
        n92 n92Var = this.d;
        ib2 context = n92Var.getContext();
        Object objF0 = gx1.f0(context, null);
        uzd uzdVarA0 = objF0 != gx1.o ? guc.a0(n92Var, context, objF0) : null;
        try {
            n92Var.resumeWith(objH);
            if (uzdVarA0 == null || uzdVarA0.m0()) {
                gx1.Z(context, objF0);
            }
        } catch (Throwable th) {
            if (uzdVarA0 == null || uzdVarA0.m0()) {
                gx1.Z(context, objF0);
            }
            throw th;
        }
    }

    @Override // defpackage.frb
    public final void l0() {
        n0();
    }

    public final boolean m0() {
        boolean z = this.threadLocalIsSet && this.e.get() == null;
        this.e.remove();
        return !z;
    }

    public final void n0() {
        if (this.threadLocalIsSet) {
            f09 f09Var = (f09) this.e.get();
            if (f09Var != null) {
                gx1.Z((ib2) f09Var.a, f09Var.b);
            }
            this.e.remove();
        }
    }

    public final void q0(ib2 ib2Var, Object obj) {
        this.threadLocalIsSet = true;
        this.e.set(new f09(ib2Var, obj));
    }
}
