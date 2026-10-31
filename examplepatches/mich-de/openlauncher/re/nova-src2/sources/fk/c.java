package fk;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes3.dex */
public final class c extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55169a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ d f55170b;

    public /* synthetic */ c(d dVar, int i5) {
        this.f55169a = i5;
        this.f55170b = dVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        switch (this.f55169a) {
            case 1:
                this.f55170b.f55221b.h(false);
                break;
            default:
                super.onAnimationEnd(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationStart(Animator animator) {
        switch (this.f55169a) {
            case 0:
                this.f55170b.f55221b.h(true);
                break;
            default:
                super.onAnimationStart(animator);
                break;
        }
    }
}
