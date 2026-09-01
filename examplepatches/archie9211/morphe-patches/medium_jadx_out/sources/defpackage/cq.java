package defpackage;

import android.graphics.Rect;
import android.view.View;
import java.lang.ref.WeakReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cq implements ab9 {
    public fx6 a;
    public enc b;
    public lx6 c;
    public r6c d;

    @Override // defpackage.ab9
    public final void a(uid uidVar, yqa yqaVar, qjd qjdVar, k0b k0bVar, zwa zwaVar, zwa zwaVar2) {
        lx6 lx6Var = this.c;
        if (lx6Var != null) {
            gx6 gx6Var = lx6Var.m;
            synchronized (gx6Var.c) {
                try {
                    gx6Var.j = uidVar;
                    gx6Var.l = yqaVar;
                    gx6Var.k = qjdVar;
                    gx6Var.m = zwaVar;
                    gx6Var.n = zwaVar2;
                    if (gx6Var.e || gx6Var.d) {
                        gx6Var.a();
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
        }
    }

    @Override // defpackage.ab9
    public final void b(uid uidVar, ry5 ry5Var, pi9 pi9Var, qa2 qa2Var) {
        j(new s7(uidVar, this, ry5Var, pi9Var, qa2Var, 1));
    }

    @Override // defpackage.ab9
    public final void c() {
        j(null);
    }

    @Override // defpackage.ab9
    public final void d() {
        akc akcVar;
        fx6 fx6Var = this.a;
        if (fx6Var == null || (akcVar = (akc) bo.K(fx6Var, z22.r)) == null) {
            return;
        }
        ((n43) akcVar).b();
    }

    @Override // defpackage.ab9
    public final void e() throws Throwable {
        enc encVar = this.b;
        if (encVar != null) {
            encVar.m(null);
        }
        this.b = null;
        j78 j78VarI = i();
        if (j78VarI != null) {
            ((r6c) j78VarI).g();
        }
    }

    @Override // defpackage.ab9
    public final void f(uid uidVar, uid uidVar2) {
        lx6 lx6Var = this.c;
        if (lx6Var != null) {
            boolean z = (bkd.b(lx6Var.h.b, uidVar2.b) && g76.L(lx6Var.h.c, uidVar2.c)) ? false : true;
            lx6Var.h = uidVar2;
            int size = lx6Var.j.size();
            for (int i = 0; i < size; i++) {
                xwa xwaVar = (xwa) ((WeakReference) lx6Var.j.get(i)).get();
                if (xwaVar != null) {
                    xwaVar.g = uidVar2;
                }
            }
            gx6 gx6Var = lx6Var.m;
            synchronized (gx6Var.c) {
                gx6Var.j = null;
                gx6Var.l = null;
                gx6Var.k = null;
                gx6Var.m = null;
                gx6Var.n = null;
            }
            if (g76.L(uidVar, uidVar2)) {
                if (z) {
                    s26 s26Var = lx6Var.b;
                    int iF = bkd.f(uidVar2.b);
                    int iE = bkd.e(uidVar2.b);
                    bkd bkdVar = lx6Var.h.c;
                    int iF2 = bkdVar != null ? bkd.f(bkdVar.a) : -1;
                    bkd bkdVar2 = lx6Var.h.c;
                    s26Var.i0().updateSelection((View) s26Var.b, iF, iE, iF2, bkdVar2 != null ? bkd.e(bkdVar2.a) : -1);
                    return;
                }
                return;
            }
            if (uidVar != null && (!g76.L(uidVar.a.b, uidVar2.a.b) || (bkd.b(uidVar.b, uidVar2.b) && !g76.L(uidVar.c, uidVar2.c)))) {
                s26 s26Var2 = lx6Var.b;
                s26Var2.i0().restartInput((View) s26Var2.b);
                return;
            }
            int size2 = lx6Var.j.size();
            for (int i2 = 0; i2 < size2; i2++) {
                xwa xwaVar2 = (xwa) ((WeakReference) lx6Var.j.get(i2)).get();
                if (xwaVar2 != null) {
                    uid uidVar3 = lx6Var.h;
                    s26 s26Var3 = lx6Var.b;
                    if (xwaVar2.k) {
                        xwaVar2.g = uidVar3;
                        if (xwaVar2.i) {
                            s26Var3.i0().updateExtractedText((View) s26Var3.b, xwaVar2.h, hk7.H(uidVar3));
                        }
                        bkd bkdVar3 = uidVar3.c;
                        long j = uidVar3.b;
                        int iF3 = bkdVar3 != null ? bkd.f(bkdVar3.a) : -1;
                        bkd bkdVar4 = uidVar3.c;
                        s26Var3.i0().updateSelection((View) s26Var3.b, bkd.f(j), bkd.e(j), iF3, bkdVar4 != null ? bkd.e(bkdVar4.a) : -1);
                    }
                }
            }
        }
    }

    @Override // defpackage.ab9
    public final void g() {
        akc akcVar;
        fx6 fx6Var = this.a;
        if (fx6Var == null || (akcVar = (akc) bo.K(fx6Var, z22.r)) == null) {
            return;
        }
        ((n43) akcVar).a();
    }

    @Override // defpackage.ab9
    public final void h(zwa zwaVar) {
        Rect rect;
        lx6 lx6Var = this.c;
        if (lx6Var != null) {
            lx6Var.l = new Rect(nk7.w0(zwaVar.a), nk7.w0(zwaVar.b), nk7.w0(zwaVar.c), nk7.w0(zwaVar.d));
            if (!lx6Var.j.isEmpty() || (rect = lx6Var.l) == null) {
                return;
            }
            lx6Var.a.requestRectangleOnScreen(new Rect(rect));
        }
    }

    public final j78 i() {
        r6c r6cVar = this.d;
        if (r6cVar != null) {
            return r6cVar;
        }
        if (!zuc.a) {
            return null;
        }
        r6c r6cVarX = k40.x(0, 2, nz0.DROP_LATEST);
        this.d = r6cVarX;
        return r6cVarX;
    }

    public final void j(s7 s7Var) {
        fx6 fx6Var = this.a;
        if (fx6Var == null) {
            return;
        }
        this.b = fx6Var.n ? vx0.c0(fx6Var.u0(), null, wb2.UNDISPATCHED, new xs3(fx6Var, new ra(s7Var, this, fx6Var, encVar, 18), encVar, 25), 1) : null;
    }

    public final void k(fx6 fx6Var) {
        if (this.a != fx6Var) {
            e26.c("Expected textInputModifierNode to be " + fx6Var + " but was " + this.a);
        }
        this.a = null;
    }
}
