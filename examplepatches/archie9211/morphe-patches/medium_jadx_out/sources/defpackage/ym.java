package defpackage;

import android.graphics.Rect;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ym extends q28 implements my0, xxb, lk6, sp6, ssd {
    public final ce o = new ce(2, this);
    public final /* synthetic */ mn p;

    public ym(mn mnVar) {
        this.p = mnVar;
    }

    @Override // defpackage.lk6
    public final boolean D(KeyEvent keyEvent) {
        br4 br4Var;
        int[] iArr = ir4.a;
        long jP0 = nk7.p0(keyEvent);
        if (fk6.a(jP0, fk6.b)) {
            br4Var = new br4(2);
        } else if (fk6.a(jP0, fk6.c)) {
            br4Var = new br4(1);
        } else if (fk6.a(jP0, fk6.p)) {
            br4Var = new br4(keyEvent.isShiftPressed() ? 2 : 1);
        } else {
            br4Var = fk6.a(jP0, fk6.g) ? new br4(4) : fk6.a(jP0, fk6.f) ? new br4(3) : (fk6.a(jP0, fk6.d) || fk6.a(jP0, fk6.C)) ? new br4(5) : (fk6.a(jP0, fk6.e) || fk6.a(jP0, fk6.D)) ? new br4(6) : (fk6.a(jP0, fk6.h) || fk6.a(jP0, fk6.r) || fk6.a(jP0, fk6.E)) ? new br4(7) : (fk6.a(jP0, fk6.a) || fk6.a(jP0, fk6.u)) ? new br4(8) : null;
        }
        if (br4Var != null) {
            int i = br4Var.a;
            if (nk7.q0(keyEvent) == 2) {
                mn mnVar = this.p;
                es4 es4VarF = ((or4) mnVar.getFocusOwner()).f();
                if (es4VarF == null || !es4VarF.o || !mnVar.x(i)) {
                    Boolean boolE = ((or4) mnVar.getFocusOwner()).e(i, mnVar.getEmbeddedViewFocusRect(), new ce(1, br4Var));
                    if (!(boolE != null ? boolE.booleanValue() : true)) {
                        if (i == 1 || i == 2) {
                            Integer numC = ir4.c(i);
                            int iIntValue = numC != null ? numC.intValue() : 2;
                            FocusFinder focusFinder = FocusFinder.getInstance();
                            View rootView = mnVar.getRootView();
                            rootView.getClass();
                            View viewFindNextFocus = focusFinder.findNextFocus((ViewGroup) rootView, mnVar.getView(), iIntValue);
                            if (viewFindNextFocus == null || viewFindNextFocus.equals(mnVar)) {
                                return ((or4) mnVar.getFocusOwner()).h(i);
                            }
                        }
                    }
                }
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.my0
    public final Object G(eh8 eh8Var, cn cnVar, p92 p92Var) {
        long jI = eh8Var.I(0L);
        zwa zwaVar = (zwa) cnVar.invoke();
        zwa zwaVarI = zwaVar != null ? zwaVar.i(jI) : null;
        if (zwaVarI != null) {
            this.p.requestRectangleOnScreen(new Rect((int) zwaVarI.a, (int) zwaVarI.b, (int) zwaVarI.c, (int) zwaVarI.d), false);
        }
        return c1e.a;
    }

    @Override // defpackage.xxb
    public final boolean I() {
        return false;
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int a(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.d(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final al7 c(bl7 bl7Var, tk7 tk7Var, long j) {
        t99 t99VarS = tk7Var.s(j);
        return bl7Var.h0(t99VarS.a, t99VarS.b, fy3.a, this.o, new xm(t99VarS, 0));
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int d(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.b(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int e(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.f(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.sp6
    public final /* synthetic */ int g(fb7 fb7Var, tk7 tk7Var, int i) {
        return km4.h(this, fb7Var, tk7Var, i);
    }

    @Override // defpackage.xxb
    public final boolean i() {
        return true;
    }

    @Override // defpackage.lk6
    public final boolean j(KeyEvent keyEvent) {
        return false;
    }

    @Override // defpackage.ssd
    public final Object m() {
        return "androidx.compose.ui.layout.WindowInsetsRulers";
    }

    @Override // defpackage.xxb
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.xxb
    public final void r0(jyb jybVar) {
    }
}
