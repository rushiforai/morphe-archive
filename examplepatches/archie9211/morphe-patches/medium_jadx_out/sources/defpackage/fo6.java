package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fo6 implements p3b, lb2 {
    public final ib2 a;
    public final b55 b;
    public final k92 c;
    public enc d;

    public fo6(ib2 ib2Var, b55 b55Var) {
        this.a = ib2Var;
        this.b = b55Var;
        this.c = o7f.c(ib2Var.j0(this));
    }

    @Override // defpackage.lb2
    public final void I(ib2 ib2Var, Throwable th) throws Throwable {
        o22 o22Var = (o22) ib2Var.o0(o22.b);
        if (o22Var != null) {
            hlg.V(th, new n(o22Var, 28, this));
        }
        lb2 lb2Var = (lb2) this.a.o0(u3b.d);
        if (lb2Var == null) {
            throw th;
        }
        lb2Var.I(ib2Var, th);
    }

    @Override // defpackage.ib2
    public final Object N(b55 b55Var, Object obj) {
        return b55Var.invoke(obj, this);
    }

    @Override // defpackage.ib2
    public final ib2 T(hb2 hb2Var) {
        return flb.n0(this, hb2Var);
    }

    @Override // defpackage.p3b
    public final void b() {
        enc encVar = this.d;
        if (encVar != null) {
            encVar.s(new m05(1));
        }
        this.d = null;
    }

    @Override // defpackage.p3b
    public final void c() {
        enc encVar = this.d;
        if (encVar != null) {
            encVar.s(new m05(1));
        }
        this.d = null;
    }

    @Override // defpackage.p3b
    public final void d() {
        enc encVar = this.d;
        if (encVar != null) {
            CancellationException cancellationException = new CancellationException("Old job was still running!");
            cancellationException.initCause(null);
            encVar.m(cancellationException);
        }
        this.d = vx0.c0(this.c, null, null, this.b, 3);
    }

    @Override // defpackage.gb2
    public final hb2 getKey() {
        return u3b.d;
    }

    @Override // defpackage.ib2
    public final ib2 j0(ib2 ib2Var) {
        return flb.p0(this, ib2Var);
    }

    @Override // defpackage.ib2
    public final gb2 o0(hb2 hb2Var) {
        return flb.i0(this, hb2Var);
    }
}
