package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: m, reason: collision with root package name */
    public static final int f40796m = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f40797a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final String f40798b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f40799c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f40800d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final Integer f40801e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Integer f40802f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final String f40803g;

    /* renamed from: h, reason: collision with root package name */
    @Nullable
    public final Integer f40804h;

    /* renamed from: i, reason: collision with root package name */
    @Nullable
    public final Integer f40805i;

    /* renamed from: j, reason: collision with root package name */
    @Nullable
    public final Integer f40806j;

    /* renamed from: k, reason: collision with root package name */
    @Nullable
    public final Boolean f40807k;

    /* renamed from: l, reason: collision with root package name */
    @Nullable
    public final String f40808l;

    public q(@NotNull String mediaFileUrl, @Nullable String str, boolean z11, @NotNull String type, @Nullable Integer num, @Nullable Integer num2, @Nullable String str2, @Nullable Integer num3, @Nullable Integer num4, @Nullable Integer num5, @Nullable Boolean bool, @Nullable String str3) {
        Intrinsics.g(mediaFileUrl, "mediaFileUrl");
        Intrinsics.g(type, "type");
        this.f40797a = mediaFileUrl;
        this.f40798b = str;
        this.f40799c = z11;
        this.f40800d = type;
        this.f40801e = num;
        this.f40802f = num2;
        this.f40803g = str2;
        this.f40804h = num3;
        this.f40805i = num4;
        this.f40806j = num5;
        this.f40807k = bool;
        this.f40808l = str3;
    }

    @Nullable
    public final String a() {
        return this.f40808l;
    }

    @Nullable
    public final Integer b() {
        return this.f40804h;
    }

    @Nullable
    public final String c() {
        return this.f40803g;
    }

    @Nullable
    public final Integer d() {
        return this.f40802f;
    }

    @Nullable
    public final String e() {
        return this.f40798b;
    }

    @Nullable
    public final Integer f() {
        return this.f40806j;
    }

    @NotNull
    public final String g() {
        return this.f40797a;
    }

    @Nullable
    public final Integer h() {
        return this.f40805i;
    }

    @NotNull
    public final String i() {
        return this.f40800d;
    }

    @Nullable
    public final Integer j() {
        return this.f40801e;
    }

    public final boolean k() {
        return this.f40799c;
    }

    @Nullable
    public final Boolean l() {
        return this.f40807k;
    }
}
