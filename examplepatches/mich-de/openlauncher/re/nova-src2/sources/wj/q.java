package wj;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes3.dex */
public final class q extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f94477a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ r f94478b;

    public /* synthetic */ q(r rVar, int i5) {
        this.f94477a = i5;
        this.f94478b = rVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationEnd(Animator animator) {
        switch (this.f94477a) {
            case 1:
                super.onAnimationEnd(animator);
                r rVar = this.f94478b;
                rVar.g();
                b bVar = rVar.n;
                if (bVar != null) {
                    bVar.a((n) rVar.f19222a);
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
        switch (this.f94477a) {
            case 0:
                super.onAnimationRepeat(animator);
                r rVar = this.f94478b;
                rVar.f94485k = (rVar.f94485k + 1) % rVar.f94484j.f94415c.length;
                rVar.f94486l = true;
                break;
            default:
                super.onAnimationRepeat(animator);
                break;
        }
    }
}
