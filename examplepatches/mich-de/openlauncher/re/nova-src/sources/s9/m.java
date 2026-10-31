package s9;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.graphics.drawable.ColorDrawable;
import android.util.FloatProperty;
import android.util.IntProperty;
import android.util.Property;
import android.view.View;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import o9.p1;

/* loaded from: classes.dex */
public final class m implements o {

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f86811b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public final AnimatorSet f86812c = new AnimatorSet();

    /* renamed from: d, reason: collision with root package name */
    public final long f86813d;

    public m(long j11) {
        this.f86813d = j11;
    }

    @Override // s9.o
    public final void a(Object obj, FloatProperty floatProperty, float f11, Interpolator interpolator) {
        if (((Float) floatProperty.get(obj)).floatValue() == f11) {
            return;
        }
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(obj, floatProperty, f11);
        objectAnimatorOfFloat.setDuration(this.f86813d).setInterpolator(interpolator);
        e(objectAnimatorOfFloat);
    }

    @Override // s9.o
    public final void b(Object obj, IntProperty intProperty, int i5, Interpolator interpolator) {
        if (((Integer) intProperty.get(obj)).intValue() == i5) {
            return;
        }
        ObjectAnimator objectAnimatorOfInt = ObjectAnimator.ofInt(obj, intProperty, i5);
        objectAnimatorOfInt.setInterpolator(interpolator);
        e(objectAnimatorOfInt);
    }

    @Override // s9.o
    public final void c(View view, float f11, Interpolator interpolator) {
        if (view == null || view.getAlpha() == f11) {
            return;
        }
        Animator animatorOfFloat = ObjectAnimator.ofFloat(view, (Property<View, Float>) View.ALPHA, f11);
        a aVar = new a();
        aVar.f86768a = view;
        animatorOfFloat.addListener(aVar);
        animatorOfFloat.setInterpolator(interpolator);
        e(animatorOfFloat);
    }

    @Override // s9.o
    public final void d(View view, int i5, Interpolator interpolator) {
        if (view != null) {
            if ((view.getBackground() instanceof ColorDrawable) && ((ColorDrawable) view.getBackground()).getColor() == i5) {
                return;
            }
            ObjectAnimator objectAnimatorOfArgb = ObjectAnimator.ofArgb(view, p1.f80068g, i5);
            objectAnimatorOfArgb.setInterpolator(interpolator);
            e(objectAnimatorOfArgb);
        }
    }

    public final void e(Animator animator) {
        long j11 = this.f86813d;
        this.f86812c.play(animator.setDuration(j11));
        i.a(animator, j11, this.f86811b);
    }

    public final AnimatorSet f() {
        if (this.f86811b.isEmpty()) {
            e(ValueAnimator.ofFloat(0.0f, 1.0f).setDuration(this.f86813d));
        }
        return this.f86812c;
    }
}
