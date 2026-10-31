package com.amplitude;

import android.view.View;

/* loaded from: classes2.dex */
public final class E0 implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20217a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ B0 f20218b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ G0 f20219c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f20220d;

    public E0(View view, B0 b02, G0 g02, int i5) {
        this.f20217a = view;
        this.f20218b = b02;
        this.f20219c = g02;
        this.f20220d = i5;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.f20217a.removeOnAttachStateChangeListener(this);
        B0 b02 = this.f20218b;
        b02.a();
        b02.f20697a = null;
        b02.f20698b = null;
        this.f20219c.f20790d.remove(Integer.valueOf(this.f20220d));
    }
}
