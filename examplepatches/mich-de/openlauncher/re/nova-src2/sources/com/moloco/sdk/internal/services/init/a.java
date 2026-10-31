package com.moloco.sdk.internal.services.init;

import b.c0;
import h6.c1;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final int f38005b = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f38006a;

    public a(@NotNull String appKey) {
        Intrinsics.g(appKey, "appKey");
        this.f38006a = appKey;
    }

    @NotNull
    public final String a() {
        return this.f38006a;
    }

    @NotNull
    public final String b() {
        return this.f38006a;
    }

    @NotNull
    public final String c() {
        return c0.q(new StringBuilder(), this.f38006a, "___v1");
    }

    @NotNull
    public final List<String> d() {
        return EmptyList.f71733a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && Intrinsics.b(this.f38006a, ((a) obj).f38006a);
    }

    public int hashCode() {
        return this.f38006a.hashCode();
    }

    @NotNull
    public String toString() {
        return c1.t(new StringBuilder("CacheKey(appKey="), this.f38006a, ')');
    }

    @NotNull
    public final a a(@NotNull String appKey) {
        Intrinsics.g(appKey, "appKey");
        return new a(appKey);
    }

    public static /* synthetic */ a a(a aVar, String str, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = aVar.f38006a;
        }
        return aVar.a(str);
    }
}
