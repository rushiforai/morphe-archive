package o9;

import android.animation.LayoutTransition;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes2.dex */
public final class r2 implements LayoutTransition.TransitionListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ s2 f80090a;

    public r2(s2 s2Var) {
        this.f80090a = s2Var;
    }

    @Override // android.animation.LayoutTransition.TransitionListener
    public final void endTransition(LayoutTransition layoutTransition, ViewGroup viewGroup, View view, int i5) {
        if (layoutTransition.isRunning()) {
            return;
        }
        layoutTransition.removeTransitionListener(this);
        s2 s2Var = this.f80090a;
        int childCount = s2Var.getChildCount();
        if (childCount > 0) {
            iN = s2Var.N(s2Var.T() ? 0 : childCount - 1);
        }
        s2Var.f80109i = iN;
    }

    @Override // android.animation.LayoutTransition.TransitionListener
    public final void startTransition(LayoutTransition layoutTransition, ViewGroup viewGroup, View view, int i5) {
    }
}
