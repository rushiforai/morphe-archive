package o9;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.view.View;

/* loaded from: classes2.dex */
public final class r3 implements ValueAnimator.AnimatorUpdateListener, Animator.AnimatorListener {

    /* renamed from: a, reason: collision with root package name */
    public final View f80091a;

    public r3(View view) {
        this.f80091a = view;
    }

    public static void a(View view) {
        if (view.getAlpha() < 0.01f && view.getVisibility() != 8) {
            view.setVisibility(8);
        } else {
            if (view.getAlpha() <= 0.01f || view.getVisibility() == 0) {
                return;
            }
            view.setVisibility(0);
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        a(this.f80091a);
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        this.f80091a.setVisibility(0);
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        a(this.f80091a);
    }
}
