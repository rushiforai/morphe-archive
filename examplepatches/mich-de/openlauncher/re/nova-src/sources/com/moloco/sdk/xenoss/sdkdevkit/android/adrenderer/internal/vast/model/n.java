package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: c, reason: collision with root package name */
    public static final int f40776c = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f40777a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f40778b;

    public n(@Nullable String str, @NotNull String impressionUrl) {
        Intrinsics.g(impressionUrl, "impressionUrl");
        this.f40777a = str;
        this.f40778b = impressionUrl;
    }

    @Nullable
    public final String a() {
        return this.f40777a;
    }

    @NotNull
    public final String b() {
        return this.f40778b;
    }
}
