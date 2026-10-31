package wj;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes3.dex */
public final class f extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94425a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ g f94426b;

    public /* synthetic */ f(g gVar, int i5) {
        this.f94425a = i5;
        this.f94426b = gVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        switch (this.f94425a) {
            case 1:
                super.onAnimationEnd(animator);
                g gVar = this.f94426b;
                gVar.g();
                b bVar = gVar.n;
                if (bVar != null) {
                    bVar.a((n) gVar.f19222a);
                    break;
                }
                break;
            default:
                super.onAnimationEnd(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationRepeat(Animator animator) {
        switch (this.f94425a) {
            case 0:
                super.onAnimationRepeat(animator);
                g gVar = this.f94426b;
                gVar.f94435k = (gVar.f94435k + 4) % gVar.f94434j.f94415c.length;
                break;
            default:
                super.onAnimationRepeat(animator);
                break;
        }
    }
}
