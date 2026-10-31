package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model;

import b.c0;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: d, reason: collision with root package name */
    public static final int f40820d = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final v f40821a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f40822b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final r f40823c;

    public u(@NotNull v event, @NotNull String url, @Nullable r rVar) {
        Intrinsics.g(event, "event");
        Intrinsics.g(url, "url");
        this.f40821a = event;
        this.f40822b = url;
        this.f40823c = rVar;
    }

    @NotNull
    public final v a() {
        return this.f40821a;
    }

    @NotNull
    public final String b() {
        return this.f40822b;
    }

    @Nullable
    public final r c() {
        return this.f40823c;
    }

    @NotNull
    public final v d() {
        return this.f40821a;
    }

    @Nullable
    public final r e() {
        return this.f40823c;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return this.f40821a == uVar.f40821a && Intrinsics.b(this.f40822b, uVar.f40822b) && Intrinsics.b(this.f40823c, uVar.f40823c);
    }

    @NotNull
    public final String f() {
        return this.f40822b;
    }

    public int hashCode() {
        int iE = c0.e(this.f40821a.hashCode() * 31, 31, this.f40822b);
        r rVar = this.f40823c;
        return iE + (rVar == null ? 0 : rVar.hashCode());
    }

    @NotNull
    public String toString() {
        return "Tracking(event=" + this.f40821a + ", url=" + this.f40822b + ", offset=" + this.f40823c + ')';
    }

    public /* synthetic */ u(v vVar, String str, r rVar, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(vVar, str, (i5 & 4) != 0 ? null : rVar);
    }

    @NotNull
    public final u a(@NotNull v event, @NotNull String url, @Nullable r rVar) {
        Intrinsics.g(event, "event");
        Intrinsics.g(url, "url");
        return new u(event, url, rVar);
    }

    public static /* synthetic */ u a(u uVar, v vVar, String str, r rVar, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            vVar = uVar.f40821a;
        }
        if ((i5 & 2) != 0) {
            str = uVar.f40822b;
        }
        if ((i5 & 4) != 0) {
            rVar = uVar.f40823c;
        }
        return uVar.a(vVar, str, rVar);
    }
}
