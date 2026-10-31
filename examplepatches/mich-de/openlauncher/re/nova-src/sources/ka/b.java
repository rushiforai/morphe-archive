package ka;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes2.dex */
public final class b extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f71245a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c f71246b;

    public /* synthetic */ b(c cVar, int i5) {
        this.f71245a = i5;
        this.f71246b = cVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f71245a) {
            case 0:
                c cVar = this.f71246b;
                cVar.setAlpha(1.0f);
                cVar.I();
                cVar.f71268z = null;
                break;
            default:
                c cVar2 = this.f71246b;
                cVar2.f71268z = null;
                if (!cVar2.A) {
                    cVar2.X();
                    break;
                } else {
                    cVar2.setVisibility(4);
                    break;
                }
        }
    }
}
