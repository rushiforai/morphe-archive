package h7;

import android.animation.ValueAnimator;

/* loaded from: classes2.dex */
public final class b implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f59497a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f59498b;

    public b(e eVar, d dVar) {
        this.f59498b = eVar;
        this.f59497a = dVar;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        d dVar = this.f59497a;
        e.b(fFloatValue, dVar);
        e eVar = this.f59498b;
        eVar.a(fFloatValue, dVar, false);
        eVar.invalidateSelf();
    }
}
