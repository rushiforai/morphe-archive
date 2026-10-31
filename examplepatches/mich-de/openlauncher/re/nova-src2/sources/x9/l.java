package x9;

import android.animation.ValueAnimator;

/* loaded from: classes2.dex */
public final class l implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f95661a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f95662b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ u f95663c;

    public l(u uVar, int i5, int i11) {
        this.f95663c = uVar;
        this.f95661a = i5;
        this.f95662b = i11;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float animatedFraction = 1.0f - valueAnimator.getAnimatedFraction();
        u uVar = this.f95663c;
        uVar.f95687u = (int) (this.f95661a * animatedFraction);
        uVar.f95688v = (int) (animatedFraction * this.f95662b);
        uVar.a();
    }
}
