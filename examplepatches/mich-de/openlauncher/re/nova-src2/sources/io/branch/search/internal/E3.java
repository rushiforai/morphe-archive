package io.branch.search.internal;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class E3 extends Lambda implements Function0<String> {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ C3 f62392a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f62393b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public E3(C3 c32, long j11) {
        super(0);
        this.f62392a = c32;
        this.f62393b = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        StringBuilder sb2 = new StringBuilder("Memory released : ");
        C3 c32 = this.f62392a;
        long j11 = this.f62393b;
        c32.getClass();
        sb2.append(C3.a(j11));
        return sb2.toString();
    }
}
