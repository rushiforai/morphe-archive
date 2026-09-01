package defpackage;

import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ob9 extends rr5 {
    @Override // defpackage.rr5
    public final void J0(pb9 pb9Var) {
        qb9 qb9Var = (qb9) bo.K(this, z22.w);
        if (qb9Var != null) {
            hn hnVar = (hn) qb9Var;
            if (pb9Var == null) {
                pb9.a.getClass();
                pb9Var = t40.h;
            }
            if (Build.VERSION.SDK_INT >= 24) {
                zn.a.a(hnVar.b, pb9Var);
            }
        }
    }

    @Override // defpackage.rr5
    public final boolean L0(int i) {
        return (i == 3 || i == 4) ? false : true;
    }

    @Override // defpackage.ssd
    public final Object m() {
        return "androidx.compose.ui.input.pointer.PointerHoverIcon";
    }
}
