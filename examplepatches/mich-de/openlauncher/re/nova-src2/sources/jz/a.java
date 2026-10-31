package jz;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes4.dex */
public final class a extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70506a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ c f70507b;

    public /* synthetic */ a(c cVar, int i5) {
        this.f70506a = i5;
        this.f70507b = cVar;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f70506a) {
            case 0:
                c cVar = this.f70507b;
                cVar.f70516i.h(1);
                cVar.I();
                break;
            case 1:
                this.f70507b.c0();
                break;
            default:
                c cVar2 = this.f70507b;
                cVar2.f70518k = true;
                cVar2.f70511d.removeListener(this);
                break;
        }
    }
}
