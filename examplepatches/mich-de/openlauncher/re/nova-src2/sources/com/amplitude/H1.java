package com.amplitude;

import android.view.View;

/* loaded from: classes2.dex */
public final class H1 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20258a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ F1 f20259b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ I1 f20260c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f20261d;

    public H1(View view, F1 f12, I1 i1, int i5) {
        this.f20258a = view;
        this.f20259b = f12;
        this.f20260c = i1;
        this.f20261d = i5;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.f20258a.removeOnAttachStateChangeListener(this);
        view.getViewTreeObserver().removeOnPreDrawListener(this.f20259b);
        this.f20260c.f20271a.remove(Integer.valueOf(this.f20261d));
    }
}
