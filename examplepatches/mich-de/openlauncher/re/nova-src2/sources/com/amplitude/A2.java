package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class A2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ P3 f20181a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public A2(P3 p32) {
        super(0);
        this.f20181a = p32;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        P3 p32 = this.f20181a;
        return a80.m.f(p32.f20359a, "Error fetching remote config: ", " ", p32.f20360b);
    }
}
