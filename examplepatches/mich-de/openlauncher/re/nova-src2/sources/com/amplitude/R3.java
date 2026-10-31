package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class R3 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ T3 f20380a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public R3(T3 t32) {
        super(0);
        this.f20380a = t32;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        T3 t32 = this.f20380a;
        return new K(t32.f20390a, t32.f20391b, (M) t32.f20394e.getValue());
    }
}
