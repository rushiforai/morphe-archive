package cl;

import com.google.common.util.concurrent.ListenableFuture;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public abstract class y extends b0 {
    public static final Logger o = Logger.getLogger(y.class.getName());

    /* renamed from: l, reason: collision with root package name */
    public xk.q0 f20088l;

    /* renamed from: m, reason: collision with root package name */
    public final boolean f20089m;
    public final boolean n;

    public y(xk.q0 q0Var, boolean z11, boolean z12) {
        int size = q0Var.size();
        this.f19984h = null;
        this.f19985i = size;
        this.f20088l = q0Var;
        this.f20089m = z11;
        this.n = z12;
    }

    @Override // cl.s
    public final void e() {
        xk.q0 q0Var = this.f20088l;
        x(1);
        if ((q0Var != null) && (this.f20073a instanceof d)) {
            boolean zQ = q();
            lh.h it = q0Var.iterator();
            while (it.hasNext()) {
                ((Future) it.next()).cancel(zQ);
            }
        }
    }

    @Override // cl.s
    public final String l() {
        xk.q0 q0Var = this.f20088l;
        if (q0Var == null) {
            return super.l();
        }
        return "futures=" + q0Var;
    }

    public abstract void r(int i5, Object obj);

    public final void s(int i5, Future future) {
        try {
            r(i5, w0.a(future));
        } catch (Error e3) {
            e = e3;
            v(e);
        } catch (RuntimeException e11) {
            e = e11;
            v(e);
        } catch (ExecutionException e12) {
            v(e12.getCause());
        }
    }

    public final void t(xk.q0 q0Var) {
        int iT = b0.f19982j.T(this);
        int i5 = 0;
        vk.b0.j("Less than 0 remaining futures", iT >= 0);
        if (iT == 0) {
            if (q0Var != null) {
                lh.h it = q0Var.iterator();
                while (it.hasNext()) {
                    Future future = (Future) it.next();
                    if (!future.isCancelled()) {
                        s(i5, future);
                    }
                    i5++;
                }
            }
            this.f19984h = null;
            u();
            x(2);
        }
    }

    public abstract void u();

    public final void v(Throwable th2) {
        th2.getClass();
        if (this.f20089m && !o(th2)) {
            Set set = this.f19984h;
            if (set == null) {
                Set setT = xk.w.t();
                setT.getClass();
                if (!(this.f20073a instanceof d)) {
                    Throwable thA = a();
                    Objects.requireNonNull(thA);
                    while (thA != null && setT.add(thA)) {
                        thA = thA.getCause();
                    }
                }
                b0.f19982j.E(this, setT);
                Set set2 = this.f19984h;
                Objects.requireNonNull(set2);
                set = set2;
            }
            for (Throwable cause = th2; cause != null; cause = cause.getCause()) {
                if (set.add(cause)) {
                }
            }
            o.log(Level.SEVERE, th2 instanceof Error ? "Input Future failed with Error" : "Got more than one input Future failure. Logging failures after the first", th2);
            return;
        }
        boolean z11 = th2 instanceof Error;
        if (z11) {
            o.log(Level.SEVERE, z11 ? "Input Future failed with Error" : "Got more than one input Future failure. Logging failures after the first", th2);
        }
    }

    public final void w() {
        Objects.requireNonNull(this.f20088l);
        if (this.f20088l.isEmpty()) {
            u();
            return;
        }
        boolean z11 = this.f20089m;
        m0 m0Var = m0.f20038a;
        if (!z11) {
            b80.a aVar = new b80.a(3, this, this.n ? this.f20088l : null);
            lh.h it = this.f20088l.iterator();
            while (it.hasNext()) {
                ((ListenableFuture) it.next()).b(aVar, m0Var);
            }
            return;
        }
        lh.h it2 = this.f20088l.iterator();
        final int i5 = 0;
        while (it2.hasNext()) {
            final ListenableFuture listenableFuture = (ListenableFuture) it2.next();
            listenableFuture.b(new Runnable() { // from class: cl.x
                @Override // java.lang.Runnable
                public final void run() {
                    ListenableFuture listenableFuture2 = listenableFuture;
                    int i11 = i5;
                    y yVar = this.f20084a;
                    yVar.getClass();
                    try {
                        if (listenableFuture2.isCancelled()) {
                            yVar.f20088l = null;
                            yVar.cancel(false);
                        } else {
                            yVar.s(i11, listenableFuture2);
                        }
                        yVar.t(null);
                    } catch (Throwable th2) {
                        yVar.t(null);
                        throw th2;
                    }
                }
            }, m0Var);
            i5++;
        }
    }

    public abstract void x(int i5);
}
