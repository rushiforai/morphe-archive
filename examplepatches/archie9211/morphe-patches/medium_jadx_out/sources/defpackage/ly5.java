package defpackage;

import android.animation.ValueAnimator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ly5 implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ float a;
    public final /* synthetic */ float b;
    public final /* synthetic */ py5 c;

    public ly5(py5 py5Var, float f, float f2) {
        this.c = py5Var;
        this.a = f;
        this.b = f2;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        float f = this.a;
        float f2 = this.b;
        py5 py5Var = this.c;
        py5Var.j(fFloatValue, f, f2);
        py5Var.postInvalidateOnAnimation();
    }
}
