package vj;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes3.dex */
public final class g extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ boolean f92797a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f92798b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ h f92799c;

    public g(h hVar, boolean z11, int i5) {
        this.f92799c = hVar;
        this.f92797a = z11;
        this.f92798b = i5;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        h hVar = this.f92799c;
        hVar.f92787b.setTranslationX(0.0f);
        hVar.a(this.f92798b, 0.0f, this.f92797a);
    }
}
