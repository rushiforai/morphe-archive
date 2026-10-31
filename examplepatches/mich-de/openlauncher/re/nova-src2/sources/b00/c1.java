package b00;

import android.animation.ValueAnimator;
import com.teslacoilsw.launcher.workspace.CrosshairsCellLayout;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final /* synthetic */ class c1 implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f16314a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f16315b;

    public /* synthetic */ c1(Object obj, int i5) {
        this.f16314a = i5;
        this.f16315b = obj;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        int i5 = this.f16314a;
        Object obj = this.f16315b;
        switch (i5) {
            case 0:
                Object animatedValue = valueAnimator.getAnimatedValue();
                Intrinsics.e(animatedValue, "null cannot be cast to non-null type kotlin.Float");
                ((d1) obj).onScrollChange(((Float) animatedValue).floatValue(), false);
                break;
            default:
                CrosshairsCellLayout crosshairsCellLayout = (CrosshairsCellLayout) obj;
                int i11 = CrosshairsCellLayout.C0;
                Object animatedValue2 = valueAnimator.getAnimatedValue();
                Intrinsics.e(animatedValue2, "null cannot be cast to non-null type kotlin.Float");
                crosshairsCellLayout.f46497m0 = ((Float) animatedValue2).floatValue();
                crosshairsCellLayout.invalidate();
                break;
        }
    }
}
