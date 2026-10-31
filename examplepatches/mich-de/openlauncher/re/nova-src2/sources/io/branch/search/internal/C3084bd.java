package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.bd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3084bd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64030a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64031b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f64032c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f64033d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final List<C3186hd> f64034e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final String f64035f;

    public C3084bd(@NotNull String userQuery, @NotNull String requestId, @NotNull String userQueryNormalize, @NotNull List ssmlApps, @NotNull String sessionId) {
        Intrinsics.g(userQuery, "userQuery");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(userQueryNormalize, "userQueryNormalize");
        Intrinsics.g(ssmlApps, "ssmlApps");
        Intrinsics.g(sessionId, "sessionId");
        this.f64030a = userQuery;
        this.f64031b = requestId;
        this.f64032c = "disco";
        this.f64033d = userQueryNormalize;
        this.f64034e = ssmlApps;
        this.f64035f = sessionId;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3084bd)) {
            return false;
        }
        C3084bd c3084bd = (C3084bd) obj;
        return Intrinsics.b(this.f64030a, c3084bd.f64030a) && Intrinsics.b(this.f64031b, c3084bd.f64031b) && Intrinsics.b(this.f64032c, c3084bd.f64032c) && Intrinsics.b(this.f64033d, c3084bd.f64033d) && Intrinsics.b(this.f64034e, c3084bd.f64034e) && Intrinsics.b(this.f64035f, c3084bd.f64035f);
    }

    public final int hashCode() {
        return this.f64035f.hashCode() + C3265m8.a(this.f64034e, C3248l8.a(this.f64033d, C3248l8.a(this.f64032c, C3248l8.a(this.f64031b, this.f64030a.hashCode() * 31, 31), 31), 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SearchAdsExtras(userQuery=");
        sb2.append(this.f64030a);
        sb2.append(", requestId=");
        sb2.append(this.f64031b);
        sb2.append(", api=");
        sb2.append(this.f64032c);
        sb2.append(", userQueryNormalize=");
        sb2.append(this.f64033d);
        sb2.append(", ssmlApps=");
        sb2.append(this.f64034e);
        sb2.append(", sessionId=");
        return Z.a(sb2, this.f64035f, ')');
    }
}
