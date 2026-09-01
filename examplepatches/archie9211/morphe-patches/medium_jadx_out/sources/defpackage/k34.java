package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class k34 extends kb2 {
    public static final /* synthetic */ int f = 0;
    public long c;
    public boolean d;
    public m70 e;

    @Override // defpackage.kb2
    public final kb2 H0(int i) {
        wgf.f(i);
        return this;
    }

    public final void I0(boolean z) {
        long j = this.c - (z ? 4294967296L : 1L);
        this.c = j;
        if (j <= 0 && this.d) {
            shutdown();
        }
    }

    public final void J0(tg3 tg3Var) {
        m70 m70Var = this.e;
        if (m70Var == null) {
            m70Var = new m70();
            this.e = m70Var;
        }
        m70Var.addLast(tg3Var);
    }

    public final void K0(boolean z) {
        this.c = (z ? 4294967296L : 1L) + this.c;
        if (z) {
            return;
        }
        this.d = true;
    }

    public abstract long L0();

    public final boolean M0() {
        m70 m70Var = this.e;
        if (m70Var == null) {
            return false;
        }
        tg3 tg3Var = (tg3) (m70Var.isEmpty() ? null : m70Var.removeFirst());
        if (tg3Var == null) {
            return false;
        }
        tg3Var.run();
        return true;
    }

    public abstract void shutdown();
}
