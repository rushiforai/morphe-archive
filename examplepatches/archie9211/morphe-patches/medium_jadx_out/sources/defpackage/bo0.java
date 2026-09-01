package defpackage;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.TimeInterpolator;
import android.view.ViewPropertyAnimator;
import com.google.android.material.snackbar.SnackbarContentLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bo0 extends AnimatorListenerAdapter {
    public final /* synthetic */ int a;
    public final /* synthetic */ jo0 b;

    public /* synthetic */ bo0(jo0 jo0Var, int i) {
        this.a = i;
        this.b = jo0Var;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        int i = this.a;
        jo0 jo0Var = this.b;
        switch (i) {
            case 0:
                jo0Var.c();
                break;
            case 1:
                jo0Var.d();
                break;
            case 2:
                jo0Var.c();
                break;
            default:
                jo0Var.d();
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        int i = this.a;
        jo0 jo0Var = this.b;
        switch (i) {
            case 1:
                SnackbarContentLayout snackbarContentLayout = jo0Var.j;
                int i2 = jo0Var.c;
                int i3 = jo0Var.a;
                int i4 = i2 - i3;
                snackbarContentLayout.a.setAlpha(0.0f);
                long j = i3;
                ViewPropertyAnimator duration = snackbarContentLayout.a.animate().alpha(1.0f).setDuration(j);
                TimeInterpolator timeInterpolator = snackbarContentLayout.d;
                long j2 = i4;
                duration.setInterpolator(timeInterpolator).setStartDelay(j2).start();
                if (snackbarContentLayout.b.getVisibility() == 0) {
                    snackbarContentLayout.b.setAlpha(0.0f);
                    snackbarContentLayout.b.animate().alpha(1.0f).setDuration(j).setInterpolator(timeInterpolator).setStartDelay(j2).start();
                }
                break;
            case 2:
                SnackbarContentLayout snackbarContentLayout2 = jo0Var.j;
                int i5 = jo0Var.b;
                snackbarContentLayout2.a.setAlpha(1.0f);
                long j3 = i5;
                ViewPropertyAnimator duration2 = snackbarContentLayout2.a.animate().alpha(0.0f).setDuration(j3);
                TimeInterpolator timeInterpolator2 = snackbarContentLayout2.d;
                duration2.setInterpolator(timeInterpolator2).setStartDelay(0L).start();
                if (snackbarContentLayout2.b.getVisibility() == 0) {
                    snackbarContentLayout2.b.setAlpha(1.0f);
                    snackbarContentLayout2.b.animate().alpha(0.0f).setDuration(j3).setInterpolator(timeInterpolator2).setStartDelay(0L).start();
                }
                break;
            default:
                super.onAnimationStart(animator);
                break;
        }
    }

    public /* synthetic */ bo0(jo0 jo0Var, int i, int i2) {
        this.a = i2;
        this.b = jo0Var;
    }
}
