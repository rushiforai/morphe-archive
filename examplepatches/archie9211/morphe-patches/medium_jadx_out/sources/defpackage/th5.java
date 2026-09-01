package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class th5 extends m3f {
    @Override // defpackage.t73
    public final void a(t73 t73Var) {
        y73 y73Var = this.h;
        if (y73Var.c && !y73Var.j) {
            y73Var.d((int) ((((y73) y73Var.l.get(0)).g * ((sh5) this.b).r0) + 0.5f));
        }
    }

    @Override // defpackage.m3f
    public final void d() {
        b72 b72Var = this.b;
        sh5 sh5Var = (sh5) b72Var;
        int i = sh5Var.s0;
        int i2 = sh5Var.t0;
        int i3 = sh5Var.v0;
        y73 y73Var = this.h;
        if (i3 == 1) {
            if (i != -1) {
                y73Var.l.add(b72Var.V.d.h);
                this.b.V.d.h.k.add(y73Var);
                y73Var.f = i;
            } else if (i2 != -1) {
                y73Var.l.add(b72Var.V.d.i);
                this.b.V.d.i.k.add(y73Var);
                y73Var.f = -i2;
            } else {
                y73Var.b = true;
                y73Var.l.add(b72Var.V.d.i);
                this.b.V.d.i.k.add(y73Var);
            }
            m(this.b.d.h);
            m(this.b.d.i);
            return;
        }
        if (i != -1) {
            y73Var.l.add(b72Var.V.e.h);
            this.b.V.e.h.k.add(y73Var);
            y73Var.f = i;
        } else if (i2 != -1) {
            y73Var.l.add(b72Var.V.e.i);
            this.b.V.e.i.k.add(y73Var);
            y73Var.f = -i2;
        } else {
            y73Var.b = true;
            y73Var.l.add(b72Var.V.e.i);
            this.b.V.e.i.k.add(y73Var);
        }
        m(this.b.e.h);
        m(this.b.e.i);
    }

    @Override // defpackage.m3f
    public final void e() {
        b72 b72Var = this.b;
        int i = ((sh5) b72Var).v0;
        y73 y73Var = this.h;
        if (i == 1) {
            b72Var.a0 = y73Var.g;
        } else {
            b72Var.b0 = y73Var.g;
        }
    }

    @Override // defpackage.m3f
    public final void f() {
        this.h.c();
    }

    @Override // defpackage.m3f
    public final boolean k() {
        return false;
    }

    public final void m(y73 y73Var) {
        y73 y73Var2 = this.h;
        y73Var2.k.add(y73Var);
        y73Var.l.add(y73Var2);
    }
}
