package com.moloco.sdk.acm;

import b.c0;
import b.c9;
import java.util.Map;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f36009a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public String f36010b;

    /* renamed from: c, reason: collision with root package name */
    public long f36011c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final Map<String, String> f36012d;

    public a(@NotNull String appId, @NotNull String postAnalyticsUrl, long j11, @NotNull Map<String, String> clientOptions) {
        Intrinsics.g(appId, "appId");
        Intrinsics.g(postAnalyticsUrl, "postAnalyticsUrl");
        Intrinsics.g(clientOptions, "clientOptions");
        this.f36009a = appId;
        this.f36010b = postAnalyticsUrl;
        this.f36011c = j11;
        this.f36012d = clientOptions;
    }

    @NotNull
    public final String a() {
        return this.f36009a;
    }

    @NotNull
    public final String b() {
        return this.f36010b;
    }

    public final long c() {
        return this.f36011c;
    }

    @NotNull
    public final Map<String, String> d() {
        return this.f36012d;
    }

    @NotNull
    public final String e() {
        return this.f36009a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f36009a, aVar.f36009a) && Intrinsics.b(this.f36010b, aVar.f36010b) && this.f36011c == aVar.f36011c && Intrinsics.b(this.f36012d, aVar.f36012d);
    }

    @NotNull
    public final Map<String, String> f() {
        return this.f36012d;
    }

    @NotNull
    public final String g() {
        return this.f36010b;
    }

    public final long h() {
        return this.f36011c;
    }

    public int hashCode() {
        return this.f36012d.hashCode() + c0.d(c0.e(this.f36009a.hashCode() * 31, 31, this.f36010b), 31, this.f36011c);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("ACMConfig(appId=");
        sb2.append(this.f36009a);
        sb2.append(", postAnalyticsUrl=");
        sb2.append(this.f36010b);
        sb2.append(", requestPeriodSeconds=");
        sb2.append(this.f36011c);
        sb2.append(", clientOptions=");
        return c9.l(sb2, this.f36012d, ')');
    }

    @NotNull
    public final a a(@NotNull String appId, @NotNull String postAnalyticsUrl, long j11, @NotNull Map<String, String> clientOptions) {
        Intrinsics.g(appId, "appId");
        Intrinsics.g(postAnalyticsUrl, "postAnalyticsUrl");
        Intrinsics.g(clientOptions, "clientOptions");
        return new a(appId, postAnalyticsUrl, j11, clientOptions);
    }

    public static /* synthetic */ a a(a aVar, String str, String str2, long j11, Map map, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            str = aVar.f36009a;
        }
        if ((i5 & 2) != 0) {
            str2 = aVar.f36010b;
        }
        if ((i5 & 4) != 0) {
            j11 = aVar.f36011c;
        }
        if ((i5 & 8) != 0) {
            map = aVar.f36012d;
        }
        Map map2 = map;
        return aVar.a(str, str2, j11, map2);
    }

    public final void a(@NotNull String str) {
        Intrinsics.g(str, "<set-?>");
        this.f36010b = str;
    }

    public final void a(long j11) {
        this.f36011c = j11;
    }

    public /* synthetic */ a(String str, String str2, long j11, Map map, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, str2, (i5 & 4) != 0 ? 600L : j11, map);
    }
}
