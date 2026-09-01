package defpackage;

import android.view.View;
import android.view.inputmethod.InputMethodManager;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vy5 implements cy6 {
    public static final w5d b = new w5d(new e73(18));
    public final xy1 a;

    public vy5(xy1 xy1Var) {
        this.a = xy1Var;
    }

    @Override // defpackage.cy6
    public final void f(iy6 iy6Var, ux6 ux6Var) {
        if (ux6Var != ux6.ON_DESTROY) {
            return;
        }
        Object systemService = this.a.getSystemService("input_method");
        systemService.getClass();
        InputMethodManager inputMethodManager = (InputMethodManager) systemService;
        sy5 sy5Var = (sy5) b.getValue();
        Object objB = sy5Var.b(inputMethodManager);
        if (objB == null) {
            return;
        }
        synchronized (objB) {
            View viewC = sy5Var.c(inputMethodManager);
            if (viewC == null) {
                return;
            }
            if (viewC.isAttachedToWindow()) {
                return;
            }
            boolean zA = sy5Var.a(inputMethodManager);
            if (zA) {
                inputMethodManager.isActive();
            }
        }
    }
}
