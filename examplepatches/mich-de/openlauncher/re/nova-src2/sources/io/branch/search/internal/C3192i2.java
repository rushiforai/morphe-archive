package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: io.branch.search.internal.i2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3192i2 extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ boolean f64720a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ C3327q2 f64721b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C3192i2(boolean z11, C3327q2 c3327q2) {
        super(0);
        this.f64720a = z11;
        this.f64721b = c3327q2;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return "interrupt highPri:" + this.f64720a + "  isRunning:" + this.f64721b.o.get();
    }
}
