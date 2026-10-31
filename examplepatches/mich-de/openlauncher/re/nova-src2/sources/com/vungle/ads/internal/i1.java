package com.vungle.ads.internal;

import android.content.Context;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class i1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f46856a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public i1(Context context) {
        super(0);
        this.f46856a = context;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return new c1(this.f46856a);
    }
}
