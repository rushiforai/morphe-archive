package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class S2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ long f20383a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public S2(long j11) {
        super(0);
        this.f20383a = j11;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return h6.c1.o(this.f20383a, "snapshot complete (", " ms)");
    }
}
