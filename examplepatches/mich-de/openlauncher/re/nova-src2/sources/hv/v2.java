package hv;

import android.animation.Animator;
import android.animation.ObjectAnimator;
import android.view.View;

/* loaded from: classes4.dex */
public final class v2 implements Animator.AnimatorListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ ai.k0 f60631a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f60632b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ fr.b0 f60633c;

    public v2(ai.k0 k0Var, View view, fr.b0 b0Var) {
        this.f60631a = k0Var;
        this.f60632b = view;
        this.f60633c = b0Var;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.f60631a.getClass();
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this.f60632b, "rotation", 0.0f, 0.0f);
        objectAnimatorOfFloat.setDuration(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a.f39430h);
        objectAnimatorOfFloat.addListener(new b00.g1(this.f60633c, 1));
        objectAnimatorOfFloat.start();
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
    }
}
