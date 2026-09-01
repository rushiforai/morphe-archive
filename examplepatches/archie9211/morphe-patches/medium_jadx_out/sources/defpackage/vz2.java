package defpackage;

import java.util.concurrent.Executor;
import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vz2 extends v44 implements Executor {
    public static final vz2 c = new vz2();
    public static final kb2 d;

    static {
        f1e f1eVar = f1e.c;
        int i = a7d.a;
        if (64 >= i) {
            i = 64;
        }
        d = f1eVar.H0(kk7.D(i, 12, "kotlinx.coroutines.io.parallelism"));
    }

    @Override // defpackage.kb2
    public final void E0(ib2 ib2Var, Runnable runnable) {
        d.E0(ib2Var, runnable);
    }

    @Override // defpackage.kb2
    public final void F0(ib2 ib2Var, Runnable runnable) throws DispatchException {
        d.F0(ib2Var, runnable);
    }

    @Override // defpackage.kb2
    public final kb2 H0(int i) {
        return f1e.c.H0(i);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        throw new IllegalStateException("Cannot be invoked on Dispatchers.IO");
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        E0(zx3.a, runnable);
    }

    @Override // defpackage.kb2
    public final String toString() {
        return "Dispatchers.IO";
    }
}
