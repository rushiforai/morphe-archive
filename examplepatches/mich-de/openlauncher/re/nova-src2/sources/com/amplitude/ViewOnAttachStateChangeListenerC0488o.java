package com.amplitude;

import android.view.View;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

/* renamed from: com.amplitude.o, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class ViewOnAttachStateChangeListenerC0488o implements View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ View f20694a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C0514t f20695b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f20696c;

    public ViewOnAttachStateChangeListenerC0488o(View view, C0514t c0514t, int i5) {
        this.f20694a = view;
        this.f20695b = c0514t;
        this.f20696c = i5;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.f20694a.removeOnAttachStateChangeListener(this);
        u4 u4Var = this.f20695b.f20751b;
        ((Map) u4Var.f20785g.getValue()).remove(Integer.valueOf(this.f20696c));
        if (((Map) u4Var.f20785g.getValue()).isEmpty()) {
            ((AtomicInteger) AbstractC0484n1.f20679a.getValue()).set(10);
        }
    }
}
