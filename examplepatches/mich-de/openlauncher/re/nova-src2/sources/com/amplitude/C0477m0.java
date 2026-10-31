package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* renamed from: com.amplitude.m0, reason: case insensitive filesystem */
/* loaded from: classes2.dex */
public final class C0477m0 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AbstractC0489o0 f20664a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Throwable f20665b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public C0477m0(AbstractC0489o0 abstractC0489o0, Throwable th2) {
        super(0);
        this.f20664a = abstractC0489o0;
        this.f20665b = th2;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.m("[", this.f20664a.b(), "] Error processing event data: ", this.f20665b.getMessage());
    }
}
