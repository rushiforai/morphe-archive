package defpackage;

import android.animation.ValueAnimator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class co0 implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ jo0 b;

    public /* synthetic */ co0(jo0 jo0Var, int i) {
        this.a = i;
        this.b = jo0Var;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        int i = this.a;
        jo0 jo0Var = this.b;
        switch (i) {
            case 0:
                jo0Var.i.setAlpha(((Float) valueAnimator.getAnimatedValue()).floatValue());
                break;
            case 1:
                float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                io0 io0Var = jo0Var.i;
                io0Var.setScaleX(fFloatValue);
                io0Var.setScaleY(fFloatValue);
                break;
            case 2:
                jo0Var.i.setTranslationY(((Integer) valueAnimator.getAnimatedValue()).intValue());
                break;
            default:
                jo0Var.i.setTranslationY(((Integer) valueAnimator.getAnimatedValue()).intValue());
                break;
        }
    }
}
