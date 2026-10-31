package o9;

import android.animation.ValueAnimator;

/* loaded from: classes2.dex */
public final class r implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f80083a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f80084b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f80085c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f80086d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ v2 f80087e;

    public r(float f11, float f12, float f13, float f14, v2 v2Var) {
        this.f80083a = f11;
        this.f80084b = f12;
        this.f80085c = f13;
        this.f80086d = f14;
        this.f80087e = v2Var;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        float f11 = 1.0f - fFloatValue;
        this.f80087e.j((this.f80084b * fFloatValue) + (this.f80083a * f11), (fFloatValue * this.f80086d) + (f11 * this.f80085c));
    }
}
