package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class D4 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Exception f20216a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public D4(Exception exc) {
        super(0);
        this.f20216a = exc;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("[Webview] Error performing checks: ", this.f20216a.getMessage());
    }
}
