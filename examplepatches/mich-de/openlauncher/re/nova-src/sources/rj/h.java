package rj;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;

/* loaded from: classes3.dex */
public abstract class h extends AnimatorListenerAdapter implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public boolean f85985a;

    /* renamed from: b, reason: collision with root package name */
    public float f85986b;

    /* renamed from: c, reason: collision with root package name */
    public float f85987c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ j f85988d;

    public h(j jVar) {
        this.f85988d = jVar;
    }

    public abstract float a();

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        float f11 = (int) this.f85987c;
        bk.g gVar = this.f85988d.f85993b;
        if (gVar != null) {
            gVar.k(f11);
        }
        this.f85985a = false;
    }

    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        boolean z11 = this.f85985a;
        j jVar = this.f85988d;
        if (!z11) {
            bk.g gVar = jVar.f85993b;
            this.f85986b = gVar == null ? 0.0f : gVar.f17980a.f17976m;
            this.f85987c = a();
            this.f85985a = true;
        }
        float f11 = this.f85986b;
        float animatedFraction = (int) ((valueAnimator.getAnimatedFraction() * (this.f85987c - f11)) + f11);
        bk.g gVar2 = jVar.f85993b;
        if (gVar2 != null) {
            gVar2.k(animatedFraction);
        }
    }
}
