package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: j, reason: collision with root package name */
    public static final int f40763j = 8;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f40764a;

    /* renamed from: b, reason: collision with root package name */
    @Nullable
    public final Integer f40765b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final Integer f40766c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f40767d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final r f40768e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final Long f40769f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final m f40770g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final List<String> f40771h;

    /* renamed from: i, reason: collision with root package name */
    @NotNull
    public final y f40772i;

    public l(@Nullable String str, @Nullable Integer num, @Nullable Integer num2, @Nullable String str2, @Nullable r rVar, @Nullable Long l9, @Nullable m mVar, @NotNull List<String> viewTrackingUrlList, @NotNull y resource) {
        Intrinsics.g(viewTrackingUrlList, "viewTrackingUrlList");
        Intrinsics.g(resource, "resource");
        this.f40764a = str;
        this.f40765b = num;
        this.f40766c = num2;
        this.f40767d = str2;
        this.f40768e = rVar;
        this.f40769f = l9;
        this.f40770g = mVar;
        this.f40771h = viewTrackingUrlList;
        this.f40772i = resource;
    }

    @Nullable
    public final String a() {
        return this.f40767d;
    }

    @Nullable
    public final m b() {
        return this.f40770g;
    }

    @Nullable
    public final Long c() {
        return this.f40769f;
    }

    @Nullable
    public final Integer d() {
        return this.f40766c;
    }

    @Nullable
    public final r e() {
        return this.f40768e;
    }

    @Nullable
    public final String f() {
        return this.f40764a;
    }

    @NotNull
    public final y g() {
        return this.f40772i;
    }

    @NotNull
    public final List<String> h() {
        return this.f40771h;
    }

    @Nullable
    public final Integer i() {
        return this.f40765b;
    }
}
