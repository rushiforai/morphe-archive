package defpackage;

import android.animation.ValueAnimator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jy5 implements ValueAnimator.AnimatorUpdateListener {
    public float a = 0.0f;
    public float b = 0.0f;
    public final /* synthetic */ ValueAnimator c;
    public final /* synthetic */ ValueAnimator d;
    public final /* synthetic */ py5 e;

    public jy5(py5 py5Var, ValueAnimator valueAnimator, ValueAnimator valueAnimator2) {
        this.e = py5Var;
        this.c = valueAnimator;
        this.d = valueAnimator2;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) this.c.getAnimatedValue()).floatValue();
        float fFloatValue2 = ((Float) this.d.getAnimatedValue()).floatValue();
        double d = fFloatValue - this.a;
        double d2 = fFloatValue2 - this.b;
        py5 py5Var = this.e;
        py5Var.f(d, d2);
        this.a = fFloatValue;
        this.b = fFloatValue2;
        py5Var.postInvalidateOnAnimation();
    }
}
