package uf;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes3.dex */
public final class q extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f91191a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ s f91192b;

    public /* synthetic */ q(s sVar, int i5) {
        this.f91191a = i5;
        this.f91192b = sVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        switch (this.f91191a) {
            case 0:
                s sVar = this.f91192b;
                View view = sVar.f91197b;
                if (view != null) {
                    view.setVisibility(4);
                }
                ViewGroup viewGroup = sVar.f91198c;
                if (viewGroup != null) {
                    viewGroup.setVisibility(4);
                }
                ViewGroup viewGroup2 = sVar.f91200e;
                if (viewGroup2 != null) {
                    viewGroup2.setVisibility(4);
                    break;
                }
                break;
            case 1:
            default:
                super.onAnimationEnd(animator);
                break;
            case 2:
                this.f91192b.h(0);
                break;
            case 3:
                this.f91192b.h(0);
                break;
            case 4:
                ViewGroup viewGroup3 = this.f91192b.f91201f;
                if (viewGroup3 != null) {
                    viewGroup3.setVisibility(4);
                    break;
                }
                break;
            case 5:
                ViewGroup viewGroup4 = this.f91192b.f91203h;
                if (viewGroup4 != null) {
                    viewGroup4.setVisibility(4);
                    break;
                }
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        int i5 = this.f91191a;
        s sVar = this.f91192b;
        switch (i5) {
            case 0:
                View view = sVar.f91205j;
                if ((view instanceof d) && !sVar.A) {
                    d dVar = (d) view;
                    ValueAnimator valueAnimator = dVar.E;
                    if (valueAnimator.isStarted()) {
                        valueAnimator.cancel();
                    }
                    valueAnimator.setFloatValues(dVar.F, 0.0f);
                    valueAnimator.setDuration(250L);
                    valueAnimator.start();
                    break;
                }
                break;
            case 1:
                View view2 = sVar.f91197b;
                if (view2 != null) {
                    view2.setVisibility(0);
                }
                ViewGroup viewGroup = sVar.f91198c;
                if (viewGroup != null) {
                    viewGroup.setVisibility(0);
                }
                ViewGroup viewGroup2 = sVar.f91200e;
                if (viewGroup2 != null) {
                    viewGroup2.setVisibility(sVar.A ? 0 : 4);
                }
                View view3 = sVar.f91205j;
                if ((view3 instanceof d) && !sVar.A) {
                    d dVar2 = (d) view3;
                    ValueAnimator valueAnimator2 = dVar2.E;
                    if (valueAnimator2.isStarted()) {
                        valueAnimator2.cancel();
                    }
                    dVar2.G = false;
                    valueAnimator2.setFloatValues(dVar2.F, 1.0f);
                    valueAnimator2.setDuration(250L);
                    valueAnimator2.start();
                    break;
                }
                break;
            case 2:
                sVar.h(4);
                break;
            case 3:
                sVar.h(4);
                break;
            case 4:
                ViewGroup viewGroup3 = sVar.f91203h;
                if (viewGroup3 != null) {
                    viewGroup3.setVisibility(0);
                    sVar.f91203h.setTranslationX(r9.getWidth());
                    ViewGroup viewGroup4 = sVar.f91203h;
                    viewGroup4.scrollTo(viewGroup4.getWidth(), 0);
                    break;
                }
                break;
            default:
                ViewGroup viewGroup5 = sVar.f91201f;
                if (viewGroup5 != null) {
                    viewGroup5.setVisibility(0);
                    break;
                }
                break;
        }
    }
}
