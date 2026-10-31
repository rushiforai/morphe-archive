package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.l0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0471l0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AbstractC0489o0 f20654a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Throwable f20655b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0471l0(AbstractC0489o0 abstractC0489o0, Throwable th2) {
        super(0);
        this.f20654a = abstractC0489o0;
        this.f20655b = th2;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.m("[", this.f20654a.b(), "] ", this.f20655b.getMessage());
    }
}
