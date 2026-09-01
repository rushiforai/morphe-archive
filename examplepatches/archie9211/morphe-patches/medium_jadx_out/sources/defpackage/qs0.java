package defpackage;

import java.util.concurrent.locks.LockSupport;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qs0 extends z0 {
    public final Thread d;
    public final k34 e;

    public qs0(ib2 ib2Var, Thread thread, k34 k34Var) {
        super(ib2Var, true);
        this.d = thread;
        this.e = k34Var;
    }

    @Override // defpackage.db6
    public final void g(Object obj) {
        Thread threadCurrentThread = Thread.currentThread();
        Thread thread = this.d;
        if (g76.L(threadCurrentThread, thread)) {
            return;
        }
        LockSupport.unpark(thread);
    }
}
