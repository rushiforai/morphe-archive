package y9;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes2.dex */
public final class x extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Runnable f96973a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Runnable f96974b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ y f96975c;

    public x(y yVar, Runnable runnable, Runnable runnable2) {
        this.f96975c = yVar;
        this.f96973a = runnable;
        this.f96974b = runnable2;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        Runnable runnable = this.f96974b;
        if (runnable != null) {
            runnable.run();
        }
        this.f96975c.f96989r = null;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        Runnable runnable = this.f96973a;
        if (runnable != null) {
            runnable.run();
        }
    }
}
