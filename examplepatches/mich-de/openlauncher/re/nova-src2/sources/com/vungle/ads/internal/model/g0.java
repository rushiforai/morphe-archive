package com.vungle.ads.internal.model;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;
import kotlin.text.MatchResult;

/* loaded from: classes4.dex */
public final class g0 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f47009a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g0(String str) {
        super(1);
        this.f47009a = str;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        MatchResult it = (MatchResult) obj;
        Intrinsics.g(it, "it");
        return this.f47009a;
    }
}
