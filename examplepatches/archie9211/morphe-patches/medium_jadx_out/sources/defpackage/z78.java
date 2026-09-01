package defpackage;

import androidx.compose.foundation.MutationInterruptedException;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z78 {
    public final AtomicReference a = new AtomicReference(null);
    public final a98 b = new a98();

    public static Object a(z78 z78Var, x45 x45Var, p4d p4dVar) {
        s78 s78Var = s78.Default;
        z78Var.getClass();
        return o7f.s(new nz(s78Var, z78Var, x45Var, (n92) null, 10), p4dVar);
    }

    public final void b(w78 w78Var) {
        while (true) {
            AtomicReference atomicReference = this.a;
            w78 w78Var2 = (w78) atomicReference.get();
            if (w78Var2 != null && w78Var.a.compareTo(w78Var2.a) < 0) {
                throw new CancellationException("Current mutation had a higher priority");
            }
            while (!atomicReference.compareAndSet(w78Var2, w78Var)) {
                if (atomicReference.get() != w78Var2) {
                    break;
                }
            }
            if (w78Var2 != null) {
                w78Var2.b.m(new MutationInterruptedException("Mutation interrupted"));
                return;
            }
            return;
        }
    }
}
