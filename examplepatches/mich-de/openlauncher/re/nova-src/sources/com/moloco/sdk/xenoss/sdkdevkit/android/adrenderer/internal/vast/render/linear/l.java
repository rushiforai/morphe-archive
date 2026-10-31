package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.linear;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f41853a;

    /* renamed from: b, reason: collision with root package name */
    public final int f41854b;

    public l(@NotNull String url, int i5) {
        Intrinsics.g(url, "url");
        this.f41853a = url;
        this.f41854b = i5;
    }

    public final int a() {
        return this.f41854b;
    }

    @NotNull
    public final String b() {
        return this.f41853a;
    }
}
