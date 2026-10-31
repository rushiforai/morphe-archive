package y9;

import android.animation.ValueAnimator;

/* loaded from: classes2.dex */
public final class w implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ float f96970a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f96971b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ y f96972c;

    public w(y yVar, float f11, float f12) {
        this.f96972c = yVar;
        this.f96970a = f11;
        this.f96971b = f12;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float animatedFraction = valueAnimator.getAnimatedFraction();
        float f11 = ((1.0f - animatedFraction) * this.f96971b) + (this.f96970a * animatedFraction);
        y yVar = this.f96972c;
        yVar.f96978e = f11;
        yVar.i();
    }
}
