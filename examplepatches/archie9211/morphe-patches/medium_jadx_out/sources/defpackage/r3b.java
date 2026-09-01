package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class r3b implements sb2, p3b {
    public static final d61 d = new d61(0);
    public final ib2 a;
    public final r3b b = this;
    public volatile ib2 c;

    public r3b(ib2 ib2Var) {
        this.a = ib2Var;
    }

    @Override // defpackage.sb2
    public final ib2 Q() {
        ib2 ib2VarJ0;
        ib2 ib2Var = this.c;
        if (ib2Var == null || ib2Var == d) {
            o22 o22Var = (o22) this.a.o0(o22.b);
            ib2 q3bVar = o22Var != null ? new q3b(o22Var, this) : zx3.a;
            synchronized (this.b) {
                try {
                    ib2 ib2Var2 = this.c;
                    if (ib2Var2 == null) {
                        ib2 ib2Var3 = this.a;
                        ib2VarJ0 = ib2Var3.j0(new wa6((va6) ib2Var3.o0(cd7.g))).j0(zx3.a).j0(q3bVar);
                    } else if (ib2Var2 == d) {
                        ib2 ib2Var4 = this.a;
                        wa6 wa6Var = new wa6((va6) ib2Var4.o0(cd7.g));
                        wa6Var.k(new m05(0));
                        ib2VarJ0 = ib2Var4.j0(wa6Var).j0(zx3.a).j0(q3bVar);
                    } else {
                        ib2VarJ0 = ib2Var2;
                    }
                    this.c = ib2VarJ0;
                } catch (Throwable th) {
                    throw th;
                }
            }
            ib2Var = ib2VarJ0;
        }
        ib2Var.getClass();
        return ib2Var;
    }

    public final void a() {
        synchronized (this.b) {
            try {
                ib2 ib2Var = this.c;
                if (ib2Var == null) {
                    this.c = d;
                } else {
                    bo.D(ib2Var, new m05(0));
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.p3b
    public final void b() {
        a();
    }

    @Override // defpackage.p3b
    public final void c() {
        a();
    }

    @Override // defpackage.p3b
    public final void d() {
    }
}
