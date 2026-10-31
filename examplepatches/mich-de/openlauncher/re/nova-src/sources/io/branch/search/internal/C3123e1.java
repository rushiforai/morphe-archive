package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.e1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3123e1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f64357a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final String f64358b;

    /* renamed from: c, reason: collision with root package name */
    @Nullable
    public final String f64359c;

    /* renamed from: d, reason: collision with root package name */
    @Nullable
    public final String f64360d;

    public C3123e1(@NotNull String query, @Nullable String str, @Nullable String str2) {
        Intrinsics.g(query, "query");
        this.f64357a = "firefox";
        this.f64358b = query;
        this.f64359c = str;
        this.f64360d = str2;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3123e1)) {
            return false;
        }
        C3123e1 c3123e1 = (C3123e1) obj;
        return Intrinsics.b(this.f64357a, c3123e1.f64357a) && Intrinsics.b(this.f64358b, c3123e1.f64358b) && Intrinsics.b(this.f64359c, c3123e1.f64359c) && Intrinsics.b(this.f64360d, c3123e1.f64360d);
    }

    public final int hashCode() {
        int iA = C3248l8.a(this.f64358b, this.f64357a.hashCode() * 31, 31);
        String str = this.f64359c;
        int iHashCode = (iA + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f64360d;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("AutoSuggestParams(client=");
        sb2.append(this.f64357a);
        sb2.append(", query=");
        sb2.append(this.f64358b);
        sb2.append(", locale=");
        sb2.append(this.f64359c);
        sb2.append(", network=");
        return Z.a(sb2, this.f64360d, ')');
    }
}
