package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class L2 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Throwable f20317a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public L2(Throwable th2) {
        super(0);
        this.f20317a = th2;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return "Error registering activity lifecycle callbacks: " + this.f20317a;
    }
}
