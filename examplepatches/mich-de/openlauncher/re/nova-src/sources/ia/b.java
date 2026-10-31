package ia;

import android.animation.ValueAnimator;
import com.android.launcher3.pageindicators.PageIndicatorDots;

/* loaded from: classes2.dex */
public final class b implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61461a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ PageIndicatorDots f61462b;

    public b(PageIndicatorDots pageIndicatorDots, int i5) {
        this.f61462b = pageIndicatorDots;
        this.f61461a = i5;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        PageIndicatorDots pageIndicatorDots = this.f61462b;
        pageIndicatorDots.f21209i[this.f61461a] = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        pageIndicatorDots.invalidate();
    }
}
