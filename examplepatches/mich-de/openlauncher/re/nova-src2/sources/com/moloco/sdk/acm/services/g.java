package com.moloco.sdk.acm.services;

import android.content.Context;
import android.os.PowerManager;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class g implements f {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f36179a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Lazy f36180b;

    public g(@NotNull Context context) {
        Intrinsics.g(context, "context");
        this.f36179a = context;
        this.f36180b = LazyKt.a(new as.c(this, 13));
    }

    public static final PowerManager a(g gVar) {
        Object systemService = gVar.f36179a.getSystemService("power");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.os.PowerManager");
        return (PowerManager) systemService;
    }

    @Override // com.moloco.sdk.acm.services.f
    public boolean b() {
        return this.f36179a.getPackageManager().checkPermission("android.permission.USE_FULL_SCREEN_INTENT", this.f36179a.getPackageName()) == 0;
    }

    public final PowerManager c() {
        return (PowerManager) this.f36180b.getValue();
    }

    @Override // com.moloco.sdk.acm.services.f
    public boolean a() {
        return c().isInteractive();
    }
}
