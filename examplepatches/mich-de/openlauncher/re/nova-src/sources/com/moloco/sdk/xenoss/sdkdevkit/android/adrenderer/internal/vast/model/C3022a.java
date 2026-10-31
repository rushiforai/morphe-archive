package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.a, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3022a {

    /* renamed from: d, reason: collision with root package name */
    public static final int f40716d = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f40717a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Integer f40718b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final AbstractC3023b f40719c;

    public C3022a(@Nullable String str, @Nullable Integer num, @NotNull AbstractC3023b child) {
        Intrinsics.g(child, "child");
        this.f40717a = str;
        this.f40718b = num;
        this.f40719c = child;
    }

    @NotNull
    public final AbstractC3023b a() {
        return this.f40719c;
    }

    @Nullable
    public final String b() {
        return this.f40717a;
    }

    @Nullable
    public final Integer c() {
        return this.f40718b;
    }
}
