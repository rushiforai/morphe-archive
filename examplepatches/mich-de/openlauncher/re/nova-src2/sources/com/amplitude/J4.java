package com.amplitude;

import android.view.View;

/* loaded from: classes2.dex */
public final class J4 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20290a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ I4 f20291b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ M4 f20292c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f20293d;

    public J4(View view, I4 i42, M4 m42, int i5) {
        this.f20290a = view;
        this.f20291b = i42;
        this.f20292c = m42;
        this.f20293d = i5;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.f20290a.removeOnAttachStateChangeListener(this);
        I4 i42 = this.f20291b;
        i42.a();
        i42.f20697a = null;
        i42.f20698b = null;
        this.f20292c.f20790d.remove(Integer.valueOf(this.f20293d));
    }
}
