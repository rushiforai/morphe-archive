package com.amplitude;

import android.view.View;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class C0 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public static final C0 f20194a = new C0();

    public C0() {
        super(1);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        View child = (View) obj;
        Intrinsics.g(child, "child");
        return Boolean.valueOf(!AbstractC0540y0.f20819b.contains(child.getClass().getName()));
    }
}
