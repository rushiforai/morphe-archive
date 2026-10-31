package hv;

import android.animation.ObjectAnimator;
import android.view.View;
import android.view.animation.Animation;
import android.widget.ImageView;

/* loaded from: classes4.dex */
public final class u2 implements Animation.AnimationListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f60613a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ai.k0 f60614b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f60615c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ fr.b0 f60616d;

    public u2(ImageView imageView, ai.k0 k0Var, int i5, fr.b0 b0Var) {
        this.f60613a = imageView;
        this.f60614b = k0Var;
        this.f60615c = i5;
        this.f60616d = b0Var;
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationEnd(Animation animation) {
        View view = this.f60613a;
        view.setVisibility(0);
        ai.k0 k0Var = this.f60614b;
        k0Var.getClass();
        ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view, "translationX", 0.0f, -((((view.getRight() - view.getLeft()) / 2.0f) + view.getLeft()) - (this.f60615c / 2.0f)));
        objectAnimatorOfFloat.setDuration(k0Var.f13066b);
        objectAnimatorOfFloat.addListener(new v2(k0Var, view, this.f60616d));
        objectAnimatorOfFloat.start();
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationRepeat(Animation animation) {
    }

    @Override // android.view.animation.Animation.AnimationListener
    public final void onAnimationStart(Animation animation) {
        this.f60613a.setVisibility(0);
    }
}
