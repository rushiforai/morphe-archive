package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: h, reason: collision with root package name */
    public static final int f40788h = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final r f40789a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final c f40790b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Long f40791c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final List<q> f40792d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final List<u> f40793e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final A f40794f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final List<l> f40795g;

    public p(@Nullable r rVar, @Nullable c cVar, @Nullable Long l9, @NotNull List<q> mediaFiles, @NotNull List<u> trackingList, @Nullable A a11, @NotNull List<l> icons) {
        Intrinsics.g(mediaFiles, "mediaFiles");
        Intrinsics.g(trackingList, "trackingList");
        Intrinsics.g(icons, "icons");
        this.f40789a = rVar;
        this.f40790b = cVar;
        this.f40791c = l9;
        this.f40792d = mediaFiles;
        this.f40793e = trackingList;
        this.f40794f = a11;
        this.f40795g = icons;
    }

    @Nullable
    public final c a() {
        return this.f40790b;
    }

    @Nullable
    public final Long b() {
        return this.f40791c;
    }

    @NotNull
    public final List<l> c() {
        return this.f40795g;
    }

    @NotNull
    public final List<q> d() {
        return this.f40792d;
    }

    @Nullable
    public final r e() {
        return this.f40789a;
    }

    @NotNull
    public final List<u> f() {
        return this.f40793e;
    }

    @Nullable
    public final A g() {
        return this.f40794f;
    }
}
