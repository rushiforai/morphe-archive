package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: c, reason: collision with root package name */
    public static final int f40817c = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f40818a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final i f40819b;

    public t(@NotNull String resource, @NotNull i creativeType) {
        Intrinsics.g(resource, "resource");
        Intrinsics.g(creativeType, "creativeType");
        this.f40818a = resource;
        this.f40819b = creativeType;
    }

    @NotNull
    public final i a() {
        return this.f40819b;
    }

    @NotNull
    public final String b() {
        return this.f40818a;
    }
}
