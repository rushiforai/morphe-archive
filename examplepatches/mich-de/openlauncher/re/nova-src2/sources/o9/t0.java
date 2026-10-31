package o9;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes.dex */
public final class t0 extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f80129a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f80130b;

    public /* synthetic */ t0(Object obj, int i5) {
        this.f80129a = i5;
        this.f80130b = obj;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f80129a) {
            case 0:
                ((u0) this.f80130b).getClass();
                break;
            default:
                ((Runnable) this.f80130b).run();
                break;
        }
    }
}
