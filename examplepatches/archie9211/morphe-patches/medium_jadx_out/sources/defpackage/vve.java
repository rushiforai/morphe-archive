package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vve implements vbb, f03 {
    public final kva a;
    public final rx5 b;
    public final fy5 c;
    public final wx6 d;
    public final va6 e;

    public vve(kva kvaVar, rx5 rx5Var, fy5 fy5Var, wx6 wx6Var, va6 va6Var) {
        this.a = kvaVar;
        this.b = rx5Var;
        this.c = fy5Var;
        this.d = wx6Var;
        this.e = va6Var;
    }

    @Override // defpackage.vbb
    public final Object a(jva jvaVar) {
        Object objT;
        wx6 wx6Var = this.d;
        return (wx6Var == null || (objT = bgf.t(wx6Var, jvaVar)) != tb2.COROUTINE_SUSPENDED) ? c1e.a : objT;
    }

    @Override // defpackage.vbb
    public final void b() {
        fy5 fy5Var = this.c;
        if (fy5Var.b.isAttachedToWindow()) {
            return;
        }
        wve wveVarT = yo7.t(fy5Var.b);
        vve vveVar = wveVarT.c;
        if (vveVar != null) {
            vveVar.d();
        }
        wveVarT.c = this;
        throw new CancellationException("'ViewTarget.view' must be attached to a window.");
    }

    public final void d() {
        this.e.m(null);
        fy5 fy5Var = this.c;
        boolean z = fy5Var instanceof hy6;
        wx6 wx6Var = this.d;
        if (z && wx6Var != null) {
            wx6Var.b(fy5Var);
        }
        if (wx6Var != null) {
            wx6Var.b(this);
        }
    }

    @Override // defpackage.f03
    public final void onDestroy(iy6 iy6Var) {
        wve wveVarT = yo7.t(this.c.b);
        synchronized (wveVarT) {
            try {
                enc encVar = wveVarT.b;
                n92 n92Var = null;
                if (encVar != null) {
                    encVar.m(null);
                }
                qd5 qd5Var = qd5.a;
                r13 r13Var = xg3.a;
                wveVarT.b = vx0.c0(qd5Var, ff7.a.f, null, new obb(wveVarT, n92Var, 25), 2);
                wveVarT.a = null;
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // defpackage.vbb
    public final void start() {
        wx6 wx6Var = this.d;
        if (wx6Var != null) {
            wx6Var.a(this);
        }
        fy5 fy5Var = this.c;
        if ((fy5Var instanceof hy6) && wx6Var != null) {
            fy5 fy5Var2 = fy5Var;
            wx6Var.b(fy5Var2);
            wx6Var.a(fy5Var2);
        }
        wve wveVarT = yo7.t(fy5Var.b);
        vve vveVar = wveVarT.c;
        if (vveVar != null) {
            vveVar.d();
        }
        wveVarT.c = this;
    }

    @Override // defpackage.vbb
    public final void c() {
    }

    @Override // defpackage.f03
    public final void onCreate(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onPause(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onResume(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onStart(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onStop(iy6 iy6Var) {
    }
}
