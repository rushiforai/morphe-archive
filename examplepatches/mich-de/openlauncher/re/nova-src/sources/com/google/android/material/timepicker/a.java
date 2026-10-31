package com.google.android.material.timepicker;

import android.content.Context;
import android.view.View;

/* loaded from: classes3.dex */
public abstract class a extends a5.b {

    /* renamed from: d, reason: collision with root package name */
    public final b5.d f34484d;

    public a(Context context, int i5) {
        this.f34484d = new b5.d(16, context.getString(i5));
    }

    @Override // a5.b
    public void d(View view, b5.g gVar) {
        this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
        gVar.b(this.f34484d);
    }
}
