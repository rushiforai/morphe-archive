package t70;

import kotlin.collections.ArrayDeque;

/* loaded from: classes.dex */
public abstract class i1 extends c0 {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ int f88805f = 0;

    /* renamed from: c, reason: collision with root package name */
    public long f88806c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f88807d;

    /* renamed from: e, reason: collision with root package name */
    public ArrayDeque f88808e;

    @Override // t70.c0
    public final c0 f0(int i5, String str) {
        y70.g.a(1);
        return str != null ? new y70.p(this, str) : this;
    }

    public final void g0(boolean z11) {
        long j11 = this.f88806c - (z11 ? 4294967296L : 1L);
        this.f88806c = j11;
        if (j11 <= 0 && this.f88807d) {
            shutdown();
        }
    }

    public final void h0(v0 v0Var) {
        ArrayDeque arrayDeque = this.f88808e;
        if (arrayDeque == null) {
            arrayDeque = new ArrayDeque();
            this.f88808e = arrayDeque;
        }
        arrayDeque.addLast(v0Var);
    }

    public abstract Thread i0();

    public final void j0(boolean z11) {
        this.f88806c = (z11 ? 4294967296L : 1L) + this.f88806c;
        if (z11) {
            return;
        }
        this.f88807d = true;
    }

    public abstract long k0();

    public final boolean l0() {
        ArrayDeque arrayDeque = this.f88808e;
        if (arrayDeque == null) {
            return false;
        }
        v0 v0Var = (v0) (arrayDeque.isEmpty() ? null : arrayDeque.removeFirst());
        if (v0Var == null) {
            return false;
        }
        v0Var.run();
        return true;
    }

    public void m0(long j11, f1 f1Var) {
        n0.f88840j.r0(j11, f1Var);
    }

    public abstract void shutdown();
}
