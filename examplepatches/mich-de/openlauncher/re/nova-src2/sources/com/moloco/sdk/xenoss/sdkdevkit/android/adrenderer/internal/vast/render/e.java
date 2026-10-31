package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: i, reason: collision with root package name */
    public static final int f41642i = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final y f41643a;

    /* renamed from: b, reason: collision with root package name */
    public final int f41644b;

    /* renamed from: c, reason: collision with root package name */
    public final int f41645c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f41646d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final List<String> f41647e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final List<String> f41648f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final Long f41649g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r f41650h;

    public e(@NotNull y resource, int i5, int i11, @Nullable String str, @NotNull List<String> clickTracking, @NotNull List<String> viewTracking, @Nullable Long l9, @Nullable com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r rVar) {
        Intrinsics.g(resource, "resource");
        Intrinsics.g(clickTracking, "clickTracking");
        Intrinsics.g(viewTracking, "viewTracking");
        this.f41643a = resource;
        this.f41644b = i5;
        this.f41645c = i11;
        this.f41646d = str;
        this.f41647e = clickTracking;
        this.f41648f = viewTracking;
        this.f41649g = l9;
        this.f41650h = rVar;
    }

    @Nullable
    public final String a() {
        return this.f41646d;
    }

    @NotNull
    public final List<String> b() {
        return this.f41647e;
    }

    @Nullable
    public final Long c() {
        return this.f41649g;
    }

    public final int d() {
        return this.f41645c;
    }

    @Nullable
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.r e() {
        return this.f41650h;
    }

    @NotNull
    public final y f() {
        return this.f41643a;
    }

    @NotNull
    public final List<String> g() {
        return this.f41648f;
    }

    public final int h() {
        return this.f41644b;
    }
}
