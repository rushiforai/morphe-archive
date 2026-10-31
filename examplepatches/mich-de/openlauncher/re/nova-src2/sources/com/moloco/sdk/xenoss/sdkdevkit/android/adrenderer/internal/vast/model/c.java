package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: c, reason: collision with root package name */
    public static final int f40725c = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f40726a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Boolean f40727b;

    public c(@NotNull String value, @Nullable Boolean bool) {
        Intrinsics.g(value, "value");
        this.f40726a = value;
        this.f40727b = bool;
    }

    @NotNull
    public final String a() {
        return this.f40726a;
    }

    @Nullable
    public final Boolean b() {
        return this.f40727b;
    }
}
