package defpackage;

import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class yue extends da2 {
    public u11 a;

    @Override // defpackage.da2
    public boolean k(CoordinatorLayout coordinatorLayout, View view, int i) {
        v(coordinatorLayout, view, i);
        u11 u11Var = this.a;
        if (u11Var == null) {
            u11Var = new u11(view);
            this.a = u11Var;
        }
        View view2 = (View) u11Var.d;
        u11Var.b = view2.getTop();
        u11Var.c = view2.getLeft();
        u11 u11Var2 = this.a;
        View view3 = (View) u11Var2.d;
        int top = 0 - (view3.getTop() - u11Var2.b);
        WeakHashMap weakHashMap = ute.a;
        view3.offsetTopAndBottom(top);
        view3.offsetLeftAndRight(0 - (view3.getLeft() - u11Var2.c));
        return true;
    }

    public void v(CoordinatorLayout coordinatorLayout, View view, int i) {
        coordinatorLayout.j(view, i);
    }
}
