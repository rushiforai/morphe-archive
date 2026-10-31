package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f41721a;

    /* renamed from: b, reason: collision with root package name */
    public final long f41722b;

    public a(@NotNull String url, long j11) {
        Intrinsics.g(url, "url");
        this.f41721a = url;
        this.f41722b = j11;
    }

    public final long a() {
        return this.f41722b;
    }

    @NotNull
    public final String b() {
        return this.f41721a;
    }
}
