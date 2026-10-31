package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Fe {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f62476a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f62477b;

    /* renamed from: c, reason: collision with root package name */
    public final int f62478c;

    /* renamed from: d, reason: collision with root package name */
    public final long f62479d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final String f62480e;

    public Fe(@NotNull String requestId, int i5, long j11, @NotNull String sessionId) {
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(sessionId, "sessionId");
        this.f62476a = "ads_suggested_apps";
        this.f62477b = requestId;
        this.f62478c = i5;
        this.f62479d = j11;
        this.f62480e = sessionId;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Fe)) {
            return false;
        }
        Fe fe2 = (Fe) obj;
        return Intrinsics.b(this.f62476a, fe2.f62476a) && Intrinsics.b(this.f62477b, fe2.f62477b) && this.f62478c == fe2.f62478c && this.f62479d == fe2.f62479d && Intrinsics.b(this.f62480e, fe2.f62480e);
    }

    public final int hashCode() {
        return this.f62480e.hashCode() + C3231k8.a(this.f62479d, C3214j8.a(this.f62478c, C3248l8.a(this.f62477b, this.f62476a.hashCode() * 31, 31), 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SuggestedAppsAdsExtras(api=");
        sb2.append(this.f62476a);
        sb2.append(", requestId=");
        sb2.append(this.f62477b);
        sb2.append(", count=");
        sb2.append(this.f62478c);
        sb2.append(", userId=");
        sb2.append(this.f62479d);
        sb2.append(", sessionId=");
        return Z.a(sb2, this.f62480e, ')');
    }
}
