package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: c, reason: collision with root package name */
    public static final int f41659c = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f41660a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r f41661b;

    public g(@NotNull String url, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r offset) {
        Intrinsics.g(url, "url");
        Intrinsics.g(offset, "offset");
        this.f41660a = url;
        this.f41661b = offset;
    }

    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r a() {
        return this.f41661b;
    }

    @NotNull
    public final String b() {
        return this.f41660a;
    }
}
