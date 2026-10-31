package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.gd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3169gd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64593a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64594b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final String f64595c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final String f64596d;

    public C3169gd(@NotNull String userQuery, @NotNull String requestId, @NotNull String sessionId) {
        Intrinsics.g(userQuery, "userQuery");
        Intrinsics.g(requestId, "requestId");
        Intrinsics.g(sessionId, "sessionId");
        this.f64593a = userQuery;
        this.f64594b = requestId;
        this.f64595c = "disco";
        this.f64596d = sessionId;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3169gd)) {
            return false;
        }
        C3169gd c3169gd = (C3169gd) obj;
        return Intrinsics.b(this.f64593a, c3169gd.f64593a) && Intrinsics.b(this.f64594b, c3169gd.f64594b) && Intrinsics.b(this.f64595c, c3169gd.f64595c) && Intrinsics.b(this.f64596d, c3169gd.f64596d);
    }

    public final int hashCode() {
        return this.f64596d.hashCode() + C3248l8.a(this.f64595c, C3248l8.a(this.f64594b, this.f64593a.hashCode() * 31, 31), 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SearchDemoAdsExtras(userQuery=");
        sb2.append(this.f64593a);
        sb2.append(", requestId=");
        sb2.append(this.f64594b);
        sb2.append(", api=");
        sb2.append(this.f64595c);
        sb2.append(", sessionId=");
        return Z.a(sb2, this.f64596d, ')');
    }
}
