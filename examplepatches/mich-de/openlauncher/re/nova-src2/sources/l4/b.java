package l4;

import android.graphics.Rect;
import android.os.Parcelable;
import android.view.MotionEvent;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;

/* loaded from: classes2.dex */
public abstract class b {
    public boolean e(View view, Rect rect) {
        return false;
    }

    public boolean f(View view, View view2) {
        return false;
    }

    public void g(e eVar) {
    }

    public boolean h(CoordinatorLayout coordinatorLayout, View view, View view2) {
        return false;
    }

    public void i(CoordinatorLayout coordinatorLayout, View view) {
    }

    public void j() {
    }

    public boolean k(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        return false;
    }

    public boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) {
        return false;
    }

    public boolean m(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12) {
        return false;
    }

    public boolean n(View view) {
        return false;
    }

    public void o(CoordinatorLayout coordinatorLayout, View view, View view2, int i5, int i11, int[] iArr, int i12) {
    }

    public void p(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12, int[] iArr) {
        iArr[0] = iArr[0] + i11;
        iArr[1] = iArr[1] + i12;
    }

    public boolean q(CoordinatorLayout coordinatorLayout, View view, Rect rect, boolean z11) {
        return false;
    }

    public void r(View view, Parcelable parcelable) {
    }

    public Parcelable s(View view) {
        return View.BaseSavedState.EMPTY_STATE;
    }

    public boolean t(CoordinatorLayout coordinatorLayout, View view, View view2, int i5, int i11) {
        return false;
    }

    public void u(CoordinatorLayout coordinatorLayout, View view, View view2, int i5) {
    }

    public boolean v(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        return false;
    }
}
