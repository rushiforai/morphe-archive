package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.h1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3174h1 {

    /* renamed from: a, reason: collision with root package name */
    public final long f64630a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64631b;

    public C3174h1(@NotNull String userQuery, long j11) {
        Intrinsics.g(userQuery, "userQuery");
        this.f64630a = j11;
        this.f64631b = userQuery;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3174h1)) {
            return false;
        }
        C3174h1 c3174h1 = (C3174h1) obj;
        return this.f64630a == c3174h1.f64630a && Intrinsics.b(this.f64631b, c3174h1.f64631b);
    }

    public final int hashCode() {
        return this.f64631b.hashCode() + (Long.hashCode(this.f64630a) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AutoSuggestRequestData(utcTimestamp=");
        sb2.append(this.f64630a);
        sb2.append(", userQuery=");
        return Z.a(sb2, this.f64631b, ')');
    }
}
