package s9;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes2.dex */
public abstract class b extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public boolean f86769a = false;

    public abstract void a();

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        this.f86769a = true;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        if (this.f86769a) {
            return;
        }
        a();
    }
}
