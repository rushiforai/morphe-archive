package androidx.recyclerview.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewPropertyAnimator;

/* loaded from: classes2.dex */
public final class l extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ s2 f15031a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f15032b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ View f15033c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f15034d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ ViewPropertyAnimator f15035e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ p f15036f;

    public l(p pVar, s2 s2Var, int i5, View view, int i11, ViewPropertyAnimator viewPropertyAnimator) {
        this.f15036f = pVar;
        this.f15031a = s2Var;
        this.f15032b = i5;
        this.f15033c = view;
        this.f15034d = i11;
        this.f15035e = viewPropertyAnimator;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        int i5 = this.f15032b;
        View view = this.f15033c;
        if (i5 != 0) {
            view.setTranslationX(0.0f);
        }
        if (this.f15034d != 0) {
            view.setTranslationY(0.0f);
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.f15035e.setListener(null);
        p pVar = this.f15036f;
        s2 s2Var = this.f15031a;
        pVar.dispatchMoveFinished(s2Var);
        pVar.mMoveAnimations.remove(s2Var);
        pVar.dispatchFinishedWhenDone();
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        this.f15036f.dispatchMoveStarting(this.f15031a);
    }
}
