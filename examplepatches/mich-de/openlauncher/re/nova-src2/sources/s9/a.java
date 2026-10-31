package s9;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes.dex */
public final class a extends AnimatorListenerAdapter implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public View f86768a;

    public static void a(View view) {
        if (view.getAlpha() < 0.01f && view.getVisibility() != 4) {
            view.setVisibility(4);
            return;
        }
        if (view.getAlpha() <= 0.01f || view.getVisibility() == 0) {
            return;
        }
        if (!(view instanceof ViewGroup)) {
            view.setVisibility(0);
            return;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int descendantFocusability = viewGroup.getDescendantFocusability();
        viewGroup.setDescendantFocusability(393216);
        viewGroup.setVisibility(0);
        viewGroup.setDescendantFocusability(descendantFocusability);
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        a(this.f86768a);
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        this.f86768a.setVisibility(0);
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        a(this.f86768a);
    }
}
