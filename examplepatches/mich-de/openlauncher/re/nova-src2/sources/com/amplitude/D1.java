package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class D1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f20206a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public D1(long j11) {
        super(0);
        this.f20206a = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.u4.g(this.f20206a, "Adding event: size=");
    }
}
