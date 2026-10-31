package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class z {

    /* renamed from: c, reason: collision with root package name */
    public static final int f40862c = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f40863a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f40864b;

    public z(@Nullable String str, @NotNull String url) {
        Intrinsics.g(url, "url");
        this.f40863a = str;
        this.f40864b = url;
    }

    @Nullable
    public final String a() {
        return this.f40863a;
    }

    @NotNull
    public final String b() {
        return this.f40864b;
    }
}
