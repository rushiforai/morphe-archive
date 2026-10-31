package o9;

import android.animation.ValueAnimator;
import com.android.launcher3.CellLayout;

/* loaded from: classes.dex */
public final class q implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80072a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ CellLayout f80073b;

    public q(CellLayout cellLayout, int i5) {
        this.f80073b = cellLayout;
        this.f80072a = i5;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        CellLayout cellLayout = this.f80073b;
        cellLayout.f20917w[this.f80072a] = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        cellLayout.invalidate();
    }
}
