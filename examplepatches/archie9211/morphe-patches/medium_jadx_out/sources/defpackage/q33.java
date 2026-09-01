package defpackage;

import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q33 extends kb2 {
    public static final /* synthetic */ long e = m80.a.objectFieldOffset(q33.class.getDeclaredField("d"));
    public final kb2 c;
    public volatile /* synthetic */ int d = 1;

    public q33(kb2 kb2Var) {
        this.c = kb2Var;
    }

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        I0().E0(ib2Var, runnable);
    }

    @Override // defpackage.kb2
    public final void F0(ib2 ib2Var, Runnable runnable) throws DispatchException {
        I0().F0(ib2Var, runnable);
    }

    @Override // defpackage.kb2
    public final boolean G0(ib2 ib2Var) {
        return I0().G0(ib2Var);
    }

    @Override // defpackage.kb2
    public final kb2 H0(int i) {
        return I0().H0(i);
    }

    public final kb2 I0() {
        return m80.a.getIntVolatile(this, e) == 1 ? xg3.b : this.c;
    }

    @Override // defpackage.kb2
    public final String toString() {
        return "DeferredDispatchCoroutineDispatcher(delegate=" + this.c + ")";
    }
}
