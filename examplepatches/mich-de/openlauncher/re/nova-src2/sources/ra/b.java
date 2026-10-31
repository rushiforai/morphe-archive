package ra;

import android.animation.Animator;

/* loaded from: classes2.dex */
public final class b extends s9.b {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ a f85752b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ f f85753c;

    public b(f fVar, a aVar) {
        this.f85753c = fVar;
        this.f85752b = aVar;
    }

    @Override // s9.b
    public final void a() {
        this.f85753c.l(this.f85752b);
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        this.f85753c.m(this.f85752b);
    }
}
