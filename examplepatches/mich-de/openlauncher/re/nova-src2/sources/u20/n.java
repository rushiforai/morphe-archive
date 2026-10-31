package u20;

import android.animation.ValueAnimator;
import androidx.cardview.widget.CardView;

/* loaded from: classes4.dex */
public final class n implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f90486a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f90487b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ CardView f90488c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f90489d;

    public n(int i5, int i11, CardView cardView, float f11) {
        this.f90486a = i5;
        this.f90487b = i11;
        this.f90488c = cardView;
        this.f90489d = f11;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
        int iIntValue = ((Integer) c8.a.f19830a.evaluate(fFloatValue, Integer.valueOf(this.f90486a), Integer.valueOf(this.f90487b))).intValue();
        CardView cardView = this.f90488c;
        cardView.b(iIntValue);
        cardView.d((1.0f - fFloatValue) * this.f90489d);
    }
}
