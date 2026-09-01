package defpackage;

import android.animation.ValueAnimator;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class lc7 implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ int a = 1;
    public final /* synthetic */ Object b;

    public /* synthetic */ lc7(rc7 rc7Var) {
        this.b = rc7Var;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                rc7 rc7Var = (rc7) obj;
                t90 t90Var = rc7Var.I;
                if (t90Var == null) {
                    t90Var = xn6.a;
                }
                if (t90Var != t90.ENABLED) {
                    s22 s22Var = rc7Var.m;
                    if (s22Var != null) {
                        s22Var.n(rc7Var.b.d());
                    }
                } else {
                    rc7Var.invalidateSelf();
                }
                break;
            default:
                ((View) ((v3f) ((eoc) obj).a).d.getParent()).invalidate();
                break;
        }
    }

    public /* synthetic */ lc7(eoc eocVar, View view) {
        this.b = eocVar;
    }
}
