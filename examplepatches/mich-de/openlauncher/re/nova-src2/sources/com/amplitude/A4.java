package com.amplitude;

import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class A4 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ I4 f20183a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public A4(I4 i42) {
        super(0);
        this.f20183a = i42;
    }

    @Override // kotlin.jvm.functions.Function0
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final String invoke() {
        return b.c0.k("[Webview] Clearing WebViewData for URL: ", this.f20183a.f20279k);
    }
}
