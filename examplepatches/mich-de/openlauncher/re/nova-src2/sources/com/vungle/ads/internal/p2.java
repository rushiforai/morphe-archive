package com.vungle.ads.internal;

import android.content.Context;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes4.dex */
public final class p2 extends Lambda implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v2 f47334a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Context f47335b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public p2(v2 v2Var, Context context) {
        super(1);
        this.f47334a = v2Var;
        this.f47335b = context;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        boolean zBooleanValue = ((Boolean) obj).booleanValue();
        if (zBooleanValue) {
            ConfigManager.INSTANCE.getClass();
            ConfigManager.c();
        }
        boolean z11 = com.vungle.ads.internal.util.u.f47714a;
        com.vungle.ads.internal.util.t.a("VungleInitializer", "Config fetch result: " + zBooleanValue);
        if (zBooleanValue && this.f47334a.f47724a.get()) {
            v2 v2Var = this.f47334a;
            Context context = this.f47335b;
            v2Var.getClass();
            v2.a(context);
        }
        return Unit.f71706a;
    }
}
