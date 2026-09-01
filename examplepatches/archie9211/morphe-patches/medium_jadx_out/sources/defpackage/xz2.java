package defpackage;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewPropertyAnimator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xz2 extends AnimatorListenerAdapter {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ pr0 b;
    public final /* synthetic */ View c;
    public final /* synthetic */ ViewPropertyAnimator d;
    public final /* synthetic */ c03 e;

    public xz2(c03 c03Var, pr0 pr0Var, ViewPropertyAnimator viewPropertyAnimator, View view) {
        this.e = c03Var;
        this.b = pr0Var;
        this.d = viewPropertyAnimator;
        this.c = view;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animator) {
        switch (this.a) {
            case 1:
                this.c.setAlpha(1.0f);
                break;
            default:
                super.onAnimationCancel(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        int i = this.a;
        pr0 pr0Var = this.b;
        c03 c03Var = this.e;
        ViewPropertyAnimator viewPropertyAnimator = this.d;
        switch (i) {
            case 0:
                viewPropertyAnimator.setListener(null);
                this.c.setAlpha(1.0f);
                c03Var.c(pr0Var);
                c03Var.q.remove(pr0Var);
                c03Var.i();
                break;
            default:
                viewPropertyAnimator.setListener(null);
                c03Var.c(pr0Var);
                c03Var.o.remove(pr0Var);
                c03Var.i();
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        switch (this.a) {
            case 0:
                this.e.getClass();
                break;
            default:
                this.e.getClass();
                break;
        }
    }

    public xz2(c03 c03Var, pr0 pr0Var, View view, ViewPropertyAnimator viewPropertyAnimator) {
        this.e = c03Var;
        this.b = pr0Var;
        this.c = view;
        this.d = viewPropertyAnimator;
    }
}
