package defpackage;

import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gs4 extends q28 implements rr4 {
    @Override // defpackage.rr4
    public final void C(pr4 pr4Var) {
        View viewG = t40.G(this);
        pr4Var.d(this.a.n && t40.G(this).hasFocusable());
        View viewFindFocus = viewG.findFocus();
        if (viewFindFocus != null) {
            pr4Var.e(ir4.a(viewFindFocus, viewG));
        }
    }
}
