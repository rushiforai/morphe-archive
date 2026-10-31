package h7;

import android.animation.Animator;

/* loaded from: classes2.dex */
public final class c implements Animator.AnimatorListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f59499a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ e f59500b;

    public c(e eVar, d dVar) {
        this.f59500b = eVar;
        this.f59499a = dVar;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
        e eVar = this.f59500b;
        d dVar = this.f59499a;
        eVar.a(1.0f, dVar, true);
        dVar.f59511k = dVar.f59505e;
        dVar.f59512l = dVar.f59506f;
        dVar.f59513m = dVar.f59507g;
        int i5 = dVar.f59510j + 1;
        int[] iArr = dVar.f59509i;
        int length = i5 % iArr.length;
        dVar.f59510j = length;
        dVar.f59519u = iArr[length];
        if (!eVar.f59528f) {
            eVar.f59527e += 1.0f;
            return;
        }
        eVar.f59528f = false;
        animator.cancel();
        animator.setDuration(1332L);
        animator.start();
        if (dVar.n) {
            dVar.n = false;
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        this.f59500b.f59527e = 0.0f;
    }
}
