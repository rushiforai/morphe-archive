package androidx.recyclerview.widget;

import android.animation.ValueAnimator;
import android.view.ViewGroup;
import com.google.android.material.appbar.CollapsingToolbarLayout;
import com.google.android.material.bottomsheet.BottomSheetBehavior;
import com.google.android.material.textfield.TextInputLayout;
import java.util.WeakHashMap;

/* loaded from: classes2.dex */
public final class a0 implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f14877a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f14878b;

    public /* synthetic */ a0(Object obj, int i5) {
        this.f14877a = i5;
        this.f14878b = obj;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        ViewGroup viewGroup;
        int i5 = this.f14877a;
        Object obj = this.f14878b;
        switch (i5) {
            case 0:
                int iFloatValue = (int) (((Float) valueAnimator.getAnimatedValue()).floatValue() * 255.0f);
                b0 b0Var = (b0) obj;
                b0Var.f14892c.setAlpha(iFloatValue);
                b0Var.f14893d.setAlpha(iFloatValue);
                b0Var.f14906s.invalidate();
                break;
            case 1:
                ((k0) obj).f15028m = valueAnimator.getAnimatedFraction();
                break;
            case 2:
                ((com.facebook.shimmer.d) obj).invalidateSelf();
                break;
            case 3:
                CollapsingToolbarLayout collapsingToolbarLayout = (CollapsingToolbarLayout) obj;
                int iIntValue = ((Integer) valueAnimator.getAnimatedValue()).intValue();
                if (iIntValue != collapsingToolbarLayout.f34048p) {
                    if (collapsingToolbarLayout.n != null && (viewGroup = collapsingToolbarLayout.f34037c) != null) {
                        WeakHashMap weakHashMap = a5.a1.f250a;
                        viewGroup.postInvalidateOnAnimation();
                    }
                    collapsingToolbarLayout.f34048p = iIntValue;
                    WeakHashMap weakHashMap2 = a5.a1.f250a;
                    collapsingToolbarLayout.postInvalidateOnAnimation();
                    break;
                }
                break;
            case 4:
                ((TextInputLayout) obj).f34402u0.o(((Float) valueAnimator.getAnimatedValue()).floatValue());
                break;
            default:
                float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                bk.g gVar = ((BottomSheetBehavior) obj).f34095i;
                if (gVar != null) {
                    bk.f fVar = gVar.f17980a;
                    if (fVar.f17972i != fFloatValue) {
                        fVar.f17972i = fFloatValue;
                        gVar.f17984e = true;
                        gVar.invalidateSelf();
                        break;
                    }
                }
                break;
        }
    }
}
