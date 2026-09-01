package defpackage;

import android.animation.ValueAnimator;
import com.google.android.material.bottomsheet.BottomSheetBehavior;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rv0 implements ValueAnimator.AnimatorUpdateListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ rv0(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        int i = this.a;
        Object obj = this.b;
        switch (i) {
            case 0:
                float fFloatValue = ((Float) valueAnimator.getAnimatedValue()).floatValue();
                dk7 dk7Var = ((BottomSheetBehavior) obj).j;
                if (dk7Var != null) {
                    bk7 bk7Var = dk7Var.b;
                    if (bk7Var.i != fFloatValue) {
                        bk7Var.i = fFloatValue;
                        dk7Var.f = true;
                        dk7Var.g = true;
                        dk7Var.invalidateSelf();
                    }
                }
                break;
            default:
                int iFloatValue = (int) (((Float) valueAnimator.getAnimatedValue()).floatValue() * 255.0f);
                y94 y94Var = (y94) obj;
                y94Var.c.setAlpha(iFloatValue);
                y94Var.d.setAlpha(iFloatValue);
                y94Var.s.invalidate();
                break;
        }
    }
}
