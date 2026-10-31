package com.moloco.sdk.internal.configs;

import a2.c;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: c, reason: collision with root package name */
    public static final int f36329c = 0;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f36330a;

    /* renamed from: b, reason: collision with root package name */
    public final int f36331b;

    public a(@NotNull String reportingUrl, int i5) {
        Intrinsics.g(reportingUrl, "reportingUrl");
        this.f36330a = reportingUrl;
        this.f36331b = i5;
    }

    @NotNull
    public final String a() {
        return this.f36330a;
    }

    public final int b() {
        return this.f36331b;
    }

    public final int c() {
        return this.f36331b;
    }

    @NotNull
    public final String d() {
        return this.f36330a;
    }

    public boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f36330a, aVar.f36330a) && this.f36331b == aVar.f36331b;
    }

    public int hashCode() {
        return Integer.hashCode(this.f36331b) + (this.f36330a.hashCode() * 31);
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder("OperationalMetricsConfig(reportingUrl=");
        sb2.append(this.f36330a);
        sb2.append(", pollingIntervalSeconds=");
        return c.m(sb2, this.f36331b, ')');
    }

    @NotNull
    public final a a(@NotNull String reportingUrl, int i5) {
        Intrinsics.g(reportingUrl, "reportingUrl");
        return new a(reportingUrl, i5);
    }

    public static /* synthetic */ a a(a aVar, String str, int i5, int i11, Object obj) {
        if ((i11 & 1) != 0) {
            str = aVar.f36330a;
        }
        if ((i11 & 2) != 0) {
            i5 = aVar.f36331b;
        }
        return aVar.a(str, i5);
    }
}
