package s9;

import android.animation.Animator;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;

/* loaded from: classes2.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public final ValueAnimator f86772a;

    /* renamed from: b, reason: collision with root package name */
    public final TimeInterpolator f86773b;

    /* renamed from: c, reason: collision with root package name */
    public final float f86774c;

    /* renamed from: d, reason: collision with root package name */
    public h f86775d = h.f86778a;

    public f(Animator animator, float f11) {
        ValueAnimator valueAnimator = (ValueAnimator) animator;
        this.f86772a = valueAnimator;
        this.f86773b = valueAnimator.getInterpolator();
        this.f86774c = animator.getDuration() / f11;
    }
}
