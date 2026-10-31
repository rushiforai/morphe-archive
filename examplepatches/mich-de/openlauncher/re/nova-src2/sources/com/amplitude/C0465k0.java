package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.k0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0465k0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AbstractC0489o0 f20647a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Throwable f20648b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0465k0(AbstractC0489o0 abstractC0489o0, Throwable th2) {
        super(0);
        this.f20647a = abstractC0489o0;
        this.f20648b = th2;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.m("[", this.f20647a.b(), "] ", this.f20648b.getMessage());
    }
}
