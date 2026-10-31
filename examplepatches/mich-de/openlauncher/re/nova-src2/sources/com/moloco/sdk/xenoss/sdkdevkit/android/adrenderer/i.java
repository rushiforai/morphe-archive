package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class i implements InterfaceC2973c {

    /* renamed from: d, reason: collision with root package name */
    public static final int f38370d = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final y f38371a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final f f38372b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final f f38373c;

    public i(@NotNull y vastOptions, @NotNull f mraidOptions, @NotNull f staticOptions) {
        Intrinsics.g(vastOptions, "vastOptions");
        Intrinsics.g(mraidOptions, "mraidOptions");
        Intrinsics.g(staticOptions, "staticOptions");
        this.f38371a = vastOptions;
        this.f38372b = mraidOptions;
        this.f38373c = staticOptions;
    }

    @NotNull
    public final f a() {
        return this.f38372b;
    }

    @NotNull
    public final f b() {
        return this.f38373c;
    }

    @NotNull
    public final y c() {
        return this.f38371a;
    }
}
