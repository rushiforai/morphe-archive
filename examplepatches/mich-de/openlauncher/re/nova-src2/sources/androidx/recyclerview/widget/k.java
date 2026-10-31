package androidx.recyclerview.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewPropertyAnimator;

/* loaded from: classes2.dex */
public final class k extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15011a = 1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ s2 f15012b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ View f15013c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ ViewPropertyAnimator f15014d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ p f15015e;

    public k(p pVar, s2 s2Var, ViewPropertyAnimator viewPropertyAnimator, View view) {
        this.f15015e = pVar;
        this.f15012b = s2Var;
        this.f15014d = viewPropertyAnimator;
        this.f15013c = view;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animator) {
        switch (this.f15011a) {
            case 1:
                this.f15013c.setAlpha(1.0f);
                break;
            default:
                super.onAnimationCancel(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f15011a) {
            case 0:
                this.f15014d.setListener(null);
                this.f15013c.setAlpha(1.0f);
                p pVar = this.f15015e;
                s2 s2Var = this.f15012b;
                pVar.dispatchRemoveFinished(s2Var);
                pVar.mRemoveAnimations.remove(s2Var);
                pVar.dispatchFinishedWhenDone();
                break;
            default:
                this.f15014d.setListener(null);
                p pVar2 = this.f15015e;
                s2 s2Var2 = this.f15012b;
                pVar2.dispatchAddFinished(s2Var2);
                pVar2.mAddAnimations.remove(s2Var2);
                pVar2.dispatchFinishedWhenDone();
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        switch (this.f15011a) {
            case 0:
                this.f15015e.dispatchRemoveStarting(this.f15012b);
                break;
            default:
                this.f15015e.dispatchAddStarting(this.f15012b);
                break;
        }
    }

    public k(p pVar, s2 s2Var, View view, ViewPropertyAnimator viewPropertyAnimator) {
        this.f15015e = pVar;
        this.f15012b = s2Var;
        this.f15013c = view;
        this.f15014d = viewPropertyAnimator;
    }
}
