package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal;

import b.u4;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.p, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C2989p {

    /* renamed from: f, reason: collision with root package name */
    public static final int f39264f = 0;

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final Float f39265a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f39266b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f39267c;

    /* renamed from: d, reason: collision with root package name */
    public final int f39268d;

    /* renamed from: e, reason: collision with root package name */
    public final int f39269e;

    public C2989p(@Nullable Float f11, @NotNull String foregroundColor, @NotNull String backgroundColor, int i5, int i11) {
        Intrinsics.g(foregroundColor, "foregroundColor");
        Intrinsics.g(backgroundColor, "backgroundColor");
        this.f39265a = f11;
        this.f39266b = foregroundColor;
        this.f39267c = backgroundColor;
        this.f39268d = i5;
        this.f39269e = i11;
    }

    @Nullable
    public final Float a() {
        return this.f39265a;
    }

    @NotNull
    public final String b() {
        return this.f39266b;
    }

    @NotNull
    public final String c() {
        return this.f39267c;
    }

    public final int d() {
        return this.f39268d;
    }

    public final int e() {
        return this.f39269e;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C2989p)) {
            return false;
        }
        C2989p c2989p = (C2989p) obj;
        return Intrinsics.b(this.f39265a, c2989p.f39265a) && Intrinsics.b(this.f39266b, c2989p.f39266b) && Intrinsics.b(this.f39267c, c2989p.f39267c) && this.f39268d == c2989p.f39268d && this.f39269e == c2989p.f39269e;
    }

    @NotNull
    public final String f() {
        return this.f39267c;
    }

    public final int g() {
        return this.f39269e;
    }

    @NotNull
    public final String h() {
        return this.f39266b;
    }

    public int hashCode() {
        Float f11 = this.f39265a;
        return Integer.hashCode(this.f39269e) + u4.a(this.f39268d, b.c0.e(b.c0.e((f11 == null ? 0 : f11.hashCode()) * 31, 31, this.f39266b), 31, this.f39267c), 31);
    }

    public final int i() {
        return this.f39268d;
    }

    @Nullable
    public final Float j() {
        return this.f39265a;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("DECRating(value=");
        sb2.append(this.f39265a);
        sb2.append(", foregroundColor=");
        sb2.append(this.f39266b);
        sb2.append(", backgroundColor=");
        sb2.append(this.f39267c);
        sb2.append(", size=");
        sb2.append(this.f39268d);
        sb2.append(", fontSize=");
        return a2.c.m(sb2, this.f39269e, ')');
    }

    @NotNull
    public final C2989p a(@Nullable Float f11, @NotNull String foregroundColor, @NotNull String backgroundColor, int i5, int i11) {
        Intrinsics.g(foregroundColor, "foregroundColor");
        Intrinsics.g(backgroundColor, "backgroundColor");
        return new C2989p(f11, foregroundColor, backgroundColor, i5, i11);
    }

    public static /* synthetic */ C2989p a(C2989p c2989p, Float f11, String str, String str2, int i5, int i11, int i12, Object obj) {
        if ((i12 & 1) != 0) {
            f11 = c2989p.f39265a;
        }
        if ((i12 & 2) != 0) {
            str = c2989p.f39266b;
        }
        if ((i12 & 4) != 0) {
            str2 = c2989p.f39267c;
        }
        if ((i12 & 8) != 0) {
            i5 = c2989p.f39268d;
        }
        if ((i12 & 16) != 0) {
            i11 = c2989p.f39269e;
        }
        int i13 = i11;
        String str3 = str2;
        return c2989p.a(f11, str, str3, i5, i13);
    }
}
