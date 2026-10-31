package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: i, reason: collision with root package name */
    public static final int f40779i = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final d f40780a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f40781b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f40782c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f40783d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final s f40784e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final List<n> f40785f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final List<String> f40786g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final List<g> f40787h;

    public o(@Nullable d dVar, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable s sVar, @NotNull List<n> impressions, @NotNull List<String> errorUrls, @NotNull List<g> creatives) {
        Intrinsics.g(impressions, "impressions");
        Intrinsics.g(errorUrls, "errorUrls");
        Intrinsics.g(creatives, "creatives");
        this.f40780a = dVar;
        this.f40781b = str;
        this.f40782c = str2;
        this.f40783d = str3;
        this.f40784e = sVar;
        this.f40785f = impressions;
        this.f40786g = errorUrls;
        this.f40787h = creatives;
    }

    @Nullable
    public final d a() {
        return this.f40780a;
    }

    @Nullable
    public final String b() {
        return this.f40781b;
    }

    @Nullable
    public final String c() {
        return this.f40783d;
    }

    @NotNull
    public final List<g> d() {
        return this.f40787h;
    }

    @Nullable
    public final String e() {
        return this.f40782c;
    }

    @NotNull
    public final List<String> f() {
        return this.f40786g;
    }

    @NotNull
    public final List<n> g() {
        return this.f40785f;
    }

    @Nullable
    public final s h() {
        return this.f40784e;
    }
}
