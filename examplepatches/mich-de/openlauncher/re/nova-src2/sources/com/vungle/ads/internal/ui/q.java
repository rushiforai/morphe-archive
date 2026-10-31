package com.vungle.ads.internal.ui;

import kotlin.Unit;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class q extends Lambda implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ z f47585a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public q(z zVar) {
        super(2);
        this.f47585a = zVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        int iIntValue = ((Number) obj).intValue();
        String errorMessage = (String) obj2;
        Intrinsics.g(errorMessage, "errorMessage");
        this.f47585a.a(errorMessage, iIntValue);
        return Unit.f71706a;
    }
}
