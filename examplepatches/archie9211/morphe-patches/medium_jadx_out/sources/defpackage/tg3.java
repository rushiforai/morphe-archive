package defpackage;

import java.util.concurrent.CancellationException;
import kotlinx.coroutines.DispatchException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class tg3 extends vfd {
    public int c;

    public tg3(int i) {
        super(0L, false);
        this.c = i;
    }

    public abstract n92 c();

    public Throwable e(Object obj) {
        cy1 cy1Var = obj instanceof cy1 ? (cy1) obj : null;
        if (cy1Var != null) {
            return cy1Var.a;
        }
        return null;
    }

    public final void g(Throwable th) {
        kyd.Y(c().getContext(), new zb2("Fatal exception in coroutines machinery for " + this + ". Please read KDoc to 'handleFatalException' method and report this incident to maintainers", th));
    }

    public abstract Object h();

    @Override // java.lang.Runnable
    public final void run() {
        try {
            n92 n92VarC = c();
            n92VarC.getClass();
            rg3 rg3Var = (rg3) n92VarC;
            p92 p92Var = rg3Var.e;
            Object obj = rg3Var.g;
            ib2 context = p92Var.getContext();
            Object objF0 = gx1.f0(context, obj);
            va6 va6Var = null;
            uzd uzdVarA0 = objF0 != gx1.o ? guc.a0(p92Var, context, objF0) : null;
            try {
                ib2 context2 = p92Var.getContext();
                Object objH = h();
                Throwable thE = e(objH);
                if (thE == null) {
                    int i = this.c;
                    boolean z = true;
                    if (i != 1 && i != 2) {
                        z = false;
                    }
                    if (z) {
                        va6Var = (va6) context2.o0(cd7.g);
                    }
                }
                if (va6Var != null && !va6Var.f()) {
                    CancellationException cancellationExceptionL = va6Var.L();
                    b(cancellationExceptionL);
                    p92Var.resumeWith(br7.n(cancellationExceptionL));
                } else if (thE != null) {
                    p92Var.resumeWith(new ajb(thE));
                } else {
                    p92Var.resumeWith(f(objH));
                }
                if (uzdVarA0 == null || uzdVarA0.m0()) {
                    gx1.Z(context, objF0);
                }
            } catch (Throwable th) {
                if (uzdVarA0 == null || uzdVarA0.m0()) {
                    gx1.Z(context, objF0);
                }
                throw th;
            }
        } catch (DispatchException e) {
            kyd.Y(c().getContext(), e.a);
        } catch (Throwable th2) {
            g(th2);
        }
    }

    public void b(CancellationException cancellationException) {
    }

    public Object f(Object obj) {
        return obj;
    }
}
