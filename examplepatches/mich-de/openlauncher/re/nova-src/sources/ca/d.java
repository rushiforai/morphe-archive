package ca;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;

/* loaded from: classes2.dex */
public final class d extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final Object f19905a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f19906b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f19907c = false;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ e f19908d;

    public d(e eVar, Object obj, boolean z11) {
        this.f19908d = eVar;
        this.f19905a = obj;
        this.f19906b = z11;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        if (this.f19906b) {
            return;
        }
        this.f19907c = true;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        if (this.f19907c) {
            return;
        }
        Object obj = this.f19905a;
        e eVar = this.f19908d;
        eVar.f19918g = obj;
        eVar.f19920i = 0.0f;
        eVar.f19919h = null;
        this.f19907c = true;
    }
}
