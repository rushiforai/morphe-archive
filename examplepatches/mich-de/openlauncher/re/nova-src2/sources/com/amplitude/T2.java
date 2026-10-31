package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class T2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Throwable f20389a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public T2(Throwable th2) {
        super(0);
        this.f20389a = th2;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "Error processing snapshot: " + this.f20389a;
    }
}
