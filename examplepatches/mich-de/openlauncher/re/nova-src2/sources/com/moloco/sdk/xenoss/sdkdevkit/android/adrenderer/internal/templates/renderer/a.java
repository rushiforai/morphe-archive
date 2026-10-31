package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer;

import a80.m;
import b.c0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final C0224a f39427e = new C0224a(null);

    /* renamed from: f, reason: collision with root package name */
    public static final int f39428f = 0;

    /* renamed from: g, reason: collision with root package name */
    public static final float f39429g = 0.9f;

    /* renamed from: h, reason: collision with root package name */
    public static final long f39430h = 1500;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f39431a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f39432b;

    /* renamed from: c, reason: collision with root package name */
    public final float f39433c;

    /* renamed from: d, reason: collision with root package name */
    public final long f39434d;

    /* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.a$a, reason: collision with other inner class name */
    public static final class C0224a {
        public /* synthetic */ C0224a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public C0224a() {
        }
    }

    public a(@NotNull String eventUrl, @NotNull String creativeType, float f11, long j11) {
        Intrinsics.g(eventUrl, "eventUrl");
        Intrinsics.g(creativeType, "creativeType");
        this.f39431a = eventUrl;
        this.f39432b = creativeType;
        this.f39433c = f11;
        this.f39434d = j11;
    }

    @NotNull
    public final String a() {
        return this.f39431a;
    }

    @NotNull
    public final String b() {
        return this.f39432b;
    }

    public final float c() {
        return this.f39433c;
    }

    public final long d() {
        return this.f39434d;
    }

    public final long e() {
        return this.f39434d;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f39431a, aVar.f39431a) && Intrinsics.b(this.f39432b, aVar.f39432b) && Float.compare(this.f39433c, aVar.f39433c) == 0 && this.f39434d == aVar.f39434d;
    }

    @NotNull
    public final String f() {
        return this.f39432b;
    }

    @NotNull
    public final String g() {
        return this.f39431a;
    }

    public final float h() {
        return this.f39433c;
    }

    public int hashCode() {
        return Long.hashCode(this.f39434d) + m.d(this.f39433c, c0.e(this.f39431a.hashCode() * 31, 31, this.f39432b), 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("CreativeRenderingCheckParams(eventUrl=");
        sb2.append(this.f39431a);
        sb2.append(", creativeType=");
        sb2.append(this.f39432b);
        sb2.append(", opacityRate=");
        sb2.append(this.f39433c);
        sb2.append(", captureDelayMillis=");
        return a2.c.n(sb2, this.f39434d, ')');
    }

    @NotNull
    public final a a(@NotNull String eventUrl, @NotNull String creativeType, float f11, long j11) {
        Intrinsics.g(eventUrl, "eventUrl");
        Intrinsics.g(creativeType, "creativeType");
        return new a(eventUrl, creativeType, f11, j11);
    }

    public static /* synthetic */ a a(a aVar, String str, String str2, float f11, long j11, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = aVar.f39431a;
        }
        if ((i5 & 2) != 0) {
            str2 = aVar.f39432b;
        }
        if ((i5 & 4) != 0) {
            f11 = aVar.f39433c;
        }
        if ((i5 & 8) != 0) {
            j11 = aVar.f39434d;
        }
        float f12 = f11;
        return aVar.a(str, str2, f12, j11);
    }

    public /* synthetic */ a(String str, String str2, float f11, long j11, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? 0.9f : f11, (i5 & 8) != 0 ? f39430h : j11);
    }
}
