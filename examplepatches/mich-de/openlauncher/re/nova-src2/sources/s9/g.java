package s9;

import android.animation.Animator;
import s90.s0;

/* loaded from: classes2.dex */
public final class g extends b {

    /* renamed from: b, reason: collision with root package name */
    public boolean f86776b = false;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ i f86777c;

    public g(i iVar) {
        this.f86777c = iVar;
    }

    @Override // s9.b
    public final void a() {
        if (this.f86776b) {
            return;
        }
        i iVar = this.f86777c;
        iVar.e();
        s0 s0Var = iVar.f86783e;
        if (s0Var != null) {
            s0Var.run();
        }
        this.f86776b = true;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        this.f86769a = false;
        this.f86776b = false;
    }
}
