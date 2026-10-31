package s9;

import aa.i0;
import aa.w;
import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.TimeInterpolator;
import android.animation.ValueAnimator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.function.BiConsumer;
import o9.g3;
import s90.s0;

/* loaded from: classes2.dex */
public final class i implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public final ValueAnimator f86779a;

    /* renamed from: b, reason: collision with root package name */
    public final AnimatorSet f86780b;

    /* renamed from: c, reason: collision with root package name */
    public final f[] f86781c;

    /* renamed from: d, reason: collision with root package name */
    public float f86782d;

    /* renamed from: e, reason: collision with root package name */
    public s0 f86783e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f86784f = false;

    public i(AnimatorSet animatorSet, ArrayList arrayList) {
        this.f86780b = animatorSet;
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        this.f86779a = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setInterpolator(k.f86788a);
        valueAnimatorOfFloat.addListener(new g(this));
        valueAnimatorOfFloat.addUpdateListener(this);
        animatorSet.addListener(new i0(this, 17));
        this.f86781c = (f[]) arrayList.toArray(new f[arrayList.size()]);
    }

    public static void a(Animator animator, long j11, ArrayList arrayList) {
        long duration = animator.getDuration();
        TimeInterpolator interpolator = animator.getInterpolator();
        if (animator instanceof ValueAnimator) {
            arrayList.add(new f(animator, j11));
            return;
        }
        if (!(animator instanceof AnimatorSet)) {
            throw new RuntimeException("Unknown animation type " + animator);
        }
        Iterator<Animator> it = ((AnimatorSet) animator).getChildAnimations().iterator();
        while (it.hasNext()) {
            Animator next = it.next();
            if (duration > 0) {
                next.setDuration(duration);
            }
            if (interpolator != null) {
                next.setInterpolator(interpolator);
            }
            a(next, j11, arrayList);
        }
    }

    public static void b(Animator animator, w wVar) {
        wVar.accept(animator);
        if (animator instanceof AnimatorSet) {
            List childAnimations = ((AnimatorSet) animator).getChildAnimations();
            if (childAnimations == null) {
                childAnimations = Collections.EMPTY_LIST;
            }
            Iterator it = childAnimations.iterator();
            while (it.hasNext()) {
                b((Animator) it.next(), wVar);
            }
        }
    }

    public static void c(Animator animator, BiConsumer biConsumer) {
        b(animator, new w(biConsumer, 7));
    }

    public final void d() {
        c(this.f86780b, new e(0));
    }

    public final void e() {
        c(this.f86780b, new e(1));
    }

    public final void f() {
        c(this.f86780b, new d());
    }

    public final ValueAnimator g() {
        return this.f86779a;
    }

    public final float h() {
        AnimatorSet animatorSet = this.f86780b;
        return (animatorSet.getInterpolator() != null ? animatorSet.getInterpolator() : k.f86788a).getInterpolation(this.f86782d);
    }

    public final float i() {
        return this.f86782d;
    }

    public final AnimatorSet j() {
        return this.f86780b;
    }

    public final void k() {
        for (f fVar : this.f86781c) {
            fVar.f86772a.setInterpolator(fVar.f86773b);
            fVar.f86775d = h.f86778a;
        }
        this.f86779a.cancel();
    }

    public final void l(s0 s0Var) {
        this.f86783e = s0Var;
    }

    public final void m(float f11) {
        this.f86782d = f11;
        if (this.f86784f) {
            return;
        }
        float fB = g3.b(f11, 0.0f, 1.0f);
        for (f fVar : this.f86781c) {
            ValueAnimator valueAnimator = fVar.f86772a;
            h hVar = fVar.f86775d;
            float f12 = fVar.f86774c;
            hVar.getClass();
            valueAnimator.setCurrentFraction(fB > f12 ? 1.0f : fB / f12);
        }
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        m(((Float) valueAnimator.getAnimatedValue()).floatValue());
    }
}
