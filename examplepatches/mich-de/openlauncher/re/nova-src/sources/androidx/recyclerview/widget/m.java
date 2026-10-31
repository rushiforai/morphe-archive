package androidx.recyclerview.widget;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewPropertyAnimator;

/* loaded from: classes2.dex */
public final class m extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f15050a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n f15051b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ViewPropertyAnimator f15052c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ View f15053d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ p f15054e;

    public /* synthetic */ m(p pVar, n nVar, ViewPropertyAnimator viewPropertyAnimator, View view, int i5) {
        this.f15050a = i5;
        this.f15054e = pVar;
        this.f15051b = nVar;
        this.f15052c = viewPropertyAnimator;
        this.f15053d = view;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f15050a) {
            case 0:
                this.f15052c.setListener(null);
                View view = this.f15053d;
                view.setAlpha(1.0f);
                view.setTranslationX(0.0f);
                view.setTranslationY(0.0f);
                n nVar = this.f15051b;
                s2 s2Var = nVar.f15056a;
                p pVar = this.f15054e;
                pVar.dispatchChangeFinished(s2Var, true);
                pVar.mChangeAnimations.remove(nVar.f15056a);
                pVar.dispatchFinishedWhenDone();
                break;
            default:
                this.f15052c.setListener(null);
                View view2 = this.f15053d;
                view2.setAlpha(1.0f);
                view2.setTranslationX(0.0f);
                view2.setTranslationY(0.0f);
                n nVar2 = this.f15051b;
                s2 s2Var2 = nVar2.f15057b;
                p pVar2 = this.f15054e;
                pVar2.dispatchChangeFinished(s2Var2, false);
                pVar2.mChangeAnimations.remove(nVar2.f15057b);
                pVar2.dispatchFinishedWhenDone();
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        switch (this.f15050a) {
            case 0:
                this.f15054e.dispatchChangeStarting(this.f15051b.f15056a, true);
                break;
            default:
                this.f15054e.dispatchChangeStarting(this.f15051b.f15057b, false);
                break;
        }
    }
}
