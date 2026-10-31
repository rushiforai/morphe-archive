package com.vungle.ads.internal;

import android.content.Context;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class m1 extends Lambda implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Context f46919a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public m1(Context context) {
        super(0);
        this.f46919a = context;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        return ServiceLocator.f46726d.a(this.f46919a).getService(com.vungle.ads.internal.executor.a.class);
    }
}
