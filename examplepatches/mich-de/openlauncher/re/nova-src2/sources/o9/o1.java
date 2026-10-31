package o9;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes.dex */
public final class o1 extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public boolean f80040a = false;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ra.g f80041b;

    public o1(ra.g gVar) {
        this.f80041b = gVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        if (this.f80040a) {
            return;
        }
        this.f80040a = true;
        this.f80041b.run();
    }
}
