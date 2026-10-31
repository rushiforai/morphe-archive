package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: j, reason: collision with root package name */
    public static final int f40731j = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f40732a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Integer f40733b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Integer f40734c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f40735d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f40736e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final f f40737f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final c f40738g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final List<u> f40739h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final List<y> f40740i;

    /* JADX WARN: Multi-variable type inference failed */
    public e(@Nullable String str, @Nullable Integer num, @Nullable Integer num2, @Nullable String str2, @Nullable String str3, @Nullable f fVar, @Nullable c cVar, @NotNull List<u> creativeViewTrackingList, @NotNull List<? extends y> resources) {
        Intrinsics.g(creativeViewTrackingList, "creativeViewTrackingList");
        Intrinsics.g(resources, "resources");
        this.f40732a = str;
        this.f40733b = num;
        this.f40734c = num2;
        this.f40735d = str2;
        this.f40736e = str3;
        this.f40737f = fVar;
        this.f40738g = cVar;
        this.f40739h = creativeViewTrackingList;
        this.f40740i = resources;
    }

    @Nullable
    public final c a() {
        return this.f40738g;
    }

    @Nullable
    public final String b() {
        return this.f40735d;
    }

    @Nullable
    public final String c() {
        return this.f40736e;
    }

    @Nullable
    public final f d() {
        return this.f40737f;
    }

    @NotNull
    public final List<u> e() {
        return this.f40739h;
    }

    @Nullable
    public final Integer f() {
        return this.f40734c;
    }

    @Nullable
    public final String g() {
        return this.f40732a;
    }

    @NotNull
    public final List<y> h() {
        return this.f40740i;
    }

    @Nullable
    public final Integer i() {
        return this.f40733b;
    }
}
