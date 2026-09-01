package defpackage;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x94 extends AnimatorListenerAdapter {
    public boolean a = false;
    public final /* synthetic */ y94 b;

    public x94(y94 y94Var) {
        this.b = y94Var;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        this.a = true;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        if (this.a) {
            this.a = false;
            return;
        }
        y94 y94Var = this.b;
        if (((Float) y94Var.z.getAnimatedValue()).floatValue() == 0.0f) {
            y94Var.A = 0;
            y94Var.e(0);
        } else {
            y94Var.A = 2;
            y94Var.s.invalidate();
        }
    }
}
