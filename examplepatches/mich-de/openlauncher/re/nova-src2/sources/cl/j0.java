package cl;

import java.util.concurrent.RejectedExecutionException;

/* loaded from: classes.dex */
public final class j0 extends y {

    /* renamed from: p, reason: collision with root package name */
    public i0 f20023p;

    @Override // cl.s
    public final void k() {
        i0 i0Var = this.f20023p;
        if (i0Var != null) {
            i0Var.c();
        }
    }

    @Override // cl.y
    public final void r(int i5, Object obj) {
    }

    @Override // cl.y
    public final void u() {
        i0 i0Var = this.f20023p;
        if (i0Var != null) {
            try {
                i0Var.f20020c.execute(i0Var);
            } catch (RejectedExecutionException e3) {
                i0Var.f20021d.o(e3);
            }
        }
    }

    @Override // cl.y
    public final void x(int i5) {
        b.c0.a(i5);
        this.f20088l = null;
        if (i5 == 1) {
            this.f20023p = null;
        }
    }
}
