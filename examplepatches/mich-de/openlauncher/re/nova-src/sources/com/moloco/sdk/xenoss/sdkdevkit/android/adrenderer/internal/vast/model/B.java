package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class B {

    /* renamed from: g, reason: collision with root package name */
    public static final int f40709g = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f40710a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Boolean f40711b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final d f40712c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final List<n> f40713d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final List<String> f40714e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final List<g> f40715f;

    public B(@NotNull String vastAdTagUrl, @Nullable Boolean bool, @Nullable d dVar, @NotNull List<n> impressions, @NotNull List<String> errorUrls, @NotNull List<g> creatives) {
        Intrinsics.g(vastAdTagUrl, "vastAdTagUrl");
        Intrinsics.g(impressions, "impressions");
        Intrinsics.g(errorUrls, "errorUrls");
        Intrinsics.g(creatives, "creatives");
        this.f40710a = vastAdTagUrl;
        this.f40711b = bool;
        this.f40712c = dVar;
        this.f40713d = impressions;
        this.f40714e = errorUrls;
        this.f40715f = creatives;
    }

    @Nullable
    public final d a() {
        return this.f40712c;
    }

    @NotNull
    public final List<g> b() {
        return this.f40715f;
    }

    @NotNull
    public final List<String> c() {
        return this.f40714e;
    }

    @Nullable
    public final Boolean d() {
        return this.f40711b;
    }

    @NotNull
    public final List<n> e() {
        return this.f40713d;
    }

    @NotNull
    public final String f() {
        return this.f40710a;
    }
}
