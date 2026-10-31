package com.moloco.sdk.internal.services.events;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final class c implements com.moloco.sdk.xenoss.sdkdevkit.android.core.services.c {

    /* renamed from: b, reason: collision with root package name */
    public static final int f37983b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public e f37984a = d.f37985a;

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.core.services.c
    public void a(boolean z11, boolean z12, @NotNull String appForegroundUrl, @NotNull String appBackgroundUrl) {
        Intrinsics.g(appForegroundUrl, "appForegroundUrl");
        Intrinsics.g(appBackgroundUrl, "appBackgroundUrl");
        this.f37984a = new e(z11, z12, appForegroundUrl, appBackgroundUrl);
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.core.services.c
    public boolean b() {
        return this.f37984a.h();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.core.services.c
    public boolean c() {
        return this.f37984a.g();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.core.services.c
    @NotNull
    public String d() {
        return this.f37984a.f();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.core.services.c
    @NotNull
    public String a() {
        return this.f37984a.e();
    }
}
