package za;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes2.dex */
public final class a extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f98406a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c f98407b;

    public /* synthetic */ a(c cVar, int i5) {
        this.f98406a = i5;
        this.f98407b = cVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f98406a) {
            case 0:
                c cVar = this.f98407b;
                cVar.f98410d.h(1);
                cVar.I();
                break;
            default:
                this.f98407b.X();
                break;
        }
    }
}
