package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: g, reason: collision with root package name */
    public static final int f40992g = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final y f40993a;

    /* renamed from: b, reason: collision with root package name */
    public final int f40994b;

    /* renamed from: c, reason: collision with root package name */
    public final int f40995c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f40996d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final List<String> f40997e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final List<String> f40998f;

    public c(@NotNull y resource, int i5, int i11, @Nullable String str, @NotNull List<String> clickTracking, @NotNull List<String> creativeViewTracking) {
        Intrinsics.g(resource, "resource");
        Intrinsics.g(clickTracking, "clickTracking");
        Intrinsics.g(creativeViewTracking, "creativeViewTracking");
        this.f40993a = resource;
        this.f40994b = i5;
        this.f40995c = i11;
        this.f40996d = str;
        this.f40997e = clickTracking;
        this.f40998f = creativeViewTracking;
    }

    @Nullable
    public final String a() {
        return this.f40996d;
    }

    @NotNull
    public final List<String> b() {
        return this.f40997e;
    }

    @NotNull
    public final List<String> c() {
        return this.f40998f;
    }

    public final int d() {
        return this.f40995c;
    }

    @NotNull
    public final y e() {
        return this.f40993a;
    }

    public final int f() {
        return this.f40994b;
    }
}
