package com.amplitude;

import android.view.View;

/* loaded from: classes2.dex */
public final class G1 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20244a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ F1 f20245b;

    public G1(View view, F1 f12) {
        this.f20244a = view;
        this.f20245b = f12;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
        this.f20244a.removeOnAttachStateChangeListener(this);
        view.getViewTreeObserver().addOnPreDrawListener(this.f20245b);
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
    }
}
