package defpackage;

import android.animation.Animator;
import android.graphics.RectF;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ky5 implements Animator.AnimatorListener {
    public final /* synthetic */ py5 a;

    public ky5(py5 py5Var) {
        this.a = py5Var;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        py5 py5Var = this.a;
        RectF rectFB = py5Var.b(py5Var.b);
        float f = rectFB.left;
        if (f == 0.0f && rectFB.top == 0.0f) {
            return;
        }
        py5Var.f(f, rectFB.top);
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
    }
}
