package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ef, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3137ef {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64420a;

    /* renamed from: b, reason: collision with root package name */
    public final long f64421b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f64422c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f64423d;

    /* renamed from: e, reason: collision with root package name */
    @Nullable
    public final String f64424e;

    /* renamed from: f, reason: collision with root package name */
    @Nullable
    public final String f64425f;

    /* renamed from: g, reason: collision with root package name */
    @Nullable
    public final String f64426g;

    public C3137ef(@NotNull String requestId, long j11, @NotNull String requestType, @Nullable String str, @Nullable String str2, @Nullable String str3, @Nullable String str4) {
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(requestType, "requestType");
        this.f64420a = requestId;
        this.f64421b = j11;
        this.f64422c = requestType;
        this.f64423d = str;
        this.f64424e = str2;
        this.f64425f = str3;
        this.f64426g = str4;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3137ef)) {
            return false;
        }
        C3137ef c3137ef = (C3137ef) obj;
        return Intrinsics.b(this.f64420a, c3137ef.f64420a) && this.f64421b == c3137ef.f64421b && Intrinsics.b(this.f64422c, c3137ef.f64422c) && Intrinsics.b(this.f64423d, c3137ef.f64423d) && Intrinsics.b(this.f64424e, c3137ef.f64424e) && Intrinsics.b(this.f64425f, c3137ef.f64425f) && Intrinsics.b(this.f64426g, c3137ef.f64426g);
    }

    public final int hashCode() {
        int iA = C3248l8.a(this.f64422c, C3231k8.a(this.f64421b, this.f64420a.hashCode() * 31, 31), 31);
        String str = this.f64423d;
        int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f64424e;
        int iHashCode2 = (iHashCode + (str2 == null ? 0 : str2.hashCode())) * 31;
        String str3 = this.f64425f;
        int iHashCode3 = (iHashCode2 + (str3 == null ? 0 : str3.hashCode())) * 31;
        String str4 = this.f64426g;
        return iHashCode3 + (str4 != null ? str4.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("UnifiedVirtualRequest(requestId=");
        sb2.append(this.f64420a);
        sb2.append(", timestamp=");
        sb2.append(this.f64421b);
        sb2.append(", requestType=");
        sb2.append(this.f64422c);
        sb2.append(", query=");
        sb2.append(this.f64423d);
        sb2.append(", normalizedQuery=");
        sb2.append(this.f64424e);
        sb2.append(", analyticsWindowId=");
        sb2.append(this.f64425f);
        sb2.append(", callerId=");
        return Z.a(sb2, this.f64426g, ')');
    }
}
