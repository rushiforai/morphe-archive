package defpackage;

import android.os.Trace;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.KotlinNothingValueException;
import kotlin.NoWhenBranchMatchedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l69 {
    public final q22 a;
    public final l22 b;
    public final p65 c;
    public final b55 d;
    public final boolean e;
    public final vwa f;
    public final Object g;
    public final AtomicReference h = new AtomicReference(n69.InitialPending);
    public long i = to7.j();
    public g78 j;
    public final l3b k;
    public final vwa l;

    public l69(q22 q22Var, l22 l22Var, p65 p65Var, i78 i78Var, b55 b55Var, boolean z, vwa vwaVar, Object obj) {
        this.a = q22Var;
        this.b = l22Var;
        this.c = p65Var;
        this.d = b55Var;
        this.e = z;
        this.f = vwaVar;
        this.g = obj;
        g78 g78Var = iqb.a;
        g78Var.getClass();
        this.j = g78Var;
        l3b l3bVar = new l3b(0);
        l3bVar.j(i78Var, p65Var.A());
        this.k = l3bVar;
        this.l = new vwa(vwaVar.c);
    }

    public final void a() throws Exception {
        AtomicReference atomicReference = this.h;
        try {
            switch (k69.a[((n69) atomicReference.get()).ordinal()]) {
                case 1:
                case 2:
                case 3:
                    throw new IllegalStateException("The paused composition has not completed yet");
                case 4:
                    b();
                    n69 n69Var = n69.ApplyPending;
                    n69 n69Var2 = n69.Applied;
                    while (!atomicReference.compareAndSet(n69Var, n69Var2)) {
                        if (atomicReference.get() != n69Var) {
                            xx9.b("Unexpected state change from: " + n69Var + " to: " + n69Var2 + '.');
                            return;
                        }
                    }
                    return;
                case 5:
                    throw new IllegalStateException("The paused composition has already been applied");
                case 6:
                    throw new IllegalStateException("The paused composition has been cancelled");
                case 7:
                    throw new IllegalStateException("The paused composition is invalid because of a previous exception");
                default:
                    throw new NoWhenBranchMatchedException();
            }
        } catch (Exception e) {
            atomicReference.set(n69.Invalid);
            throw e;
        }
    }

    public final void b() {
        Trace.beginSection("PausedComposition:applyChanges");
        try {
            synchronized (this.g) {
                try {
                    this.l.A(this.f, this.k);
                    this.k.d();
                    this.k.e();
                } finally {
                    this.k.c();
                    this.a.q = null;
                }
            }
        } finally {
            Trace.endSection();
        }
    }

    public final boolean c() {
        return ((n69) this.h.get()).compareTo(n69.ApplyPending) >= 0;
    }

    public final void d() {
        AtomicReference atomicReference;
        n69 n69Var = n69.RecomposePending;
        n69 n69Var2 = n69.ApplyPending;
        do {
            atomicReference = this.h;
            if (atomicReference.compareAndSet(n69Var, n69Var2)) {
                return;
            }
        } while (atomicReference.get() == n69Var);
        xx9.b("Unexpected state change from: " + n69Var + " to: " + n69Var2 + '.');
    }

    public final boolean e(m8c m8cVar) throws Exception {
        AtomicReference atomicReference = this.h;
        try {
            int i = k69.a[((n69) atomicReference.get()).ordinal()];
            q22 q22Var = this.a;
            l22 l22Var = this.b;
            switch (i) {
                case 1:
                    p65 p65Var = this.c;
                    boolean z = this.e;
                    if (z) {
                        p65Var.z = 0;
                        p65Var.y = true;
                    }
                    try {
                        this.j = l22Var.b(q22Var, m8cVar, this.d);
                        n69 n69Var = n69.InitialPending;
                        n69 n69Var2 = n69.RecomposePending;
                        while (true) {
                            if (!atomicReference.compareAndSet(n69Var, n69Var2)) {
                                if (atomicReference.get() != n69Var) {
                                    xx9.b("Unexpected state change from: " + n69Var + " to: " + n69Var2 + '.');
                                }
                            }
                        }
                        if (this.j.g()) {
                            d();
                        }
                        return c();
                    } finally {
                        if (z) {
                            p65Var.t();
                        }
                    }
                case 2:
                    n69 n69Var3 = n69.RecomposePending;
                    n69 n69Var4 = n69.Recomposing;
                    while (true) {
                        if (!atomicReference.compareAndSet(n69Var3, n69Var4)) {
                            if (atomicReference.get() != n69Var3) {
                                xx9.b("Unexpected state change from: " + n69Var3 + " to: " + n69Var4 + '.');
                            }
                        }
                    }
                    long j = this.i;
                    try {
                        this.i = to7.j();
                        this.j = l22Var.n(q22Var, m8cVar, this.j);
                        this.i = j;
                        n69 n69Var5 = n69.Recomposing;
                        n69 n69Var6 = n69.RecomposePending;
                        while (true) {
                            if (!atomicReference.compareAndSet(n69Var5, n69Var6)) {
                                if (atomicReference.get() != n69Var5) {
                                    xx9.b("Unexpected state change from: " + n69Var5 + " to: " + n69Var6 + '.');
                                }
                            }
                        }
                        if (this.j.g()) {
                            d();
                        }
                        return c();
                    } catch (Throwable th) {
                        this.i = j;
                        n69 n69Var7 = n69.Recomposing;
                        n69 n69Var8 = n69.RecomposePending;
                        while (true) {
                            if (!atomicReference.compareAndSet(n69Var7, n69Var8)) {
                                if (atomicReference.get() != n69Var7) {
                                    xx9.b("Unexpected state change from: " + n69Var7 + " to: " + n69Var8 + '.');
                                }
                            }
                        }
                        throw th;
                    }
                case 3:
                    b22.b("Recursive call to resume()");
                    throw new KotlinNothingValueException();
                case 4:
                    throw new IllegalStateException("Pausable composition is complete and apply() should be applied");
                case 5:
                    throw new IllegalStateException("The paused composition has been applied");
                case 6:
                    throw new IllegalStateException("The paused composition has been cancelled");
                case 7:
                    throw new IllegalStateException("The paused composition is invalid because of a previous exception");
                default:
                    throw new NoWhenBranchMatchedException();
            }
        } catch (Exception e) {
            atomicReference.set(n69.Invalid);
            throw e;
        }
    }
}
