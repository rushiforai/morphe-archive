package com.amplitude;

import android.view.View;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.q, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0500q extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C0514t f20727a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C0436f2 f20728b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0500q(C0514t c0514t, C0436f2 c0436f2) {
        super(1);
        this.f20727a = c0514t;
        this.f20728b = c0436f2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        View view = (View) obj;
        Intrinsics.g(view, "view");
        return this.f20727a.a(view, this.f20728b);
    }
}
