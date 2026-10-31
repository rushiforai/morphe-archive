package com.fyber.inneractive.sdk.renderers;

import android.view.View;

/* loaded from: classes3.dex */
public final class k implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n f30993a;

    public k(n nVar) {
        this.f30993a = nVar;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        view.removeOnAttachStateChangeListener(this);
        view.removeOnLayoutChangeListener(this.f30993a.f31008z);
    }
}
