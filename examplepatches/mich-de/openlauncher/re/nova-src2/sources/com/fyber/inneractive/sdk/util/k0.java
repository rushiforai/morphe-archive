package com.fyber.inneractive.sdk.util;

import android.content.Context;
import android.view.ViewTreeObserver;

/* loaded from: classes3.dex */
public final class k0 implements ViewTreeObserver.OnPreDrawListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f31198a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ n0 f31199b;

    public k0(n0 n0Var, Context context) {
        this.f31199b = n0Var;
        this.f31198a = context;
    }

    @Override // android.view.ViewTreeObserver.OnPreDrawListener
    public final boolean onPreDraw() {
        this.f31199b.b(this.f31198a);
        return true;
    }
}
