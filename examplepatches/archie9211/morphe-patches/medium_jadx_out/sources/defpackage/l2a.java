package defpackage;

import java.util.concurrent.CancellationException;
import kotlinx.coroutines.JobCancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class l2a extends z0 implements wj1, xyb {
    public final uz0 d;

    public l2a(ib2 ib2Var, uz0 uz0Var) {
        super(ib2Var, true);
        this.d = uz0Var;
    }

    @Override // defpackage.xyb
    public final void a(x45 x45Var) {
        this.d.a(x45Var);
    }

    @Override // defpackage.xyb
    public final Object b(n92 n92Var, Object obj) {
        return this.d.b(n92Var, obj);
    }

    @Override // defpackage.xyb
    public final boolean c(Throwable th) {
        return this.d.f(th, false);
    }

    @Override // defpackage.xyb
    public final Object e(Object obj) {
        return this.d.e(obj);
    }

    @Override // defpackage.z0
    public final void i0(Throwable th, boolean z) {
        if (this.d.f(th, false) || z) {
            return;
        }
        kyd.Y(this.c, th);
    }

    @Override // defpackage.wj1
    public final pz0 iterator() {
        uz0 uz0Var = this.d;
        uz0Var.getClass();
        return new pz0(uz0Var);
    }

    @Override // defpackage.z0
    public final void k0(Object obj) {
        this.d.c(null);
    }

    @Override // defpackage.db6, defpackage.va6
    public final void m(CancellationException cancellationException) {
        if (isCancelled()) {
            return;
        }
        if (cancellationException == null) {
            cancellationException = new JobCancellationException(v(), null, this);
        }
        s(cancellationException);
    }

    @Override // defpackage.wj1
    public final mya n() {
        return this.d.n();
    }

    @Override // defpackage.wj1
    public final Object o() {
        return this.d.o();
    }

    @Override // defpackage.wj1
    public final Object q(n92 n92Var) {
        return this.d.q(n92Var);
    }

    @Override // defpackage.wj1
    public final Object r(zv1 zv1Var) {
        uz0 uz0Var = this.d;
        uz0Var.getClass();
        return uz0.G(uz0Var, zv1Var);
    }

    @Override // defpackage.db6
    public final void s(CancellationException cancellationException) {
        this.d.f(cancellationException, true);
        k(cancellationException);
    }
}
