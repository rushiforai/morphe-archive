package defpackage;

import android.view.View;
import android.view.ViewParent;
import android.view.ViewTreeObserver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class fr4 extends q28 implements rr4, ViewTreeObserver.OnGlobalFocusChangeListener {
    public ViewTreeObserver o;
    public final er4 p = new er4(this, 0);
    public final er4 q = new er4(this, 1);

    @Override // defpackage.q28
    public final void A0() {
        ViewTreeObserver viewTreeObserver = this.o;
        if (viewTreeObserver != null && viewTreeObserver.isAlive()) {
            viewTreeObserver.removeOnGlobalFocusChangeListener(this);
        }
        this.o = null;
        guc.U(this).getViewTreeObserver().removeOnGlobalFocusChangeListener(this);
    }

    @Override // defpackage.rr4
    public final void C(pr4 pr4Var) {
        pr4Var.d(false);
        pr4Var.c(this.p);
        pr4Var.a(this.q);
    }

    public final es4 I0() {
        boolean z;
        if (!this.a.n) {
            b26.b("visitLocalDescendants called on an unattached node");
        }
        q28 q28Var = this.a;
        if ((q28Var.d & 1024) != 0) {
            boolean z2 = false;
            for (q28 q28Var2 = q28Var.f; q28Var2 != null; q28Var2 = q28Var2.f) {
                if ((q28Var2.c & 1024) != 0) {
                    q28 q28VarQ0 = q28Var2;
                    o78 o78Var = null;
                    while (q28VarQ0 != null) {
                        if (q28VarQ0 instanceof es4) {
                            es4 es4Var = (es4) q28VarQ0;
                            if (z2) {
                                return es4Var;
                            }
                            z = false;
                            z2 = true;
                        } else {
                            z = true;
                        }
                        if (z && (q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                            int i = 0;
                            for (q28 q28Var3 = ((b43) q28VarQ0).p; q28Var3 != null; q28Var3 = q28Var3.f) {
                                if ((q28Var3.c & 1024) != 0) {
                                    i++;
                                    if (i == 1) {
                                        q28VarQ0 = q28Var3;
                                    } else {
                                        if (o78Var == null) {
                                            o78Var = new o78(new q28[16]);
                                        }
                                        if (q28VarQ0 != null) {
                                            o78Var.b(q28VarQ0);
                                            q28VarQ0 = null;
                                        }
                                        o78Var.b(q28Var3);
                                    }
                                }
                            }
                            if (i == 1) {
                            }
                        }
                        q28VarQ0 = flb.q0(o78Var);
                    }
                }
            }
        }
        ygf.f("Could not find focus target of embedded view wrapper");
        return null;
    }

    @Override // android.view.ViewTreeObserver.OnGlobalFocusChangeListener
    public final void onGlobalFocusChanged(View view, View view2) {
        boolean z;
        if (flb.v0(this).n == null) {
            return;
        }
        View viewG = t40.G(this);
        lr4 focusOwner = ((mn) flb.w0(this)).getFocusOwner();
        mx8 mx8VarW0 = flb.w0(this);
        boolean z2 = true;
        if (view == null || view.equals(mx8VarW0)) {
            z = false;
        } else {
            for (ViewParent parent = view.getParent(); parent != null; parent = parent.getParent()) {
                if (parent == viewG.getParent()) {
                    z = true;
                    break;
                }
            }
            z = false;
        }
        if (view2 == null || view2.equals(mx8VarW0)) {
            z2 = false;
        } else {
            for (ViewParent parent2 = view2.getParent(); parent2 != null; parent2 = parent2.getParent()) {
                if (parent2 == viewG.getParent()) {
                    break;
                }
            }
            z2 = false;
        }
        if (z && z2) {
            return;
        }
        if (z2) {
            es4 es4VarI0 = I0();
            if (es4VarI0.N0().getHasFocus()) {
                return;
            }
            k50.g0(es4VarI0);
            return;
        }
        if (z && I0().N0().isFocused()) {
            ((or4) focusOwner).b(8, false, false);
        }
    }

    @Override // defpackage.q28
    public final void y0() {
        ViewTreeObserver viewTreeObserver = guc.U(this).getViewTreeObserver();
        this.o = viewTreeObserver;
        viewTreeObserver.addOnGlobalFocusChangeListener(this);
    }
}
