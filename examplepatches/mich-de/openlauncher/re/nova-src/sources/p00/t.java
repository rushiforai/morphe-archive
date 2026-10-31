package p00;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes4.dex */
public final class t extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f81377a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ v9.o f81378b;

    public /* synthetic */ t(v9.o oVar, int i5) {
        this.f81377a = i5;
        this.f81378b = oVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f81377a) {
            case 0:
                v9.o oVar = this.f81378b;
                oVar.f92500c.setScaleX(1.0f);
                oVar.f92500c.setScaleY(1.0f);
                break;
            default:
                this.f81378b.f92500c.setTranslationY(0.0f);
                break;
        }
    }
}
