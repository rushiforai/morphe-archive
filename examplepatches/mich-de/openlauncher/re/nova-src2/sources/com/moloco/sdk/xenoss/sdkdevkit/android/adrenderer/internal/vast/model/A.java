package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class A {

    /* renamed from: d, reason: collision with root package name */
    public static final int f40705d = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final z f40706a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<z> f40707b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final List<z> f40708c;

    public A(@Nullable z zVar, @NotNull List<z> clickTrackingList, @NotNull List<z> customClickList) {
        Intrinsics.g(clickTrackingList, "clickTrackingList");
        Intrinsics.g(customClickList, "customClickList");
        this.f40706a = zVar;
        this.f40707b = clickTrackingList;
        this.f40708c = customClickList;
    }

    @Nullable
    public final z a() {
        return this.f40706a;
    }

    @NotNull
    public final List<z> b() {
        return this.f40707b;
    }

    @NotNull
    public final List<z> c() {
        return this.f40708c;
    }
}
