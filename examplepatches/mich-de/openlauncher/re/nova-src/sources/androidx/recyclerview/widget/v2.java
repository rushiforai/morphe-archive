package androidx.recyclerview.widget;

import android.annotation.SuppressLint;
import android.view.View;

/* loaded from: classes.dex */
public abstract class v2 extends u1 {
    private static final boolean DEBUG = false;
    private static final String TAG = "SimpleItemAnimator";
    boolean mSupportsChangeAnimations;

    public abstract boolean animateAdd(s2 s2Var);

    @Override // androidx.recyclerview.widget.u1
    public boolean animateAppearance(s2 s2Var, t1 t1Var, t1 t1Var2) {
        int i5;
        int i11;
        return (t1Var == null || ((i5 = t1Var.f15125a) == (i11 = t1Var2.f15125a) && t1Var.f15126b == t1Var2.f15126b)) ? animateAdd(s2Var) : animateMove(s2Var, i5, t1Var.f15126b, i11, t1Var2.f15126b);
    }

    public abstract boolean animateChange(s2 s2Var, s2 s2Var2, int i5, int i11, int i12, int i13);

    @Override // androidx.recyclerview.widget.u1
    public boolean animateChange(s2 s2Var, s2 s2Var2, t1 t1Var, t1 t1Var2) {
        int i5;
        int i11;
        int i12 = t1Var.f15125a;
        int i13 = t1Var.f15126b;
        if (s2Var2.shouldIgnore()) {
            int i14 = t1Var.f15125a;
            i11 = t1Var.f15126b;
            i5 = i14;
        } else {
            i5 = t1Var2.f15125a;
            i11 = t1Var2.f15126b;
        }
        return animateChange(s2Var, s2Var2, i12, i13, i5, i11);
    }

    @Override // androidx.recyclerview.widget.u1
    public boolean animateDisappearance(s2 s2Var, t1 t1Var, t1 t1Var2) {
        int i5 = t1Var.f15125a;
        int i11 = t1Var.f15126b;
        View view = s2Var.itemView;
        int left = t1Var2 == null ? view.getLeft() : t1Var2.f15125a;
        int top = t1Var2 == null ? view.getTop() : t1Var2.f15126b;
        if (s2Var.isRemoved() || (i5 == left && i11 == top)) {
            return animateRemove(s2Var);
        }
        view.layout(left, top, view.getWidth() + left, view.getHeight() + top);
        return animateMove(s2Var, i5, i11, left, top);
    }

    public abstract boolean animateMove(s2 s2Var, int i5, int i11, int i12, int i13);

    @Override // androidx.recyclerview.widget.u1
    public boolean animatePersistence(s2 s2Var, t1 t1Var, t1 t1Var2) {
        int i5 = t1Var.f15125a;
        int i11 = t1Var2.f15125a;
        if (i5 != i11 || t1Var.f15126b != t1Var2.f15126b) {
            return animateMove(s2Var, i5, t1Var.f15126b, i11, t1Var2.f15126b);
        }
        dispatchMoveFinished(s2Var);
        return false;
    }

    public abstract boolean animateRemove(s2 s2Var);

    public boolean canReuseUpdatedViewHolder(s2 s2Var) {
        return !this.mSupportsChangeAnimations || s2Var.isInvalid();
    }

    @SuppressLint({"UnknownNullness"})
    public final void dispatchAddFinished(s2 s2Var) {
        onAddFinished(s2Var);
        dispatchAnimationFinished(s2Var);
    }

    @SuppressLint({"UnknownNullness"})
    public final void dispatchAddStarting(s2 s2Var) {
        onAddStarting(s2Var);
    }

    @SuppressLint({"UnknownNullness"})
    public final void dispatchChangeFinished(s2 s2Var, boolean z11) {
        onChangeFinished(s2Var, z11);
        dispatchAnimationFinished(s2Var);
    }

    @SuppressLint({"UnknownNullness"})
    public final void dispatchChangeStarting(s2 s2Var, boolean z11) {
        onChangeStarting(s2Var, z11);
    }

    @SuppressLint({"UnknownNullness"})
    public final void dispatchMoveFinished(s2 s2Var) {
        onMoveFinished(s2Var);
        dispatchAnimationFinished(s2Var);
    }

    @SuppressLint({"UnknownNullness"})
    public final void dispatchMoveStarting(s2 s2Var) {
        onMoveStarting(s2Var);
    }

    @SuppressLint({"UnknownNullness"})
    public final void dispatchRemoveFinished(s2 s2Var) {
        onRemoveFinished(s2Var);
        dispatchAnimationFinished(s2Var);
    }

    @SuppressLint({"UnknownNullness"})
    public final void dispatchRemoveStarting(s2 s2Var) {
        onRemoveStarting(s2Var);
    }

    public boolean getSupportsChangeAnimations() {
        return this.mSupportsChangeAnimations;
    }

    @SuppressLint({"UnknownNullness"})
    public void onAddFinished(s2 s2Var) {
    }

    @SuppressLint({"UnknownNullness"})
    public void onAddStarting(s2 s2Var) {
    }

    @SuppressLint({"UnknownNullness"})
    public void onChangeFinished(s2 s2Var, boolean z11) {
    }

    @SuppressLint({"UnknownNullness"})
    public void onChangeStarting(s2 s2Var, boolean z11) {
    }

    @SuppressLint({"UnknownNullness"})
    public void onMoveFinished(s2 s2Var) {
    }

    @SuppressLint({"UnknownNullness"})
    public void onMoveStarting(s2 s2Var) {
    }

    @SuppressLint({"UnknownNullness"})
    public void onRemoveFinished(s2 s2Var) {
    }

    @SuppressLint({"UnknownNullness"})
    public void onRemoveStarting(s2 s2Var) {
    }

    public void setSupportsChangeAnimations(boolean z11) {
        this.mSupportsChangeAnimations = z11;
    }
}
